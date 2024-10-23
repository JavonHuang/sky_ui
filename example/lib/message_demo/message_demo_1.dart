import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class MessageDemo1 extends StatefulWidget {
  const MessageDemo1({super.key});

  @override
  State<MessageDemo1> createState() => _MessageDemo1State();
}

class _MessageDemo1State extends State<MessageDemo1> {
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
              text: "打开消息提示",
              onTap: () {
                count++;
                SkyMessage(message: "测常提示$count", type: SkyAlertType.success, showIcon: true).open();
              },
            ),
          ],
        )
      ],
    );
  }
}
