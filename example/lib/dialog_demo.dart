import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/title.dart';

class DialogDemo extends StatefulWidget {
  const DialogDemo({super.key});

  @override
  State<DialogDemo> createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  @override
  void initState() {
    super.initState();
    OverlayLayout().initPosition(
      top: 20,
      right: 20,
      width: 400,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "Dialog 对话框",
          descr: "在保留当前页面状态的情况下，告知用户并承载相关操作。",
        ),
        const DemoTitle(
          title: "基本用法",
          descr: "Dialog 弹出一个对话框，适合需要定制性更大的场景。",
        ),
        DisplayBlock(
          description: "当用户进行操作时会被触发，该对话框中断用户操作，直到用户确认知晓后才可关闭。",
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
        ),
        const DemoTitle(
          title: "自定义页脚",
          descr: "用户可在根据业务需求，自定义页脚按钮",
        ),
        DisplayBlock(
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
        ),
        const DemoTitle(
          title: "嵌套的 Dialog",
          descr: "如果需要在一个 Dialog 内部嵌套另一个 Dialog，在相应事件内创建新的实例。",
        ),
        DisplayBlock(
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
