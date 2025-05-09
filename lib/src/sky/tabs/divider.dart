import 'package:flutter/material.dart';
import 'package:sky_ui/src/styles/styles.dart';

import 'index.dart';

class TabDivider extends StatefulWidget {
  const TabDivider({
    super.key,
    required this.type,
  });
  final SkyTabType type;

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

  void movedOffsetX(double e, double w, bool start, bool end) {
    setState(() {
      offsetX = start ? e : e + 20;
      offsetWidth = (start || end ? w - 20 : w - 40);
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
            color: widget.type.dividerColor,
            height: 2,
            width: offsetWidth,
          ),
        ),
      ],
    );
  }
}
