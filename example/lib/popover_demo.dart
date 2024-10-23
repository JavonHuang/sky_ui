import 'package:flutter/material.dart';

import 'common/display_block.dart';
import 'common/title.dart';
import 'popover_demo/popover_demo_1.dart';
import 'popover_demo/popover_demo_2.dart';

class PopoverDemo extends StatefulWidget {
  const PopoverDemo({super.key});

  @override
  State<PopoverDemo> createState() => _PopoverDemoState();
}

class _PopoverDemoState extends State<PopoverDemo> {
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
          child: PopoverDemo1(),
        ),
        DemoTitle(
          title: "显示位置",
          descr: "",
        ),
        DisplayBlock(
          description: "",
          child: PopoverDemo2(),
        ),
      ],
    );
  }
}
