import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'common/display_block.dart';
import 'common/space.dart';
import 'common/title.dart';
import 'layout_demo/layout_demo_1.dart';
import 'layout_demo/layout_demo_2.dart';
import 'layout_demo/layout_demo_3.dart';
import 'layout_demo/layout_demo_4.dart';
import 'layout_demo/layout_demo_5.dart';

class LayoutDemo extends StatefulWidget {
  const LayoutDemo({super.key});

  @override
  State<LayoutDemo> createState() => _LayoutDemoState();
}

class _LayoutDemoState extends State<LayoutDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Layout 布局",
          descr: "通过基础的 24 分栏，迅速简便地创建布局。",
        ),
        DemoTitle(
          title: "基础布局",
          descr: "使用单一分栏创建基础的栅格布局。",
        ),
        DisplayBlock(
          child: LayoutDemo1(),
        ),
        DemoTitle(
          title: "分栏间隔",
          descr: "分栏之间存在间隔。",
        ),
        DisplayBlock(
          description: "SkyRow 组件 提供 gutter 属性来指定每一栏之间的间隔，默认间隔为 0。",
          child: LayoutDemo2(),
        ),
        DemoTitle(
          title: "混合布局",
          descr: "通过基础的 1/24 分栏任意扩展组合形成较为复杂的混合布局。",
        ),
        DisplayBlock(
          child: LayoutDemo3(),
        ),
        DemoTitle(
          title: "分栏偏移",
          descr: "支持偏移指定的栏数。",
        ),
        DisplayBlock(
          child: LayoutDemo4(),
        ),
        DemoTitle(
          title: "对齐方式",
          descr: "通过 Wrap 布局来对分栏进行灵活的对齐。",
        ),
        DisplayBlock(
          description: "通过 Wrap 布局,及 crossAxisAlignment 属性来指定 start, center, end, 其中的值来定义子元素的排版方式。",
          child: LayoutDemo5(),
        ),
      ],
    );
  }
}
