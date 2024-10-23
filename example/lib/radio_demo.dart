import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'radio_demo/radio_demo_1.dart';
import 'radio_demo/radio_demo_2.dart';
import 'radio_demo/radio_demo_3.dart';
import 'radio_demo/radio_demo_4.dart';
import 'radio_demo/radio_demo_5.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({super.key});

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Radio 单选框",
          descr: "一组备选项中进行单选",
        ),
        DemoTitle(
          title: "基础用法",
          descr: "由于选项默认可见，不宜过多，若选项过多，建议使用 Select 选择器。",
        ),
        DisplayBlock(
          description: "要使用 Radio 组件，只需要设置model绑定变量，选中意味着变量的值为相应 Radio label属性的值，label仅限String",
          child: RadioDemo1(),
        ),
        DemoTitle(
          title: "禁用状态",
          descr: "单选框不可用的状态。",
        ),
        DisplayBlock(
          child: RadioDemo2(),
        ),
        DemoTitle(
          title: "单选框组",
          descr: "适用于在多个互斥的选项中选择的场景",
        ),
        DisplayBlock(
          child: RadioDemo3(),
        ),
        DemoTitle(
          title: "按钮样式",
          descr: "按钮样式的单选组合。",
        ),
        DisplayBlock(
          description: "设置border属性可以渲染为带有边框的单选框。",
          child: RadioDemo4(),
        ),
        DemoTitle(
          title: "带有边框",
          descr: "",
        ),
        DisplayBlock(
          description: "设置border属性可以渲染为带有边框的单选框。",
          child: RadioDemo5(),
        ),
      ],
    );
  }
}
