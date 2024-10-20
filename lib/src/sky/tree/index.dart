import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'model/common.dart';
import 'tree_item.dart';
part 'model/tree_node.dart';
part 'tree_controller.dart';

class SkyTree extends StatefulWidget {
  final List<SkyTreeNode> children;
  final SkyTreeController? controller;
  final String? activeIndex;
  final Function(String? e, SkyTreeNode node)? onchanged;
  final bool accordion;
  final IconData icon;
  final Color? iconColor;
  final bool showCheckbox;
  final bool lazy;
  final Future<List<SkyTreeNode>> Function(SkyTreeNode e)? load;
  final List<String> defaultExpandedIndexs;
  final List<String> defaultCheckedIndex;
  final Widget Function(SkyTreeNode e)? buildContent;
  const SkyTree({
    super.key,
    required this.children,
    this.controller,
    this.activeIndex,
    this.onchanged,
    this.accordion = false,
    this.icon = ElementIcons.caretRight,
    this.iconColor,
    this.showCheckbox = false,
    this.lazy = false,
    this.load,
    this.defaultExpandedIndexs = const [],
    this.defaultCheckedIndex = const [],
    this.buildContent,
  });

  @override
  State<SkyTree> createState() => _SkyTreeState();
}

class _SkyTreeState extends State<SkyTree> {
  SkyTreeController? _internalController;
  final innerController = ScrollController();
  SkyTreeController get _controller => widget.controller ?? _internalController!;
  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = SkyTreeController();
    }
    _controller._attach(this);
    init();
  }

  void init() {
    if (widget.children.isNotEmpty) {
      for (String index in widget.defaultCheckedIndex) {
        for (SkyTreeNode item in widget.children) {
          SkyTreeNode? result = SkyTreeCommon.find(item, index);
          if (result != null) {
            _controller.checkedChildren(result, true);
          }
        }
      }
      for (String index in widget.defaultExpandedIndexs) {
        for (SkyTreeNode item in widget.children) {
          SkyTreeNode? result = SkyTreeCommon.find(item, index);
          if (result != null && result.children.isNotEmpty) {
            result.isExpend = true;
          }
        }
      }
    }
    if (widget.activeIndex != null) {
      SkyTreeNode? activeItem;
      for (SkyTreeNode item in widget.children) {
        activeItem = SkyTreeCommon.find(item, widget.activeIndex!);
      }
      _controller.setActiveIndex(widget.activeIndex!, activeItem!);
    }
  }

  void initValue(List<SkyTreeNode> nodeList) {}

  void reflesh() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TreeItem(
        children: widget.children,
        controller: _controller,
        accordion: widget.accordion,
        icon: widget.icon,
        iconColor: widget.iconColor,
        showCheckbox: widget.showCheckbox,
        lazy: widget.lazy,
        load: widget.load,
        buildContent: widget.buildContent,
      ),
    );
  }

  @override
  void dispose() {
    _controller._detach(this);
    super.dispose();
  }
}
