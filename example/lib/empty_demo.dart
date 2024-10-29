import 'package:flutter/material.dart';

import 'common/display_block.dart';
import 'common/title.dart';
import 'empty_demo/empty_demo_1.dart';
import 'empty_demo/empty_demo_2.dart';
import 'empty_demo/empty_demo_3.dart';

class EmptyDemo extends StatefulWidget {
  const EmptyDemo({super.key});

  @override
  State<EmptyDemo> createState() => _EmptyDemoState();
}

class _EmptyDemoState extends State<EmptyDemo> {
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
          child: EmptyDemo1(),
        ),
        DemoTitle(
          title: "图片尺寸",
          descr: "通过设置 size 属性来控制图片大小。",
        ),
        DisplayBlock(
          description: "",
          child: EmptyDemo2(),
        ),
        DemoTitle(
          title: "底部内容",
          descr: "使用child可在底部插入内容。",
        ),
        DisplayBlock(
          description: "",
          child: EmptyDemo3(),
        ),
      ],
    );
  }
}
