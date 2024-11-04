import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'message_box_demo/message_box_demo_1.dart';
import 'message_box_demo/message_box_demo_2.dart';
import 'message_box_demo/message_box_demo_3.dart';

class MessageBoxDemo extends StatefulWidget {
  const MessageBoxDemo({super.key});

  @override
  State<MessageBoxDemo> createState() => _MessageBoxDemoState();
}

class _MessageBoxDemoState extends State<MessageBoxDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "MessageBox 弹框",
          descr: "模拟系统的消息提示框而实现的一套模态对话框组件，用于消息提示、确认消息和提交内容。",
        ),
        DemoTitle(
          title: "消息提示",
          descr: "当用户进行操作时会被触发，该对话框中断用户操作，直到用户确认知晓后才可关闭。",
        ),
        DisplayBlock(
          description: "当用户进行操作时会被触发，该对话框中断用户操作，直到用户确认知晓后才可关闭。",
          path: "message_box_demo_1",
          child: MessageBoxDemo1(),
        ),
        DemoTitle(
          title: "确认消息",
          descr: "提示用户确认其已经触发的动作，并询问是否进行此操作时会用到此对话框。",
        ),
        DisplayBlock(
          path: "message_box_demo_2",
          child: MessageBoxDemo2(),
        ),
        DemoTitle(
          title: "跨组件信息传递",
          descr: "用户可在自定义组件中将信息共享给弹窗，并通过弹窗回传给调用处的父级节点",
        ),
        DisplayBlock(
          path: "message_box_demo_3",
          child: MessageBoxDemo3(),
        ),
      ],
    );
  }
}
