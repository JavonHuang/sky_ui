part of 'index.dart';

class SkyTreeController {
  _SkyTreeState? _state;
  String? activeIndex;
  final Map<String, SkyCollapseController> collapseCtrMap = {};

  void closeOtherCollapse(SkyTreeNode item) {
    List<String> openList = [];
    void add(SkyTreeNode e) {
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

  SkyCollapseController? getCollapse(SkyTreeNode node) {
    if (node.children.isEmpty && !_state!.widget.lazy) {
      return null;
    }
    if (collapseCtrMap[node.index] == null) {
      collapseCtrMap[node.index] = SkyCollapseController();
    }
    if (node.isExpend && !_state!.widget.lazy) {
      scheduleMicrotask(() {
        collapseCtrMap[node.index]!.open();
      });
    }
    return collapseCtrMap[node.index]!;
  }

  void setActiveIndex(String index, SkyTreeNode e) {
    activeIndex = index;
    _state!.reflesh();
    _state?.widget.onchanged?.call(activeIndex, e);
  }

  void checkedChildren(SkyTreeNode e, bool checked) {
    void checkedFun(SkyTreeNode n) {
      if (n.children.isNotEmpty) {
        for (SkyTreeNode item in n.children) {
          item.checked = checked;
          if (item.children.isNotEmpty) {
            checkedFun(item);
          }
        }
      }
    }

    e.checked = checked;
    checkedFun(e);
    _state!.reflesh();
  }

  bool getIndeterminate(SkyTreeNode e) {
    bool hasNoChecked = false;
    bool hasChecked = false;
    if (e.children.isEmpty) {
      return false;
    }
    if (e.children.isNotEmpty) {
      hasNoChecked = e.children.any((n) => !n.checked);
      hasChecked = e.children.any((n) => n.checked);
    }
    if (!hasNoChecked && hasChecked) {
      if (e.checked != true) {
        e.checked = true;
        scheduleMicrotask(() {
          _state!.reflesh();
        });
      }
    } else {
      if (e.checked != false) {
        e.checked = false;
        scheduleMicrotask(() {
          _state!.reflesh();
        });
      }
    }

    return hasNoChecked && hasChecked;
  }

  void insertChildren(List<SkyTreeNode> list, SkyTreeNode e) {
    if (e.checked) {
      for (SkyTreeNode item in list) {
        item.checked = true;
      }
    }
    e.children = list;
    _state!.reflesh();
    scheduleMicrotask(() {
      Future.delayed(const Duration(milliseconds: 200)).then((_) {
        scheduleMicrotask(() {
          collapseCtrMap[e.index]!.open();
        });
      });
    });
  }

  void _attach(_SkyTreeState state) {
    _state = state;
  }

  void _detach(_SkyTreeState state) {
    if (_state == state) {
      _state = null;
    }
  }
}
