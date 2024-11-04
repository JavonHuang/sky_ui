import 'package:flutter/material.dart';
import 'badge_demo/badge_demo_1.dart';
import 'badge_demo/badge_demo_2.dart';
import 'common/display_block.dart';
import 'common/title.dart';

class BadgeDemo extends StatefulWidget {
  const BadgeDemo({super.key});

  @override
  State<BadgeDemo> createState() => _BadgeDemoState();
}

class _BadgeDemoState extends State<BadgeDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Badge 标记",
          descr: "出现在按钮、图标旁的数字或状态标记。",
        ),
        DemoTitle(
          title: "基础用法",
          descr: "展示新消息数量。",
        ),
        DisplayBlock(
          description: "Alert 组件提供四种主题，由type属性指定，默认值为info。",
          path: "badge_demo_1",
          child: BadgeDemo1(),
        ),
        DemoTitle(
          title: "小红点",
          descr: "以红点的形式标注需要关注的内容。",
        ),
        DisplayBlock(
          path: "badge_demo_2",
          child: BadgeDemo2(),
        ),
      ],
    );
  }
}
