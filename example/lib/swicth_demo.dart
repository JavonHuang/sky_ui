import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'swicth_demo/swicth_demo_1.dart';
import 'swicth_demo/swicth_demo_2.dart';
import 'swicth_demo/swicth_demo_3.dart';
import 'swicth_demo/swicth_demo_4.dart';

class SwicthDemo extends StatefulWidget {
  const SwicthDemo({super.key});

  @override
  State<SwicthDemo> createState() => _SwicthDemoState();
}

class _SwicthDemoState extends State<SwicthDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Switch 开关",
          descr: "表示两种相互对立的状态间的切换，多用于触发「开/关」。",
        ),
        DemoTitle(
          title: "基本用法",
          descr: "",
        ),
        DisplayBlock(
          description: "绑定model到一个Boolean类型的变量。可以使用active-color属性与inactive-color属性来设置开关的背景色。",
          path: "swicth_demo_1",
          child: SwicthDemo1(),
        ),
        DemoTitle(
          title: "文字描述",
          descr: "",
        ),
        DisplayBlock(
          description: "使用active-text属性与inactive-text属性来设置开关的文字描述。",
          path: "swicth_demo_2",
          child: SwicthDemo2(),
        ),
        DemoTitle(
          title: "扩展的 value 类型",
          descr: "",
        ),
        DisplayBlock(
          description: "设置active-value和inactive-value属性，接受Boolean, String或Number类型的值。",
          path: "swicth_demo_3",
          child: SwicthDemo3(),
        ),
        DemoTitle(
          title: "禁用状态",
          descr: "",
        ),
        DisplayBlock(
          path: "swicth_demo_4",
          child: SwicthDemo4(),
        ),
      ],
    );
  }
}
