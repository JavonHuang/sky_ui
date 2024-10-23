import 'package:flutter/material.dart';
import 'package:sky_ui/src/utils/utils.dart';
import '../../styles/styles.dart';
import '../checkbox/index.dart';
import '../collapse/index.dart';
import '../common/sky_hover.dart';
import 'index.dart';

class TreeItem extends StatefulWidget {
  final List<SkyTreeNode> children;
  final SkyTreeController controller;
  final SkyTreeNode? parentNode;
  final bool accordion;
  final IconData icon;
  final Color? iconColor;
  final bool showCheckbox;
  final Function(bool checked, SkyTreeNode node)? onCheckChanged;
  final bool lazy;
  final Future<List<SkyTreeNode>> Function(SkyTreeNode e)? load;
  final Widget Function(SkyTreeNode e)? buildContent;

  const TreeItem({
    super.key,
    required this.children,
    required this.controller,
    this.parentNode,
    required this.accordion,
    required this.icon,
    this.iconColor,
    required this.showCheckbox,
    this.onCheckChanged,
    required this.lazy,
    this.load,
    this.buildContent,
  });

  @override
  State<TreeItem> createState() => _TreeItemState();
}

class _TreeItemState extends State<TreeItem> with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.children.map((e) {
        e.parentNode = widget.parentNode;
        return SkyCollapse(
          key: ValueKey(e.index),
          titlePadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.only(left: 10.scaleSpacing),
          controller: widget.controller.getCollapse(e),
          icon: widget.icon,
          iconColor: widget.iconColor,
          disabled: e.disabled,
          onOpen: () {
            if (widget.accordion) {
              widget.controller.closeOtherCollapse(e);
            }
            e.isExpend = true;
          },
          onClose: () {
            e.isExpend = false;
            widget.controller.closeChildrenCollapse(e);
          },
          titleBuilder: (context, anima, ctrl, icon) {
            return SkyHover(
              disabled: e.disabled,
              builder: (context, onHover, setvalue) {
                Color color = onHover || e.isCurrent(widget.controller.activeIndex) || e.isInChildren(widget.controller.activeIndex) ? SkyColors().primary : SkyColors().primaryText;
                return GestureDetector(
                  onTap: () async {
                    if (e.disabled) {
                      return;
                    }
                    widget.controller.setActiveIndex(e.index, e);
                    // if (e.children.isEmpty && widget.accordion) {
                    //   widget.controller.closeOtherCollapse(e);
                    // }
                    if (widget.lazy && widget.load != null && !e.loadFinish) {
                      setState(() {
                        e.pinding = true;
                      });
                      List<SkyTreeNode> ls = await widget.load!(e);
                      e.loadFinish = true;
                      widget.controller.insertChildren(ls, e);
                    } else {
                      widget.controller.expendItem(e);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2.scaleSpacing),
                    padding: EdgeInsets.symmetric(horizontal: 10.scaleSpacing),
                    color: e.isCurrent(widget.controller.activeIndex) || onHover ? SkyColors().defaultBg : SkyColors().transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: e.children.isNotEmpty || (widget.lazy && !e.loadFinish) ? icon : null,
                        ),
                        if (widget.lazy && !e.loadFinish && e.pinding)
                          RotationTransition(
                            turns: Tween(begin: 1.0, end: 0.0).animate(_animationController),
                            child: Icon(
                              size: SkyIconSizes().mediumFont,
                              ElementIcons.loading,
                              color: SkyColors().placeholderText,
                            ),
                          ),
                        if (widget.showCheckbox)
                          SkyCheckbox(
                            label: "",
                            indeterminate: widget.controller.getIndeterminate(e),
                            model: e.checked,
                            onChanged: (checked) {
                              widget.onCheckChanged?.call(checked, e);
                              widget.controller.checkedNode(e, checked);
                            },
                          ),
                        if (e.data.icon != null)
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
                          child: widget.buildContent != null
                              ? widget.buildContent!(e)
                              : Text(
                                  e.data.label,
                                  style: TextStyle(
                                    color: color,
                                    fontSize: SkyFontSizes().titleSmallFont,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          content: e.children.isNotEmpty
              ? TreeItem(
                  accordion: widget.accordion,
                  children: e.children,
                  controller: widget.controller,
                  parentNode: e,
                  icon: widget.icon,
                  iconColor: widget.iconColor,
                  showCheckbox: widget.showCheckbox,
                  lazy: widget.lazy,
                  load: widget.load,
                  buildContent: widget.buildContent,
                )
              : null,
          duration: const Duration(milliseconds: 200),
        );
      }).toList(),
    );
  }
}
