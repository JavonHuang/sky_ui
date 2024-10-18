import 'package:flutter/material.dart';

import '../collapse/index.dart';
import 'menu_item.dart';
part 'model/menu_node.dart';

class SkyMenu extends StatefulWidget {
  final List<SkyMenuNode> children;
  final SkyMenuController? controller;
  final String? activeIndex;
  final bool accordion;
  final Function(String? e, SkyMenuNode node)? onchanged;
  const SkyMenu({
    super.key,
    required this.children,
    this.controller,
    this.activeIndex,
    this.onchanged,
    this.accordion = false,
  });

  @override
  State<SkyMenu> createState() => _SkyMenuState();
}

class _SkyMenuState extends State<SkyMenu> {
  SkyMenuController? _internalController;
  final innerController = ScrollController();
  SkyMenuController get _controller => widget.controller ?? _internalController!;
  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = SkyMenuController();
    }
    _controller._attach(this);
    if (widget.activeIndex != null) {
      SkyMenuNode? activeItem;
      for (SkyMenuNode item in widget.children) {
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
      child: MenuItem(
        accordion: widget.accordion,
        children: widget.children,
        controller: _controller,
      ),
    );
  }

  @override
  void dispose() {
    _controller._detach(this);
    super.dispose();
  }
}

class SkyMenuController {
  _SkyMenuState? _state;
  String? activeIndex;
  final Map<String, SkyCollapseController> collapseCtrMap = {};

  void setActiveIndex(String index, SkyMenuNode e) {
    activeIndex = index;
    _state!.reflesh();
    _state?.widget.onchanged?.call(activeIndex, e);
  }

  SkyCollapseController? getCollapse(SkyMenuNode node) {
    if (node.children.isEmpty) {
      return null;
    }
    if (collapseCtrMap[node.index] == null) {
      collapseCtrMap[node.index] = SkyCollapseController();
    }
    return collapseCtrMap[node.index]!;
  }

  void closeOtherCollapse(SkyMenuNode item) {
    List<String> openList = [];
    void add(SkyMenuNode e) {
      if (e.parentNode != null) {
        openList.add(e.parentNode!.index);
        add(e.parentNode!);
      } else {
        return;
      }
    }

    add(item);

    for (String indexkey in collapseCtrMap.keys) {
      if (!openList.contains(indexkey)) {
        collapseCtrMap[indexkey]!.close();
      }
    }
  }

  void _attach(_SkyMenuState state) {
    _state = state;
  }

  void _detach(_SkyMenuState state) {
    if (_state == state) {
      _state = null;
    }
  }
}
