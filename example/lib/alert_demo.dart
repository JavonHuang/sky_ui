import 'package:flutter/material.dart';
// import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/space.dart';
import 'common/title.dart';
// import 'package:flutter_highlight/theme_map.dart';

class AlertDemo extends StatefulWidget {
  const AlertDemo({super.key});

  @override
  State<AlertDemo> createState() => _AlertDemoState();
}

class _AlertDemoState extends State<AlertDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HighlightView(
        //   " const DemoTitle()",
        //   language: "dart",
        //   theme: themeMap['github']!,
        //   padding: EdgeInsets.all(12),
        //   // textStyle: TextStyle(fontFamily: 'SFMono-Regular,Consolas,Liberation Mono,Menlo,monospace'),
        // ),
        const DemoTitle(
          title: "Alert 警告",
          descr: "用于页面中展示重要的提示信息。",
        ),
        const DemoTitle(
          title: "基本用法",
          descr: "页面中的非浮层元素，不会自动消失。",
        ),
        const DisplayBlock(
          description: "Alert 组件提供四种主题，由type属性指定，默认值为info。",
          children: [
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "成功提示的文案",
                    type: SkyAlertType.success,
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "消息提示的文案",
                    type: SkyAlertType.info,
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "警告提示的文案",
                    type: SkyAlertType.warning,
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "错误提示的文案",
                    type: SkyAlertType.error,
                  ),
                )
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "主题",
          descr: "Alert 组件提供了两个不同的主题：light和dark。",
        ),
        const DisplayBlock(
          description: "通过设置effect属性来改变主题，默认为light。",
          children: [
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "成功提示的文案",
                    type: SkyAlertType.success,
                    effect: SkyAlertEffect.dark,
                    closable: true,
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "消息提示的文案",
                    type: SkyAlertType.info,
                    effect: SkyAlertEffect.dark,
                    closable: true,
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "警告提示的文案",
                    type: SkyAlertType.warning,
                    effect: SkyAlertEffect.dark,
                    closable: true,
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            const SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "错误提示的文案",
                    type: SkyAlertType.error,
                    effect: SkyAlertEffect.dark,
                    closable: true,
                  ),
                )
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "自定义关闭按钮",
          descr: "自定义关闭按钮为文字或其他符号。",
        ),
        DisplayBlock(
          description: "在 Alert 组件中，你可以设置是否可关闭，关闭按钮的文本以及关闭时的回调函数。closable属性决定是否可关闭，接受boolean，默认为true。你可以设置closeText属性来代替右侧的关闭图标，注意：closeText必须为文本。设置close事件来设置关闭时的回调。",
          children: [
            const SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "不可关闭的 alert",
                    type: SkyAlertType.success,
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            const SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "自定义 close-text",
                    type: SkyAlertType.info,
                    closable: true,
                    closeText: "知道了",
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "设置了回调的 alert",
                    type: SkyAlertType.error,
                    closable: true,
                    close: () {
                      return Future.value(true);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "带有 icon",
          descr: "表示某种状态时提升可读性。",
        ),
        const DisplayBlock(
          description: "通过设置showIcon属性来显示 Alert 的 icon，这能更有效地向用户展示你的显示意图。",
          children: [
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "成功提示的文案",
                    type: SkyAlertType.success,
                    showIcon: true,
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "消息提示的文案",
                    type: SkyAlertType.info,
                    showIcon: true,
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "警告提示的文案",
                    type: SkyAlertType.warning,
                    showIcon: true,
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "错误提示的文案",
                    type: SkyAlertType.error,
                    showIcon: true,
                  ),
                )
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "文字居中",
          descr: "使用 center 属性让文字水平居中。",
        ),
        const DisplayBlock(
          children: [
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "成功提示的文案",
                    type: SkyAlertType.success,
                    showIcon: true,
                    center: true,
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "消息提示的文案",
                    type: SkyAlertType.info,
                    showIcon: true,
                    center: true,
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "警告提示的文案",
                    type: SkyAlertType.warning,
                    showIcon: true,
                    center: true,
                  ),
                )
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "错误提示的文案",
                    type: SkyAlertType.error,
                    showIcon: true,
                    center: true,
                  ),
                )
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "带有辅助性文字介绍",
          descr: "包含标题和内容，解释更详细的警告。",
        ),
        const DisplayBlock(
          children: [
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "带辅助性文字介绍",
                    description: "这是一句绕口令：黑灰化肥会挥发发灰黑化肥挥发；灰黑化肥会挥发发黑灰化肥发挥。 黑灰化肥会挥发发灰黑化肥黑灰挥发化为灰……",
                    type: SkyAlertType.success,
                    closable: true,
                  ),
                )
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "带有 icon 和辅助性文字介绍",
          descr: "",
        ),
        const DisplayBlock(
          children: [
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "成功提示的文案",
                    description: "文字说明文字说明文字说明文字说明文字说明文字说明",
                    type: SkyAlertType.success,
                    showIcon: true,
                    closable: true,
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "消息提示的文案",
                    description: "文字说明文字说明文字说明文字说明文字说明文字说明",
                    type: SkyAlertType.info,
                    showIcon: true,
                    closable: true,
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "警告提示的文案",
                    description: "文字说明文字说明文字说明文字说明文字说明文字说明",
                    type: SkyAlertType.warning,
                    showIcon: true,
                    closable: true,
                  ),
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              children: [
                SkyCol(
                  span: 24,
                  child: SkyAlert(
                    title: "错误提示的文案",
                    description: "文字说明文字说明文字说明文字说明文字说明文字说明",
                    type: SkyAlertType.error,
                    showIcon: true,
                    closable: true,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
