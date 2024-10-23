import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TabsDemo2 extends StatefulWidget {
  const TabsDemo2({super.key});

  @override
  State<TabsDemo2> createState() => _TabsDemo2State();
}

class _TabsDemo2State extends State<TabsDemo2> {
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
            type: SkyTabType.card,
            activeKey: "Tab3",
            items: options,
          ),
        ),
        // TolyTabs(dividerHeight: 42, tabs: items, activeId: activeId, onSelect: _onSelect),
      ],
    );
  }
}
