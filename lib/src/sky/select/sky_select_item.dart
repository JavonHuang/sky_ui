import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class SkySelectItem extends StatefulWidget {
  const SkySelectItem({
    super.key,
    this.onTap,
    required this.label,
    required this.width,
    required this.height,
    required this.iconSize,
    required this.selectColor,
    this.disabled = false,
    this.showIcon = false,
  });
  final Function()? onTap;
  final String label;
  final double width;
  final double height;
  final double iconSize;
  final Color? selectColor;
  final bool disabled;
  final bool showIcon;
  @override
  State<SkySelectItem> createState() => _SkySelectItemState();
}

class _SkySelectItemState extends State<SkySelectItem> {
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
          padding: EdgeInsets.symmetric(horizontal: 20.scaleSpacing, vertical: 0),
          height: widget.height,
          decoration: BoxDecoration(
            color: onHoverColor,
          ),
          width: widget.width,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.label,
                  style: TextStyle(color: widget.selectColor),
                ),
              ),
              Icon(
                color: widget.showIcon ? SkyColors().primary : SkyColors().transparent,
                ElementIcons.check,
                size: widget.iconSize,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
