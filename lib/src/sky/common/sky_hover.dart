import 'package:flutter/material.dart';

class SkyHover extends StatefulWidget {
  const SkyHover({
    super.key,
    this.builder,
    this.child,
    required this.disabled,
    this.onTap,
    this.onchanged,
    this.alignment = Alignment.centerLeft,
  });
  final bool disabled;

  final Widget? Function(BuildContext context, bool onHover, void Function(bool e) setvalue)? builder;
  final Widget? child;
  final Function()? onTap;
  final Function(bool e)? onchanged;
  final AlignmentGeometry? alignment;
  @override
  State<SkyHover> createState() => _SkyHoverState();
}

class _SkyHoverState extends State<SkyHover> {
  late bool onHover = false;

  void _setValue(bool e) {
    setState(() {
      onHover = e;
    });
    widget.onchanged?.call(e);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (e) {
        if (widget.disabled) {
          return;
        }
        widget.onTap?.call();
      },
      child: MouseRegion(
        cursor: widget.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        onEnter: (e) {
          if (widget.disabled) {
            if (onHover) {
              _setValue(false);
            }

            return;
          }
          _setValue(true);
        },
        onExit: (e) {
          if (widget.disabled) {
            if (onHover) {
              _setValue(false);
            }
            return;
          }

          _setValue(false);
        },
        child: widget.child ?? widget.builder?.call(context, onHover, _setValue),
      ),
    );
  }
}
