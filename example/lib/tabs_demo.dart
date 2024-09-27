import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'tabs/toly_tabs.dart';

class TabsDemo extends StatefulWidget {
  const TabsDemo({super.key});

  @override
  State<TabsDemo> createState() => _TabsDemoState();
}

class _TabsDemoState extends State<TabsDemo> {
  List<MenuMeta> items = List.generate(
    20,
    (index) => MenuMeta(label: 'Tab$index', router: 'Tab$index'),
  );
  List<TabOption> options = List.generate(
    40,
    (index) => TabOption(label: 'Tab$index', name: 'Tab$index', child: Text('Tab$index')),
  );
  String activeId = 'tab1';

  MenuMeta get activeMenu => items.singleWhere((e) => e.id == activeId);
  void _onSelect(MenuMeta meta) {
    activeId = meta.id;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "Tabs 标签页",
          descr: "分隔内容上有关联但属于不同类别的数据集合。",
        ),
        const DemoTitle(
          title: "基础用法",
          descr: "基础的、简洁的标签页。",
        ),
        DisplayBlock(
          children: [
            Container(
              height: 100,
              child: SkyTabs(
                activeKey: "Tab3",
                items: options,
              ),
            ),
            // TolyTabs(dividerHeight: 42, tabs: items, activeId: activeId, onSelect: _onSelect),
          ],
        ),
      ],
    );
  }
}
