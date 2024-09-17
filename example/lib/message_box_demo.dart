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
      right: 20,
      width: 300,
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
          description: "调用alert方法即可打开消息提示，它模拟了系统的 alert，无法通过按下 ESC 或点击框外关闭。此例中接收了两个参数，message和title。值得一提的是，窗口被关闭后，它默认会返回一个Promise对象便于进行后续操作的处理。",
          children: [
            SkyRow(
              gutter: 20,
              children: [
                SkyButton(
                  text: "打开消息提示",
                  onTap: () {
                    count++;
                    SkyMessageBox().alert(
                      "这是一段内容', '标题名称",
                      confirmButtonText: "确定",
                      onConfirm: () async {
                        return Future.value(false);
                      },
                      child: Container(
                        child: SkyButton(
                          text: "确定",
                          type: SkyType.primary,
                          onTap: () {
                            SkyMessageBox().alert(
                              "这是一段内容', '标题名称",
                              confirmButtonText: "确定",
                              child: Text("99889"),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
        const DemoTitle(
          title: "不同状态",
          descr: "用来显示「成功、警告、消息、错误」类的操作反馈。",
        ),
        DisplayBlock(
          description: "参考Alert的类型配置",
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
        ),
      ],
    );
  }
}
