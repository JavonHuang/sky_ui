import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class DialogDemo1 extends StatefulWidget {
  const DialogDemo1({super.key});

  @override
  State<DialogDemo1> createState() => _DialogDemo1State();
}

class _DialogDemo1State extends State<DialogDemo1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyButton(
              text: "点击打开 Dialog",
              type: SkyType.text,
              onTap: () {
                SkyDialog myd = SkyDialog();
                myd.open(
                  "标题名称",
                  width: 600,
                  maxHeight: 400,
                  confirmButtonText: "确定",
                  cancelButtonText: "取消",
                  onClose: () async {
                    SkyMessageBox().open(
                      "确定关闭父级么",
                      width: 400,
                      confirmButtonText: "确定",
                      cancelButtonText: "取消",
                      onConfirm: (e) async {
                        myd.close();
                        return Future.value(true);
                      },
                      onCancel: (e) async {
                        return Future.value(true);
                      },
                      child: const Text("子级"),
                    );
                    return Future.value(false);
                  },
                  child: const SizedBox(
                    height: 400,
                    child: Text("父级弹窗"),
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
