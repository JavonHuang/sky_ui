import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'package:sky_ui/src/sky/common/sky_hover.dart';

class MenuItem extends StatefulWidget {
  final List<SkyMenuNode> children;
  final SkyMenuController controller;

  const MenuItem({
    super.key,
    required this.children,
    required this.controller,
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
              contentPadding: EdgeInsets.only(left: 10.scaleSpacing),
              titleBuilder: (context, anima, ctrl, icon) {
                return SkyHover(
                  disabled: false,
                  onTap: () {
                    if (e.children.isEmpty) {
                      widget.controller.setActiveIndex(e.index);
                    }
                  },
                  builder: (context, onHover) {
                    Color color = onHover || e.isCurrent(widget.controller.activeIndex) || e.isInChildren(widget.controller.activeIndex) ? SkyColors().primary : SkyColors().primaryText;
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: SkySpacings().textSpacing),
                      padding: EdgeInsets.symmetric(horizontal: 10.scaleSpacing),
                      height: 40.scaleSpacing,
                      color: e.isCurrent(widget.controller.activeIndex) ? SkyColors().defaultBg : SkyColors().transparent,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              e.data.icon,
                              color: color,
                              size: SkyIconSizes().mediumFont,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              e.data.label,
                              style: TextStyle(
                                color: color,
                                fontSize: SkyFontSizes().textFont,
                              ),
                            ),
                          ),
                          if (e.children.isNotEmpty) icon
                        ],
                      ),
                    );
                  },
                );
              },
              content: e.children.isNotEmpty
                  ? MenuItem(
                      children: e.children,
                      controller: widget.controller,
                    )
                  : null,
              duration: Duration(milliseconds: 200),
            ),
          )
          .toList(),
    );
  }
}
