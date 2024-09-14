import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/space.dart';
import 'common/title.dart';

class MessageDemo extends StatefulWidget {
  const MessageDemo({super.key});

  @override
  State<MessageDemo> createState() => _MessageDemoState();
}

class _MessageDemoState extends State<MessageDemo> {
  // SkyMessage fToast = SkyMessage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "Message 消息提示",
          descr: "常用于主动操作后的反馈提示。与 Notification 的区别是后者更多用于系统级通知的被动提醒。",
        ),
        const DemoTitle(
          title: "基础用法",
          descr: "从顶部出现，3 秒后自动消失。",
        ),
        DisplayBlock(
          description: "Alert 组件提供四种主题，由type属性指定，默认值为info。",
          children: [
            SkyRow(
              gutter: 20,
              children: [
                SkyButton(
                  text: "打开消息",
                  onTap: () {
                    SkyMessage(message: "测试").open();
                    // fToast.showToast(
                    //   child: Text("787878"),
                    //   toastDuration: Duration(seconds: 2),
                    // );
                  },
                ),
                SkyButton(
                  text: "打开消息",
                  onTap: () {
                    // SkyMessage(message: "测试").open();
                  },
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
