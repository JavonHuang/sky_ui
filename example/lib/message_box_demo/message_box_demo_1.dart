import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class MessageBoxDemo1 extends StatefulWidget {
  const MessageBoxDemo1({super.key});

  @override
  State<MessageBoxDemo1> createState() => _MessageBoxDemo1State();
}

class _MessageBoxDemo1State extends State<MessageBoxDemo1> {
  late int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyButton(
              text: "点击打开 Message Box",
              type: SkyType.text,
              onTap: () {
                count++;
                SkyMessageBox().open(
                  "标题名称",
                  confirmButtonText: "确定",
                  onConfirm: (e) async {
                    return Future.value(true);
                  },
                  child: const Text("这是一段内容"),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
