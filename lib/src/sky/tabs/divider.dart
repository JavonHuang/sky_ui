import 'package:flutter/material.dart';
import 'package:sky_ui/src/styles/styles.dart';

class TabDivider extends StatefulWidget {
  const TabDivider({super.key});

  @override
  State<TabDivider> createState() => _TabDividerState();
}

class _TabDividerState extends State<TabDivider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 2,
          color: SkyColors().transparent,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            height: 2,
            width: 60,
            color: SkyColors().primary,
          ),
        ),
      ],
    );
  }
}
