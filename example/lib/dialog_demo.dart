import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'dialog_demo/dialog_demo_1.dart';
import 'dialog_demo/dialog_demo_2.dart';
import 'dialog_demo/dialog_demo_3.dart';
import 'dialog_demo/dialog_demo_4.dart';

class DialogDemo extends StatefulWidget {
  const DialogDemo({super.key});

  @override
  State<DialogDemo> createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  @override
  void initState() {
    super.initState();
    OverlayLayout().initPosition(
      top: 20,
      right: 20,
      width: 400,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Dialog 对话框",
          descr: "在保留当前页面状态的情况下，告知用户并承载相关操作。",
        ),
        DemoTitle(
          title: "基本用法",
          descr: "Dialog 弹出一个对话框，适合需要定制性更大的场景。",
        ),
        DisplayBlock(
          path: "dialog_demo_1",
          description: "当用户进行操作时会被触发，该对话框中断用户操作，直到用户确认知晓后才可关闭。",
          child: DialogDemo1(),
        ),
        DemoTitle(
          title: "自定义页脚",
          descr: "用户可在根据业务需求，自定义页脚按钮",
        ),
        DisplayBlock(
          path: "dialog_demo_2",
          child: DialogDemo2(),
        ),
        DemoTitle(
          title: "嵌套的 Dialog",
          descr: "如果需要在一个 Dialog 内部嵌套另一个 Dialog，在相应事件内创建新的实例。",
        ),
        DisplayBlock(
          path: "dialog_demo_3",
          child: DialogDemo3(),
        ),
        DemoTitle(
          title: "跨组件信息传递",
          descr: "用户可在自定义组件中将信息共享给弹窗，并通过弹窗回传给调用处的父级节点",
        ),
        DisplayBlock(
          path: "dialog_demo_5",
          child: DialogDemo5(),
        ),
      ],
    );
  }
}
