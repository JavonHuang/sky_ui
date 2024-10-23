import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class DialogDemo3 extends StatefulWidget {
  const DialogDemo3({super.key});

  @override
  State<DialogDemo3> createState() => _DialogDemo3State();
}

class _DialogDemo3State extends State<DialogDemo3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyButton(
              text: "点击打开外层 Dialog",
              type: SkyType.text,
              onTap: () {
                SkyDialog().open(
                  "外层 Dialog",
                  confirmButtonText: "打开内层 Dialog",
                  cancelButtonText: "取消",
                  onConfirm: (e) async {
                    SkyDialog().open(
                      "内层 Dialog",
                      child: const Text("内层Dialog"),
                    );
                    return Future.value(false);
                  },
                  onCancel: (e) async {
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
