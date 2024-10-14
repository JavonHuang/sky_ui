import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sky_ui/src/sky/common/sky_hover.dart';
import 'package:sky_ui/src/sky/sky.dart';

import '../../../sky_ui.dart';
import '../common/position_delegate.dart';
part 'popover_overlay.dart';
part 'popover_controller.dart';
part 'model/enum.dart';

class SkyPopover extends StatefulWidget {
  final Widget child;
  final SkyPopoverTrigger trigger;
  final SkyPopoverController? controller;
  final Duration reverseDuration;
  final Duration animDuration;
  const SkyPopover({
    super.key,
    required this.child,
    this.trigger = SkyPopoverTrigger.hover,
    this.controller,
    this.animDuration = const Duration(milliseconds: 250),
    this.reverseDuration = const Duration(milliseconds: 250),
  });

  @override
  State<SkyPopover> createState() => _SkyPopoverState();
}

class _SkyPopoverState extends State<SkyPopover> with TickerProviderStateMixin, WidgetsBindingObserver {
  final OverlayPortalController overlayController = OverlayPortalController(debugLabel: kReleaseMode ? null : 'SkyPopover controller');
  SkyPopoverController? initPopController;
  ScrollPosition? scrollPosition;
  AnimationController? animationInitPopoverController;

  bool get isOpen => overlayController.isShowing;
  SkyPopoverController get popController => widget.controller ?? initPopController!;

  AnimationController get animationPopoverController {
    return animationInitPopoverController ??= AnimationController(
      duration: widget.animDuration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    )..addStatusListener(handleStatusChanged);
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      initPopController = SkyPopoverController();
    }
    WidgetsBinding.instance.addObserver(this);
    popController._attach(this);
  }

  //监听窗口尺寸变化
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    close();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    scrollPosition?.isScrollingNotifier.removeListener(handleScroll);
    scrollPosition = Scrollable.maybeOf(context)?.position;
    scrollPosition?.isScrollingNotifier.addListener(handleScroll);
  }

  @override
  void dispose() {
    if (isOpen) {
      close();
    }
    popController._detach(this);
    initPopController = null;
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void handleScroll() {
    if (mounted) close();
  }

  void handleStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.dismissed) {
      if (isOpen) {
        overlayController.hide();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SkyHover(
      disabled: false,
      onchanged: widget.trigger == SkyPopoverTrigger.hover
          ? (hover) {
              if (hover) {
                open();
              } else {
                close();
              }
            }
          : null,
      child: TapRegion(
        onTapOutside: (PointerDownEvent event) {
          close();
        },
        child: OverlayPortal(
          controller: overlayController,
          overlayChildBuilder: (ctx) {
            final OverlayState overlayState = Overlay.of(context, debugRequiredFor: widget);
            final RenderBox box = this.context.findRenderObject()! as RenderBox;
            Offset target = box.localToGlobal(
              box.size.center(Offset.zero),
              ancestor: overlayState.context.findRenderObject(),
            );
            return _PopoverOverlay(
              target: target,
              boxSize: box.size,
              tapRegionGroup: null,
              animation: animationPopoverController,
            );
          },
          child: widget.child,
        ),
      ),
    );
  }

  void open({Offset? position}) {
    if (isOpen) return;
    animationPopoverController.forward();
    overlayController.show();
  }

  void close() {
    if (!isOpen) return;
    animationPopoverController.reverse();
    overlayController.hide();
  }
}
