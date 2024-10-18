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
    if (node.children.isEmpty) {
      return null;
    }
    if (collapseCtrMap[node.index] == null) {
      collapseCtrMap[node.index] = SkyCollapseController();
    }
    if (node.isopen) {
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

  void _attach(_SkyTreeState state) {
    _state = state;
  }

  void _detach(_SkyTreeState state) {
    if (_state == state) {
      _state = null;
    }
  }
}
