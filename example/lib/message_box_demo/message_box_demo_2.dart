import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class MessageBoxDemo2 extends StatefulWidget {
  const MessageBoxDemo2({super.key});

  @override
  State<MessageBoxDemo2> createState() => _MessageBoxDemo2State();
}

class _MessageBoxDemo2State extends State<MessageBoxDemo2> {
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
                  cancelButtonText: "取消",
                  onConfirm: (e) async {
                    SkyMessage(message: "删除成功!", type: SkyAlertType.success, showIcon: true).open();
                    return Future.value(true);
                  },
                  onCancel: (e) async {
                    SkyMessage(message: "已取消删除", type: SkyAlertType.info, showIcon: true).open();
                    return Future.value(true);
                  },
                  child: const SkyAlert(
                    title: "此操作将永久删除该文件, 是否继续?",
                    type: SkyAlertType.warning,
                    showIcon: true,
                  ),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
