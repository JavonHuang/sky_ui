import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'divider.dart';
import 'tab_bar.dart';
part 'models/tab_options.dart';

class SkyTabs extends StatefulWidget {
  const SkyTabs({
    super.key,
    required this.items,
  });
  final List<TabOption> items;

  @override
  State<SkyTabs> createState() => _SkyTabsState();
}

class _SkyTabsState extends State<SkyTabs> {
  Widget renderOption() {
    List<Widget> list = [];
    for (int index = 0; index < widget.items.length; index++) {
      TabOption option = widget.items[index];
      EdgeInsetsGeometry padding = EdgeInsets.symmetric(horizontal: 20.scaleSpacing);
      if (index == 0) {
        padding = EdgeInsets.only(right: 20.scaleSpacing);
      }
      if (option == widget.items.last) {
        padding = EdgeInsets.only(left: 20.scaleSpacing);
      }
      list.add(
        Container(
          padding: padding,
          child: SkyTabBar(
            child: option,
          ),
        ),
      );
    }
    return Row(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            renderOption(),
            TabDivider(),
          ],
        ),
      ),
    );
  }
}
