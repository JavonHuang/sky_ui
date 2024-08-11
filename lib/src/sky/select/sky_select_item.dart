import 'package:flutter/material.dart';

import '../../styles/styles.dart';

class SkySelectItem extends StatefulWidget {
  const SkySelectItem({
    super.key,
    this.onTap,
    required this.label,
    required this.width,
    required this.selectColor,
    required this.disabled,
  });
  final Function()? onTap;
  final String label;
  final double width;
  final Color? selectColor;
  final bool disabled;
  @override
  State<SkySelectItem> createState() => _SkySelectItemState();
}

class _SkySelectItemState extends State<SkySelectItem> {
  late bool onHover = false;
  Color? get onHoverColor {
    if (onHover) {
      return SkyColors().primary.withOpacity(0.4);
    }
    return SkyColors().white;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
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
          decoration: BoxDecoration(
            color: onHoverColor,
          ),
          width: widget.width,
          child: Text(
            widget.label,
            style: TextStyle(color: widget.selectColor),
          ),
        ),
      ),
    );
  }
}
