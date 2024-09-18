import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/title.dart';

class MessageBoxDemo extends StatefulWidget {
  const MessageBoxDemo({super.key});

  @override
  State<MessageBoxDemo> createState() => _MessageBoxDemoState();
}

class _MessageBoxDemoState extends State<MessageBoxDemo> {
  late int count = 0;
  @override
  void initState() {
    super.initState();
    OverlayLayout().initPosition(
      top: 20,
      width: 400,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "MessageBox 弹框",
          descr: "模拟系统的消息提示框而实现的一套模态对话框组件，用于消息提示、确认消息和提交内容。",
        ),
        const DemoTitle(
          title: "消息提示",
          descr: "当用户进行操作时会被触发，该对话框中断用户操作，直到用户确认知晓后才可关闭。",
        ),
        DisplayBlock(
          description: "当用户进行操作时会被触发，该对话框中断用户操作，直到用户确认知晓后才可关闭。",
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
        ),
        const DemoTitle(
          title: "确认消息",
          descr: "提示用户确认其已经触发的动作，并询问是否进行此操作时会用到此对话框。",
        ),
        DisplayBlock(
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
        ),
        const DemoTitle(
          title: "跨组件信息传递",
          descr: "用户可在自定义组件中将信息共享给弹窗，并通过弹窗回传给调用处的父级节点",
        ),
        DisplayBlock(
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
        ),
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
    MessageBoxWidget.maybeOf(context)?.setValue("TestMessageBoxMain组件设置的值");
    return const Text("在内容中节点，将数据共享给弹窗，并通过确认钩子或取消钩子回传给主父级节点");
  }
}
