import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class DialogDemo2 extends StatefulWidget {
  const DialogDemo2({super.key});

  @override
  State<DialogDemo2> createState() => _DialogDemo2State();
}

class _DialogDemo2State extends State<DialogDemo2> {
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
                  onConfirm: (e) async {
                    SkyMessage(message: "已取获取：$e", type: SkyAlertType.success, showIcon: true).open();
                    return Future.value(true);
                  },
                  onCancel: (e) async {
                    SkyMessage(message: "已取获取：$e", type: SkyAlertType.info, showIcon: true).open();
                    return Future.value(true);
                  },
                  child: const TestMessageBoxMain(),
                  foot: const FootWidget(),
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

class FootWidget extends StatefulWidget {
  const FootWidget({super.key});

  @override
  State<FootWidget> createState() => _FootWidgetState();
}

class _FootWidgetState extends State<FootWidget> {
  @override
  Widget build(BuildContext context) {
    return SkyRow(
      alignment: WrapAlignment.end,
      gutter: 20,
      children: [
        SkyButton(
          text: "关闭",
          onTap: () {
            DialogLayout.maybeOf(context)?.close();
          },
        ),
        SkyButton(
          text: "保存",
          type: SkyType.warning,
          onTap: () {},
        ),
        SkyButton(
          text: "提交",
          type: SkyType.primary,
          onTap: () {
            String a = DialogLayout.maybeOf(context)?.value;
            SkyMessage(
              message: a,
              type: SkyAlertType.success,
            ).open();
            DialogLayout.maybeOf(context)?.close();
          },
        )
      ],
    );
  }
}
