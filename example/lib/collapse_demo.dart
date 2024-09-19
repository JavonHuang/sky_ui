import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/space.dart';
import 'common/title.dart';

class CollapseDemo extends StatefulWidget {
  const CollapseDemo({super.key});

  @override
  State<CollapseDemo> createState() => _CollapseDemoState();
}

class _CollapseDemoState extends State<CollapseDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "Collapse 折叠面板",
          descr: "通过折叠面板收纳内容区域",
        ),
        const DemoTitle(
          title: "基础用法",
          descr: "可同时展开多个面板，面板之间不影响",
        ),
        DisplayBlock(
          children: [
            Container(
              decoration: BoxDecoration(
                color: SkyColors().white,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: SkyColors().baseBorder,
                  ),
                ),
              ),
              child: SkyCollapse(
                title: Container(
                  // color: Colors.red,
                  child: Text("78787889"),
                ),
                duration: Duration(milliseconds: 200),
                content: Container(
                  child: Text("在这个例子中，ListView包含了一些需要展示的文本项，但是如果你不想让这些文本项被助手访问，你可以将它们包装在ExcludeSemantics中。这样，当屏幕阅读器或其他辅助功能尝试访问这些小部件时，它们会被忽略。"),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: SkyColors().white,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: SkyColors().baseBorder,
                  ),
                ),
              ),
              child: SkyCollapse(
                title: Container(
                  // color: Colors.red,
                  child: Text("78787889"),
                ),
                duration: Duration(milliseconds: 200),
                content: Container(
                  child: Text("在这个例子中，ListView包含了一些需要展示的文本项，但是如果你不想让这些文本项被助手访问，你可以将它们包装在ExcludeSemantics中。这样，当屏幕阅读器或其他辅助功能尝试访问这些小部件时，它们会被忽略。"),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
