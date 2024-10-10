import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'package:sky_ui/src/sky/common/sky_hover.dart';

class MenuItem extends StatefulWidget {
  final List<SkyMenuNode> children;
  final SkyMenuController controller;
  final SkyMenuNode? parentNode;

  const MenuItem({
    super.key,
    required this.children,
    required this.controller,
    this.parentNode,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.children.map((e) {
        e.parentNode = widget.parentNode;
        return SkyCollapse(
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.only(left: 10.scaleSpacing),
          controller: widget.controller.getCollapse(e),
          onOpen: () {
            widget.controller.closeOtherCollapse(e);
          },
          titleBuilder: (context, anima, ctrl, icon) {
            return SkyHover(
              disabled: false,
              onTap: () {
                if (e.children.isEmpty) {
                  widget.controller.setActiveIndex(e.index, e);
                }
                if (e.children.isEmpty) {
                  widget.controller.closeOtherCollapse(e);
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Icon(
                            e.data.icon,
                            color: color,
                            size: SkyIconSizes().largeFont,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          e.data.label,
                          style: TextStyle(
                            color: color,
                            fontSize: SkyFontSizes().titleSmallFont,
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
                  parentNode: e,
                )
              : null,
          duration: Duration(milliseconds: 200),
        );
      }).toList(),
    );
  }
}
