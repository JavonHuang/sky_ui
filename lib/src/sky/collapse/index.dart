// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart' hide CrossFadeState;
import 'package:flutter/rendering.dart';
import 'package:sky_ui/sky_ui.dart';
import 'package:sky_ui/src/styles/styles.dart';

typedef AnimatedTitleBuilder = Widget Function(
  BuildContext context,
  Animation<double> anima,
  CollapseController ctrl,
);

class SkyCollapse extends StatefulWidget {
  const SkyCollapse({
    super.key,
    required this.content,
    this.title,
    this.opacityCurve = Curves.linear,
    this.sizeCurve = Curves.linear,
    this.alignment = Alignment.topCenter,
    this.titlePadding = const EdgeInsets.symmetric(vertical: 12.0),
    this.contentPadding = const EdgeInsets.only(top: 0, right: 8, left: 8, bottom: 8),
    required this.duration,
    this.reverseDuration,
    this.titleBuilder,
    this.controller,
    this.onOpen,
    this.onClose,
    this.excludeBottomFocus = true,
  }) : assert(title == null && titleBuilder != null || titleBuilder == null && title != null || titleBuilder != null && title != null);

  final Widget content;
  final Widget? title;
  final VoidCallback? onOpen;
  final VoidCallback? onClose;
  final AnimatedTitleBuilder? titleBuilder;
  final EdgeInsetsGeometry titlePadding;
  final EdgeInsetsGeometry contentPadding;
  final CollapseController? controller;

  final Duration duration;
  final Duration? reverseDuration;
  final Curve opacityCurve;
  final Curve sizeCurve;
  final AlignmentGeometry alignment;
  final bool excludeBottomFocus;

  @override
  State<SkyCollapse> createState() => _SkyCollapseState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AlignmentGeometry>('alignment', alignment, defaultValue: Alignment.topCenter));
    properties.add(IntProperty('duration', duration.inMilliseconds, unit: 'ms'));
    properties.add(IntProperty('reverseDuration', reverseDuration?.inMilliseconds, unit: 'ms', defaultValue: null));
  }
}

class _SkyCollapseState extends State<SkyCollapse> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _firstAnimation;
  late Animation<double> _secondAnimation;

  CollapseController? _internalController;

  CollapseController get _collapseCtrl => widget.controller ?? _internalController!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = CollapseController();
    }
    _collapseCtrl._attach(this);
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    // if (widget.crossFadeState == CrossFadeState.showSecond) {
    //   _controller.value = 1.0;
    // }
    _firstAnimation = _initAnimation(Curves.linear, true);
    _secondAnimation = _initAnimation(widget.opacityCurve, false);
    _controller.addStatusListener((AnimationStatus status) {
      setState(() {
        // Trigger a rebuild because it depends on _isTransitioning, which
        // changes its value together with animation status.
      });
    });
  }

  Animation<double> _initAnimation(Curve curve, bool inverted) {
    Animation<double> result = _controller.drive(CurveTween(curve: curve));
    if (inverted) {
      result = result.drive(Tween<double>(begin: 1.0, end: 0.0));
    }
    return result;
  }

  @override
  void dispose() {
    _controller.dispose();
    _collapseCtrl._detach(this);
    super.dispose();
  }

  @override
  void didUpdateWidget(SkyCollapse oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
    }
    if (widget.reverseDuration != oldWidget.reverseDuration) {
      _controller.reverseDuration = widget.reverseDuration;
    }
    if (widget.opacityCurve != oldWidget.opacityCurve) {
      _secondAnimation = _initAnimation(widget.opacityCurve, false);
    }
  }

  /// Whether we're in the middle of cross-fading this frame.
  bool get _isTransitioning => _controller.status == AnimationStatus.forward || _controller.status == AnimationStatus.reverse;

  bool get _isOpen => _controller.value == 1.0;

  @override
  Widget build(BuildContext context) {
    const Key closeKey = ValueKey(false);
    const Key openKey = ValueKey(true);
    final bool transitioningForwards = _controller.status == AnimationStatus.completed || _controller.status == AnimationStatus.forward;
    final Key topKey;
    Widget topChild;
    final Animation<double> topAnimation;
    final Key bottomKey;
    Widget bottomChild;
    final Animation<double> bottomAnimation;
    if (transitioningForwards) {
      topKey = openKey;
      topChild = Align(
        alignment: Alignment.topLeft,
        child: Padding(padding: widget.contentPadding, child: widget.content),
      );
      topAnimation = _secondAnimation;
      bottomKey = closeKey;
      bottomChild = Container(
        height: 0,
      );
      bottomAnimation = _firstAnimation;
    } else {
      topKey = closeKey;
      topChild = Container(
        height: 0,
      );
      topAnimation = _firstAnimation;
      bottomKey = openKey;
      bottomChild = Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: widget.contentPadding,
          child: widget.content,
        ),
      );
      bottomAnimation = _secondAnimation;
    }

    bottomChild = TickerMode(
      key: bottomKey,
      enabled: _isTransitioning,
      child: IgnorePointer(
        child: ExcludeSemantics(
          // Always exclude the semantics of the widget that's fading out.
          child: ExcludeFocus(
            excluding: widget.excludeBottomFocus,
            child: FadeTransition(
              opacity: bottomAnimation,
              child: bottomChild,
            ),
          ),
        ),
      ),
    );
    topChild = TickerMode(
      key: topKey,
      enabled: true, // Top widget always has its animations enabled.
      child: IgnorePointer(
        ignoring: false,
        child: ExcludeSemantics(
          excluding: false,
          // Always publish semantics for the widget that's fading in.
          child: ExcludeFocus(
            excluding: false,
            child: FadeTransition(
              opacity: topAnimation,
              child: topChild,
            ),
          ),
        ),
      ),
    );
    Widget title;
    if (widget.titleBuilder != null) {
      title = widget.titleBuilder!(context, _controller, _collapseCtrl);
    } else {
      title = GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _toggleCodePanel();
          },
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: widget.titlePadding,
                  child: widget.title,
                ),
              ),
              // Spacer(),
              AnimatedBuilder(
                animation: _controller,
                builder: (_, child) => Transform.rotate(
                  angle: pi * _controller.value / 2,
                  child: child,
                ),
                child: Icon(
                  ElementIcons.arrowRight,
                  size: SkyIconSizes().mediumFont,
                ),
              )
            ],
          ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title,
        ClipRect(
          child: AnimatedSize(
            alignment: widget.alignment,
            duration: widget.duration,
            reverseDuration: widget.reverseDuration,
            curve: widget.sizeCurve,
            child: defaultLayoutBuilder(topChild, topKey, bottomChild, bottomKey),
          ),
        ),
      ],
    );
  }

  Widget defaultLayoutBuilder(Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          key: bottomChildKey,
          left: 0.0,
          top: 0.0,
          right: 0.0,
          child: bottomChild,
        ),
        Positioned(
          key: topChildKey,
          child: topChild,
        ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    // description.add(EnumProperty<CrossFadeState>('crossFadeState', widget.crossFadeState));
    description.add(DiagnosticsProperty<AnimationController>('controller', _controller, showName: false));
    description.add(DiagnosticsProperty<AlignmentGeometry>('alignment', widget.alignment, defaultValue: Alignment.topCenter));
  }

  void _close() {
    widget.onClose?.call();
    _controller.reverse();
  }

  void _open() {
    widget.onOpen?.call();
    _controller.forward();
  }

  // 折叠代码面板
  void _toggleCodePanel() {
    if (_isOpen) {
      _close();
    } else {
      _open();
    }
  }
}

class CollapseController {
  _SkyCollapseState? _state;

  bool get isOpen {
    assert(_state != null);
    return _state!._isOpen;
  }

  void toggle() {
    if (isOpen) {
      close();
    } else {
      open();
    }
  }

  void close() {
    assert(_state != null);
    _state!._close();
  }

  void open() {
    assert(_state != null);
    _state!._open();
  }

  void _attach(_SkyCollapseState state) {
    _state = state;
  }

  void _detach(_SkyCollapseState state) {
    if (_state == state) {
      _state = null;
    }
  }
}
