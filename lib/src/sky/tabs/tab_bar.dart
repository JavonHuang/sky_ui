import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'dart:math' as math;

import '../common/measure_size.dart';
import '../common/sky_hover.dart';
import 'index.dart';

class SkyTabBar extends StatefulWidget {
  const SkyTabBar({
    super.key,
    required this.child,
    this.padding,
  });
  final TabOption child;
  final EdgeInsetsGeometry? padding;
  @override
  State<SkyTabBar> createState() => _SkyTabBarState();
}

class _SkyTabBarState extends State<SkyTabBar> {
  @override
  Widget build(BuildContext context) {
    return TekMeasureSize(
      onChange: (Size size) {
        print(size);
      },
      child: SkyHover(
        builder: (context, onHover) {
          return Container(
            alignment: Alignment.center,
            padding: widget.padding,
            color: onHover ? SkyColors().primary : SkyColors().defaultBg,
            child: Text(widget.child.label),
          );
        },
        disabled: false,
      ),
    );
  }
}
