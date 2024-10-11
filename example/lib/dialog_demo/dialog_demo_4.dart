import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class DialogDemo5 extends StatefulWidget {
  const DialogDemo5({super.key});

  @override
  State<DialogDemo5> createState() => _DialogDemo5State();
}

class _DialogDemo5State extends State<DialogDemo5> {
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
                SkyDialog().open(
                  "标题名称",
                  confirmButtonText: "确定",
                  cancelButtonText: "取消",
                  onConfirm: (e) async {
                    SkyMessage(message: "已取获取：$e", type: SkyAlertType.success, showIcon: true).open();
                    return Future.value(true);
                  },
                  onCancel: (e) async {
                    SkyMessage(message: "已取获取：$e", type: SkyAlertType.info, showIcon: true).open();
                    return Future.value(true);
                  },
                  child: const TestMessageBoxMain(),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}

class TestMessageBoxMain extends StatefulWidget {
  const TestMessageBoxMain({super.key});

  @override
  State<TestMessageBoxMain> createState() => _TestMessageBoxMainState();
}

class _TestMessageBoxMainState extends State<TestMessageBoxMain> {
  @override
  Widget build(BuildContext context) {
    DialogLayout.maybeOf(context)?.setValue("TestMessageBoxMain组件设置的值");
    return const Text("在内容中节点，将数据共享给弹窗，并通过确认钩子或取消钩子回传给主父级节点");
  }
}
