import 'package:flutter/material.dart';
import 'alert_demo/alert_demo_1.dart';
import 'alert_demo/alert_demo_2.dart';
import 'alert_demo/alert_demo_3.dart';
import 'alert_demo/alert_demo_4.dart';
import 'alert_demo/alert_demo_5.dart';
import 'alert_demo/alert_demo_6.dart';
import 'alert_demo/alert_demo_7.dart';
import 'common/display_block.dart';
import 'common/title.dart';

class AlertDemo extends StatefulWidget {
  const AlertDemo({super.key});

  @override
  State<AlertDemo> createState() => _AlertDemoState();
}

class _AlertDemoState extends State<AlertDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DemoTitle(
          title: "Alert 警告",
          descr: "用于页面中展示重要的提示信息。",
        ),
        DemoTitle(
          title: "基本用法",
          descr: "页面中的非浮层元素，不会自动消失。",
        ),
        DisplayBlock(
          description: "Alert 组件提供四种主题，由type属性指定，默认值为info。",
          path: "alert_demo_1",
          child: AlertDemo1(),
        ),
        DemoTitle(
          title: "主题",
          descr: "Alert 组件提供了两个不同的主题：light和dark。",
        ),
        DisplayBlock(
          description: "通过设置effect属性来改变主题，默认为light。",
          path: "alert_demo_2",
          child: AlertDemo2(),
        ),
        DemoTitle(
          title: "自定义关闭按钮",
          descr: "自定义关闭按钮为文字或其他符号。",
        ),
        DisplayBlock(
          description: "在 Alert 组件中，你可以设置是否可关闭，关闭按钮的文本以及关闭时的回调函数。closable属性决定是否可关闭，接受boolean，默认为true。你可以设置closeText属性来代替右侧的关闭图标，注意：closeText必须为文本。设置close事件来设置关闭时的回调。",
          path: "alert_demo_3",
          child: AlertDemo3(),
        ),
        DemoTitle(
          title: "带有 icon",
          descr: "表示某种状态时提升可读性。",
        ),
        DisplayBlock(
          description: "通过设置showIcon属性来显示 Alert 的 icon，这能更有效地向用户展示你的显示意图。",
          path: "alert_demo_4",
          child: AlertDemo4(),
        ),
        DemoTitle(
          title: "文字居中",
          descr: "使用 center 属性让文字水平居中。",
        ),
        DisplayBlock(
          path: "alert_demo_5",
          child: AlertDemo5(),
        ),
        DemoTitle(
          title: "带有辅助性文字介绍",
          descr: "包含标题和内容，解释更详细的警告。",
        ),
        DisplayBlock(
          path: "alert_demo_6",
          child: AlertDemo6(),
        ),
        DemoTitle(
          title: "带有 icon 和辅助性文字介绍",
          descr: "",
        ),
        DisplayBlock(
          path: "alert_demo_7",
          child: AlertDemo7(),
        ),
      ],
    );
  }
}
