import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TabsDemo3 extends StatefulWidget {
  const TabsDemo3({super.key});

  @override
  State<TabsDemo3> createState() => _TabsDemo3State();
}

class _TabsDemo3State extends State<TabsDemo3> {
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
            type: SkyTabType.borderCard,
            activeKey: "Tab3",
            items: options,
          ),
        ),
      ],
    );
  }
}
