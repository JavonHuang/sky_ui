import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class SkyHover extends StatefulWidget {
  const SkyHover({
    super.key,
    this.builder,
    this.child,
    required this.disabled,
    this.showBackgroup = true,
    this.onTap,
    this.onchanged,
    this.alignment = Alignment.centerLeft,
  });
  final bool disabled;
  final bool showBackgroup;

  final Widget? Function(BuildContext context, bool onHover)? builder;
  final Widget? child;
  final Function()? onTap;
  final Function(bool e)? onchanged;
  final AlignmentGeometry? alignment;

  @override
  State<SkyHover> createState() => _SkyHoverState();
}

class _SkyHoverState extends State<SkyHover> {
  late bool onHover = false;
  Color? get onHoverColor {
    if (widget.disabled) {
      return SkyColors().white;
    }
    if (onHover && widget.showBackgroup) {
      return SkyColors().defaultBg;
    }
    return SkyColors().transparent;
  }

  void _setValue(bool e) {
    setState(() {
      onHover = e;
    });
    widget.onchanged?.call(e);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.disabled) {
          return;
        }
        widget.onTap?.call();
      },
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
        child: Container(
          alignment: widget.alignment,
          decoration: BoxDecoration(
            color: onHoverColor,
          ),
          child: widget.child ?? widget.builder?.call(context, onHover),
        ),
      ),
    );
  }
}
