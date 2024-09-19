import 'package:flutter/material.dart';

import '../../styles/styles.dart';
import '../../utils/utils.dart';

class SkyInputOutLineHover extends StatefulWidget {
  const SkyInputOutLineHover({
    super.key,
    this.builder,
    this.child,
    required this.disabled,
    this.onTap,
    this.size = SkySize.small,
    this.highlightBuilder,
    this.onchanged,
  });
  final bool disabled;
  final Widget? Function(BuildContext context)? builder;
  final Widget? child;
  final Function()? onTap;
  final SkySize size;
  final bool Function()? highlightBuilder;
  final Function(bool e)? onchanged;

  @override
  State<SkyInputOutLineHover> createState() => _SkyInputOutLineHoverState();
}

class _SkyInputOutLineHoverState extends State<SkyInputOutLineHover> {
  late bool onHover = false;
  Color? get onHoverColor {
    if (widget.disabled) {
      return SkyColors().white;
    }
    if (onHover) {
      return SkyColors().defaultBg;
    }
    return SkyColors().white;
  }

  Color get outLineBorder {
    if (widget.highlightBuilder != null && widget.highlightBuilder!.call()) {
      return SkyColors().primary;
    }
    return onHover ? SkyColors().placeholderText : SkyColors().baseBorder;
  }

  void _setValue(bool e) {
    setState(() {
      onHover = e;
    });
    widget.onchanged?.call(e);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: outLineBorder,
        ),
        borderRadius: SkyBorderRadius().normalBorderRadius,
      ),
      child: MouseRegion(
        cursor: widget.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        onEnter: (e) {
          if (widget.disabled) {
            return;
          }
          _setValue(true);
        },
        onExit: (e) {
          if (widget.disabled) {
            return;
          }
          _setValue(false);
        },
        child: widget.child ?? widget.builder?.call(context),
      ),
    );
  }
}
