part of 'index.dart';

class SkyTreeController {
  _SkyTreeState? _state;
  String? activeIndex;
  late Map<String, SkyCollapseController> collapseCtrMap = {};

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
        collapseCtrMap[indexkey]!.toggleClose();
      }
    }
  }

  void closeChildrenCollapse(SkyTreeNode item) {
    List<String> closeList = [];
    void add(SkyTreeNode e) {
      if (e.children.isNotEmpty) {
        closeList.add(e.index);
        e.isExpend = false;
        for (SkyTreeNode n in e.children) {
          add(n);
        }
      } else {
        return;
      }
    }

    add(item);

    for (String indexkey in collapseCtrMap.keys) {
      if (closeList.contains(indexkey)) {
        collapseCtrMap[indexkey]!.toggleClose();
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
        collapseCtrMap[node.index]!.toggleOpen();
      });
    }
    return collapseCtrMap[node.index]!;
  }

  ///设置选中节点
  void setActiveIndex(String index, SkyTreeNode e) {
    activeIndex = index;
    _state!.reflesh();
    _state?.widget.onchanged?.call(activeIndex, e);
  }

  ///设置勾选节点
  void checkedNode(SkyTreeNode e, bool checked) {
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

  ///插入子节点
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
          collapseCtrMap[e.index]!.toggleOpen();
        });
      });
    });
  }

  ///展开节点
  void expendItem(SkyTreeNode e) {
    if (collapseCtrMap[e.index] != null) {
      if (collapseCtrMap[e.index]!.isOpen) {
        collapseCtrMap[e.index]!.toggleClose();
      } else {
        collapseCtrMap[e.index]!.toggleOpen();
      }
    }
  }

  ///设置展开节点
  void setExpendItem(List<String> strList) {
    for (String index in strList) {
      if (collapseCtrMap[index] != null) {
        collapseCtrMap[index]!.toggleOpen();
      }
    }
  }

  ///根据index查找节点
  SkyTreeNode? find(String index) {
    SkyTreeNode? result;
    for (SkyTreeNode item in _state!.dataList) {
      result = SkyTreeCommon.find(item, index);
      if (result != null) {
        break;
      }
    }
    return result;
  }

  ///根据index插入子节点
  void append(String index, SkyTreeNode neNode) {
    late SkyTreeNode? node = find(index);
    if (node != null) {
      node.children = [...node.children, neNode];
      _state!.reflesh();
    }
  }

  ///移除节点
  void remove(SkyTreeNode node) {
    List<String> removeIndex = [];
    SkyTreeCommon.traverseNode([node], (e) {
      removeIndex.add(e.index);
    });

    if (node.parentNode != null) {
      node.parentNode!.children.remove(node);
    } else {
      _state!.dataList.remove(node);
    }
    for (String e in removeIndex) {
      collapseCtrMap.remove(e);
    }
    _state!.reflesh();
  }

  ///清除所有勾选
  void clearChecked() {
    SkyTreeCommon.traverseNode(_state!.dataList, (e) {
      e.checked = false;
    });
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
