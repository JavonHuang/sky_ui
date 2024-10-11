import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'descriptions_demo/descriptions_demo_1.dart';
import 'descriptions_demo/descriptions_demo_2.dart';
import 'descriptions_demo/descriptions_demo_3.dart';
import 'descriptions_demo/descriptions_demo_4.dart';

class DescriptionsDemo extends StatefulWidget {
  const DescriptionsDemo({super.key});

  @override
  State<DescriptionsDemo> createState() => _DescriptionsDemoState();
}

class _DescriptionsDemoState extends State<DescriptionsDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Descriptions 描述列表",
          descr: "列表形式展示多个字段。",
        ),
        DemoTitle(
          title: "基本用法",
          descr: "",
        ),
        DisplayBlock(
          child: DescriptionsDemo1(),
        ),
        DemoTitle(
          title: "不同尺寸",
        ),
        DisplayBlock(
          child: DescriptionsDemo2(),
        ),
        DemoTitle(
          title: "垂直列表",
        ),
        DisplayBlock(
          child: DescriptionsDemo3(),
        ),
        DemoTitle(
          title: "自定义样式",
          descr: "",
        ),
        DisplayBlock(
          child: DescriptionsDemo4(),
        ),
      ],
    );
  }
}
