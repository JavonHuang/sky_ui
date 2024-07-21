import 'package:flutter/material.dart';

class Scroll {
  late bool touch;
  final int index;
  final ScrollController controller;
  Scroll({
    required this.touch,
    required this.index,
    required this.controller,
  });
}

class GridListViewScrollController {
  late final List<Scroll> _listScrollController = [];

  Function() _listener(ScrollController e, int index) {
    ScrollController current = e;
    return () {
      int touch = _listScrollController.indexWhere((h) => h.touch);
      if (touch > -1 && _listScrollController[touch].controller != current) {
        return;
      }
      _listScrollController[index].touch = true;
      for (Scroll item in _listScrollController) {
        if (current != item.controller && item.controller.positions.isNotEmpty) {
          item.controller.jumpTo(current.offset);
        }
      }
      _listScrollController[index].touch = false;
    };
  }

  ScrollController createScrollController() {
    ScrollController controller = ScrollController();
    controller.addListener(_listener(controller, _listScrollController.length));
    _listScrollController.add(Scroll(touch: false, index: _listScrollController.length, controller: controller));

    return controller;
  }

  dispose() {
    for (Scroll item in _listScrollController) {
      item.controller.dispose();
    }
  }
}
