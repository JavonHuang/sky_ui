import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'select_demo/select_demo_1.dart';
import 'select_demo/select_demo_2.dart';
import 'select_demo/select_demo_3.dart';
import 'select_demo/select_demo_4.dart';
import 'select_demo/select_demo_5.dart';

class SelectDemo extends StatefulWidget {
  const SelectDemo({super.key});

  @override
  State<SelectDemo> createState() => _SelectDemoState();
}

class _SelectDemoState extends State<SelectDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Select 选择器",
          descr: "当选项过多时，使用下拉菜单展示并选择内容。",
        ),
        DemoTitle(
          title: "基础用法",
          descr: "适用广泛的基础单选",
        ),
        DisplayBlock(
          description: "",
          path: "select_demo_1",
          child: SelectDemo1(),
        ),
        DemoTitle(
          title: "有禁用选项",
          descr: "",
        ),
        DisplayBlock(
          description: "",
          path: "select_demo_2",
          child: SelectDemo2(),
        ),
        DemoTitle(
          title: "禁用状态",
          descr: "选择器不可用状态",
        ),
        DisplayBlock(
          description: "",
          path: "select_demo_3",
          child: SelectDemo3(),
        ),
        DemoTitle(
          title: "可清空单选",
          descr: "包含清空按钮，可将选择器清空为初始状态",
        ),
        DisplayBlock(
          description: "",
          path: "select_demo_4",
          child: SelectDemo4(),
        ),
        DemoTitle(
          title: "基础多选",
          descr: "适用性较广的基础多选，用 Tag 展示已选项",
        ),
        DisplayBlock(
          description: "",
          path: "select_demo_5",
          child: SelectDemo5(),
        ),
      ],
    );
  }
}
