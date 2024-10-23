import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'tag_demo/tag_demo_1.dart';
import 'tag_demo/tag_demo_2.dart';
import 'tag_demo/tag_demo_3.dart';
import 'tag_demo/tag_demo_4.dart';

class TagDemo extends StatefulWidget {
  const TagDemo({super.key});

  @override
  State<TagDemo> createState() => _TagDemoState();
}

class _TagDemoState extends State<TagDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Tag 标签",
          descr: "用于标记和选择。",
        ),
        DemoTitle(
          title: "基础用法",
        ),
        DisplayBlock(
          description: "由type属性来选择tag的类型，也可以通过color属性来自定义背景色。",
          child: TagDemo1(),
        ),
        DemoTitle(
          title: "可移除标签",
        ),
        DisplayBlock(
          description: "设置closable属性可以定义一个标签是否可移除。默认的标签移除时会附带渐变动画，如果不想使用，",
          child: TagDemo2(),
        ),
        DemoTitle(
          title: "不同尺寸",
        ),
        DisplayBlock(
          description: "Tag 组件提供除了默认值以外的三种尺寸，可以在不同场景下选择合适的按钮尺寸。",
          child: TagDemo3(),
        ),
        DemoTitle(
          title: "不同主题",
        ),
        DisplayBlock(
          child: TagDemo4(),
        ),
      ],
    );
  }
}
