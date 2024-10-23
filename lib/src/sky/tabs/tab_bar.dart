import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/measure_size.dart';
import '../common/sky_hover.dart';

class SkyTabBar extends StatefulWidget {
  const SkyTabBar({
    super.key,
    required this.child,
    this.padding,
    required this.onSizeChange,
    this.onTap,
    required this.controller,
    this.decoration,
  });
  final TabOption child;
  final EdgeInsetsGeometry? padding;
  final SkyOnWidgetSizeChange onSizeChange;
  final Function()? onTap;
  final SKyTabsController controller;
  final Decoration? decoration;
  @override
  State<SkyTabBar> createState() => _SkyTabBarState();
}

class _SkyTabBarState extends State<SkyTabBar> {
  @override
  Widget build(BuildContext context) {
    return TekMeasureSize(
      onChange: widget.onSizeChange,
      child: SkyHover(
        onTap: widget.onTap,
        builder: (context, onHover, setvalue) {
          return Container(
            alignment: Alignment.center,
            padding: widget.padding,
            decoration: widget.decoration,
            child: Text(
              widget.child.label,
              style: TextStyle(
                color: onHover || widget.controller.activeKey == widget.child.name ? SkyColors().primary : SkyColors().primaryText,
                fontSize: SkyFontSizes().textFont,
              ),
            ),
          );
        },
        disabled: false,
      ),
    );
  }
}
