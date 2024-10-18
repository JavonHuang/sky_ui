part of '../index.dart';

class SkyTreeNode {
  final List<SkyTreeNode> children;
  final String index;
  final SkyTreeMeta data;
  late bool isopen;
  SkyTreeNode({
    this.children = const [],
    required this.data,
    required this.index,
    this.isopen = false,
  });

  bool get isLeaf => children.isEmpty;
  late SkyTreeNode? parentNode;
  late bool checked=false;

  bool isCurrent(String? e) {
    if (e == null) {
      return false;
    }
    return e == index;
  }

  bool isInChildren(String? e) {
    if (e == null) {
      return false;
    }
    return find(e) != null;
  }

  SkyTreeNode? find(String id) {
    return queryMenuNodeByPath(this, id);
  }

  SkyTreeNode? queryMenuNodeByPath(SkyTreeNode node, String index) {
    if (node.index == index) {
      return node;
    }
    if (node.children.isNotEmpty) {
      for (int i = 0; i < node.children.length; i++) {
        SkyTreeNode? result = queryMenuNodeByPath(node.children[i], index);
        if (result != null) {
          return result;
        }
      }
    }
    return null;
  }
}

class SkyTreeMeta {
  final String label;
  final IconData? icon;
  final Map<String, dynamic>? ext;

  const SkyTreeMeta({
    required this.label,
    this.icon,
    this.ext,
  });
}
