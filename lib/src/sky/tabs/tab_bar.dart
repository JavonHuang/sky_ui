import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'index.dart';

class SkyTabBar extends StatefulWidget {
  const SkyTabBar({
    super.key,
    required this.child,
  });
  final TabOption child;

  @override
  State<SkyTabBar> createState() => _SkyTabBarState();
}

class _SkyTabBarState extends State<SkyTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.child.label),
    );
  }
}
