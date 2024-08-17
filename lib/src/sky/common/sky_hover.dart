import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class SkyHover extends StatefulWidget {
  const SkyHover({
    super.key,
    this.builder,
    this.child,
    required this.disabled,
    this.onTap,
  });
  final bool disabled;
  final Widget? Function(BuildContext context)? builder;
  final Widget? child;
  final Function()? onTap;

  @override
  State<SkyHover> createState() => _SkyHoverState();
}

class _SkyHoverState extends State<SkyHover> {
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
          setState(() {
            onHover = true;
          });
        },
        onExit: (e) {
          if (widget.disabled) {
            return;
          }
          setState(() {
            onHover = false;
          });
        },
        child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: onHoverColor,
          ),
          child: widget.child ?? widget.builder?.call(context),
        ),
      ),
    );
  }
}
