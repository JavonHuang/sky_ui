import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class DisplayBlock extends StatelessWidget {
  final List<Widget> children;
  const DisplayBlock({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: SkyColors().baseBorder,
        ),
        borderRadius: SkyBorderRadius().normalBorderRadius,
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
