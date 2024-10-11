import 'package:flutter/material.dart';
import 'button_demo/button_demo_1.dart';
import 'button_demo/button_demo_2.dart';
import 'button_demo/button_demo_3.dart';
import 'button_demo/button_demo_4.dart';
import 'button_demo/button_demo_5.dart';
import 'button_demo/button_demo_6.dart';
import 'button_demo/button_demo_7.dart';
import 'common/display_block.dart';
import 'common/title.dart';

class ButtonDemo extends StatefulWidget {
  const ButtonDemo({super.key});

  @override
  State<ButtonDemo> createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "基础用法",
          descr: "常用的操作按钮。",
        ),
        DisplayBlock(
          child: ButtonDemo1(),
        ),
        DemoTitle(
          title: "禁用状态",
          descr: "按钮不可用状态。",
        ),
        DisplayBlock(
          child: ButtonDemo2(),
        ),
        DemoTitle(
          title: "文字按钮",
          descr: "没有边框和背景色的按钮。",
        ),
        DisplayBlock(
          child: ButtonDemo3(),
        ),
        DemoTitle(
          title: "图标按钮",
          descr: "带图标的按钮可增强辨识度（有文字）或节省空间（无文字）。",
        ),
        DisplayBlock(
          child: ButtonDemo4(),
        ),
        DemoTitle(
          title: "按钮组",
          descr: "以按钮组的方式出现，常用于多项类似操作。",
        ),
        DisplayBlock(
          child: ButtonDemo5(),
        ),
        DemoTitle(
          title: "加载中",
          descr: "点击按钮后进行数据加载操作，在按钮上显示加载状态。",
        ),
        DisplayBlock(
          child: ButtonDemo6(),
        ),
        DemoTitle(
          title: "不同尺寸",
          descr: "Button 组件提供除了默认值以外的三种尺寸，可以在不同场景下选择合适的按钮尺寸。",
        ),
        DisplayBlock(
          child: ButtonDemo7(),
        ),
      ],
    );
  }
}
