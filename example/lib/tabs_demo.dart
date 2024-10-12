import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'tabs_demo/tabs_demo_1.dart';
import 'tabs_demo/tabs_demo_2.dart';
import 'tabs_demo/tabs_demo_3.dart';

class TabsDemo extends StatefulWidget {
  const TabsDemo({super.key});

  @override
  State<TabsDemo> createState() => _TabsDemoState();
}

class _TabsDemoState extends State<TabsDemo> {
  List<TabOption> options = List.generate(
    40,
    (index) => TabOption(label: 'Tab$index', name: 'Tab$index', child: Text('Tab$index')),
  );
  String activeId = 'tab1';

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Tabs 标签页",
          descr: "分隔内容上有关联但属于不同类别的数据集合。",
        ),
        DemoTitle(
          title: "基础用法",
          descr: "基础的、简洁的标签页。",
        ),
        DisplayBlock(
          child: TabsDemo1(),
        ),
        DemoTitle(
          title: "选项卡样式",
          descr: "选项卡样式的标签页。",
        ),
        DisplayBlock(
          child: TabsDemo2(),
        ),
        DemoTitle(
          title: "卡片化",
          descr: "卡片化的标签页。",
        ),
        DisplayBlock(
          child: TabsDemo3(),
        ),
      ],
    );
  }
}
