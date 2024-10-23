import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TabsDemo1 extends StatefulWidget {
  const TabsDemo1({super.key});

  @override
  State<TabsDemo1> createState() => _TabsDemo1State();
}

class _TabsDemo1State extends State<TabsDemo1> {
  List<TabOption> options = List.generate(
    40,
    (index) => TabOption(label: 'Tab$index', name: 'Tab$index', child: Text('Tab$index')),
  );
  String activeId = 'tab1';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: SkyTabs(
            activeKey: "Tab3",
            items: options,
          ),
        ),
        // TolyTabs(dividerHeight: 42, tabs: items, activeId: activeId, onSelect: _onSelect),
      ],
    );
  }
}
