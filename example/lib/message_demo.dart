import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'message_demo/message_demo_1.dart';
import 'message_demo/message_demo_2.dart';

class MessageDemo extends StatefulWidget {
  const MessageDemo({super.key});

  @override
  State<MessageDemo> createState() => _MessageDemoState();
}

class _MessageDemoState extends State<MessageDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Message 消息提示",
          descr: "常用于主动操作后的反馈提示。与 Notification 的区别是后者更多用于系统级通知的被动提醒。",
        ),
        DemoTitle(
          title: "基础用法",
          descr: "从顶部出现，3 秒后自动消失。",
        ),
        DisplayBlock(
          description: "Message 在配置上与与Alert相识，显示内容实际是Alert组件，可以结合 Alert 的文档理解它们。",
          child: MessageDemo1(),
        ),
        DemoTitle(
          title: "不同状态",
          descr: "用来显示「成功、警告、消息、错误」类的操作反馈。",
        ),
        DisplayBlock(
          description: "参考Alert的类型配置",
          child: MessageDemo2(),
        ),
      ],
    );
  }
}
