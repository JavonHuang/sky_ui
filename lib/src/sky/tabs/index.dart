import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sky_ui/sky_ui.dart';

import 'divider.dart';
import 'tab_bar.dart';
part 'models/tab_options.dart';

class SkyTabs extends StatefulWidget {
  const SkyTabs({
    super.key,
    required this.items,
    this.controller,
    required this.activeKey,
  });
  final String activeKey;
  final List<TabOption> items;
  final SKyTabsController? controller;

  @override
  State<SkyTabs> createState() => _SkyTabsState();
}

class _SkyTabsState extends State<SkyTabs> {
  SKyTabsController? _internalController;
  final innerController = ScrollController();
  GlobalKey<TabDividerState> tabDividerStateKey = GlobalKey<TabDividerState>();
  SKyTabsController get _controller => widget.controller ?? _internalController!;
  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = SKyTabsController();
    }
    _controller._attach(this);

    _controller._setActiveKey(widget.activeKey);
  }

  void reflesh() {
    setState(() {});
  }

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
        SkyTabBar(
          onTap: () {
            _controller._movedX(index);
          },
          padding: padding,
          child: option,
          onSizeChange: (size) {
            _controller._setSize(size, option.name);
          },
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, box) {
      _controller._setViewtWidth(box.maxWidth);
      return Row(
        children: [
          if (_controller.hasScrollbar) const Icon(ElementIcons.arrowLeft),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 2,
                        color: SkyColors().baseBorder,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 40,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      controller: innerController,
                      scrollDirection: Axis.horizontal,
                      child: IntrinsicWidth(
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: renderOption(),
                            ),
                            TabDivider(
                              key: tabDividerStateKey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_controller.hasScrollbar) const Icon(ElementIcons.arrowRight),
        ],
      );
    });
  }

  @override
  void dispose() {
    _controller._detach(this);
    super.dispose();
  }
}

class SKyTabsController {
  _SkyTabsState? _state;
  Map<String, Size> _itemsSize = {};
  bool _init = false;
  double _totalWidth = 0;
  double _viewtWidth = 0;

  String? activeKey;

  void _movedX(int index) {
    List<TabOption> offsetXList = _state!.widget.items.sublist(0, index);
    activeKey = _state!.widget.items[index].name;
    double offsetX = 0;
    double offsetWidth = _itemsSize[activeKey]!.width;

    for (TabOption tab in offsetXList) {
      offsetX += _itemsSize[tab.name]!.width;
    }
    _state!.tabDividerStateKey.currentState!.movedOffsetX(offsetX, offsetWidth);
  }

  void _setSize(Size size, String name) {
    _itemsSize[name] = size;
    if (!_init && _itemsSize.length == _state!.widget.items.length) {
      int index = _state!.widget.items.indexWhere((e) => e.name == activeKey);
      if (index == -1) {
        return;
      }
      for (String key in _itemsSize.keys) {
        _totalWidth += _itemsSize[key]!.width;
      }
      _init = true;
      _state!.reflesh();
      _movedX(index);
    }
  }

  void _setActiveKey(String _activeKey) {
    if (_state!.widget.items.isEmpty) {
      return;
    }
    activeKey = _activeKey;
  }

  void _attach(_SkyTabsState state) {
    _state = state;
  }

  void _detach(_SkyTabsState state) {
    if (_state == state) {
      _state = null;
    }
  }

  void _setViewtWidth(double value) {
    _viewtWidth = value;
  }

  bool get hasScrollbar => _viewtWidth < _totalWidth;
}
