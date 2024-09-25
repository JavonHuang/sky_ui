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
  });
  final TabOption child;
  final EdgeInsetsGeometry? padding;
  final SkyOnWidgetSizeChange onSizeChange;
  final Function()? onTap;

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
        builder: (context, onHover) {
          return Container(
            alignment: Alignment.center,
            padding: widget.padding,
            // color: onHover ? SkyColors().primary : SkyColors().defaultBg,
            child: Text(widget.child.label),
          );
        },
        disabled: false,
      ),
    );
  }
}
