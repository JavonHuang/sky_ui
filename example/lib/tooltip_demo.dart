import 'package:flutter/material.dart';

import 'common/display_block.dart';
import 'common/title.dart';
import 'menu_demo/menu_demo_1.dart';
import 'tooltip_demo/tooltip_demo_1.dart';

class TooltipDemo extends StatefulWidget {
  const TooltipDemo({super.key});

  @override
  State<TooltipDemo> createState() => _TooltipDemoState();
}

class _TooltipDemoState extends State<TooltipDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Popover 弹出框",
          descr: "文字链接",
        ),
        DemoTitle(
          title: "基础用法",
          descr: "",
        ),
        DisplayBlock(
          description: "",
          child: TooltipDemo1(),
        ),
      ],
    );
  }
}
