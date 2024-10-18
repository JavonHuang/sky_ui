import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

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
    if (widget.activeIndex != null) {
      SkyTreeNode? activeItem;
      for (SkyTreeNode item in widget.children) {
        activeItem = item.find(widget.activeIndex!);
      }
      _controller.setActiveIndex(widget.activeIndex!, activeItem!);
    }
  }

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
      ),
    );
  }

  @override
  void dispose() {
    _controller._detach(this);
    super.dispose();
  }
}
