import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'package:sky_ui/src/sky/common/sky_hover.dart';

import '../collapse/index.dart';
import 'index.dart';

class MenuItem extends StatefulWidget {
  final List<SkyMenuNode> children;
  const MenuItem({
    super.key,
    required this.children,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.children
          .map(
            (e) => SkyCollapse(
              titlePadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.only(left: 10),
              title: SkyHover(
                disabled: false,
                builder: (context, onHover) {
                  return Text(
                    e.data.label,
                    style: TextStyle(color: onHover ? SkyColors().primary : SkyColors().primaryText),
                  );
                },
              ),
              content: e.children.isNotEmpty
                  ? MenuItem(
                      children: e.children,
                    )
                  : null,
              duration: Duration(milliseconds: 200),
            ),
          )
          .toList(),
    );
  }
}
