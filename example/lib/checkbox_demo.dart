import 'package:flutter/material.dart';
import 'checkbox_demo/checkbox_demo_1.dart';
import 'checkbox_demo/checkbox_demo_2.dart';
import 'checkbox_demo/checkbox_demo_3.dart';
import 'checkbox_demo/checkbox_demo_4.dart';
import 'checkbox_demo/checkbox_demo_5.dart';
import 'checkbox_demo/checkbox_demo_6.dart';
import 'checkbox_demo/checkbox_demo_7.dart';
import 'common/display_block.dart';
import 'common/title.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({super.key});

  @override
  State<CheckboxDemo> createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Checkbox 多选框",
          descr: "一组备选项中进行多选",
        ),
        DemoTitle(
          title: "基础用法",
          descr: "单独使用可以表示两种状态之间的切换，写在标签中的内容为 checkbox 按钮后的介绍。",
        ),
        DisplayBlock(
          child: CheckboxDemo1(),
        ),
        DemoTitle(
          title: "禁用状态",
          descr: "多选框不可用状态。",
        ),
        DisplayBlock(
          child: CheckboxDemo2(),
        ),
        DemoTitle(
          title: "多选框组",
          descr: "适用于多个勾选框绑定到同一个数组的情景，通过是否勾选来表示这一组选项中选中的项。",
        ),
        DisplayBlock(
          child: CheckboxDemo3(),
        ),
        DemoTitle(
          title: "indeterminate 状态",
          descr: "indeterminate 属性用以表示 checkbox 的不确定状态，一般用于实现全选的效果",
        ),
        DisplayBlock(
          child: CheckboxDemo4(),
        ),
        DemoTitle(
          title: "可选项目数量的限制",
          descr: "使用 min 和 max 属性能够限制可以被勾选的项目的数量。",
        ),
        DisplayBlock(
          child: CheckboxDemo5(),
        ),
        DemoTitle(
          title: "按钮样式",
          descr: "按钮样式的多选组合。",
        ),
        DisplayBlock(
          child: CheckboxDemo6(),
        ),
        DemoTitle(
          title: "带有边框",
          descr: "",
        ),
        DisplayBlock(
          child: CheckboxDemo7(),
        ),
      ],
    );
  }
}
