import 'package:flutter/material.dart';

import 'menu_item.dart';
part 'model/menu_node.dart';

class SkyMenu extends StatefulWidget {
  final List<SkyMenuNode> children;
  final SkyMenuController? controller;
  final String? activeIndex;
  const SkyMenu({
    super.key,
    required this.children,
    this.controller,
    this.activeIndex,
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
      _controller._setActiveIndex(widget.activeIndex!);
    }
  }

  void reflesh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: MenuItem(
        children: widget.children,
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
  String? _activeIndex;

  void _setActiveIndex(String index) {
    _activeIndex = index;
    _state!.reflesh();
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
