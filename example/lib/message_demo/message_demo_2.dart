import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class MessageDemo2 extends StatefulWidget {
  const MessageDemo2({super.key});

  @override
  State<MessageDemo2> createState() => _MessageDemo2State();
}

class _MessageDemo2State extends State<MessageDemo2> {
  late int count = 0;
  @override
  void initState() {
    super.initState();
    OverlayLayout().initPosition(
      top: 20,
      right: 20,
      width: 300,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyButton(
              text: "成功",
              onTap: () {
                count++;
                SkyMessage(message: "测常提示${count}", type: SkyAlertType.success, showIcon: true).open();
              },
            ),
            SkyButton(
              text: "警告",
              onTap: () {
                count++;
                SkyMessage(message: "测常提示${count}", type: SkyAlertType.warning, showIcon: true).open();
              },
            ),
            SkyButton(
              text: "消息",
              onTap: () {
                count++;
                SkyMessage(message: "测常提示${count}", type: SkyAlertType.info, showIcon: true).open();
              },
            ),
            SkyButton(
              text: "错误",
              onTap: () {
                count++;
                SkyMessage(message: "测常提示${count}", type: SkyAlertType.error, showIcon: true).open();
              },
            ),
          ],
        )
      ],
    );
  }
}
