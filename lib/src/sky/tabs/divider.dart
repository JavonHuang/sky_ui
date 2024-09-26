import 'package:flutter/material.dart';
import 'package:sky_ui/src/styles/styles.dart';

class TabDivider extends StatefulWidget {
  const TabDivider({super.key});

  @override
  State<TabDivider> createState() => TabDividerState();
}

class TabDividerState extends State<TabDivider> {
  late double offsetX = 0;
  late double offsetWidth = 0;

  @override
  void initState() {
    super.initState();
  }

  void movedOffsetX(double e, double w) {
    setState(() {
      offsetX = e;
      offsetWidth = w;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 2,
          color: SkyColors().transparent,
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          // curve: Curves.elasticInOut,
          left: offsetX, // 开始位置
          // right: 150.0, // 结束位置
          child: Container(
            color: SkyColors().primary,
            height: 2,
            width: offsetWidth,
          ),
        ),
      ],
    );
  }
}
