import 'package:flutter/material.dart';
import 'collapse_demo/collapse_demo_1.dart';
import 'common/display_block.dart';
import 'common/title.dart';

class CollapseDemo extends StatefulWidget {
  const CollapseDemo({super.key});

  @override
  State<CollapseDemo> createState() => _CollapseDemoState();
}

class _CollapseDemoState extends State<CollapseDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Collapse 折叠面板",
          descr: "通过折叠面板收纳内容区域",
        ),
        DemoTitle(
          title: "基础用法",
          descr: "可同时展开多个面板，面板之间不影响",
        ),
        DisplayBlock(
          child: CollapseDemo1(),
        ),
      ],
    );
  }
}
