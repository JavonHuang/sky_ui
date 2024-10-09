part of '../index.dart';

class SkyMenuNode {
  final List<SkyMenuNode> children;
  final String index;
  final SkyMenuMeta data;
  bool get isLeaf => children.isEmpty;

  SkyMenuNode({
    this.children = const [],
    required this.data,
    required this.index,
  });

  // late List<SkyMenuNode> _parentNode = [];

  // set parentNode(List<SkyMenuNode> e) {
  //   _parentNode = e;
  // }

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

  SkyMenuNode? find(String id) {
    return queryMenuNodeByPath(this, id);
  }

  SkyMenuNode? queryMenuNodeByPath(SkyMenuNode node, String index) {
    if (node.index == index) {
      return node;
    }
    if (node.children.isNotEmpty) {
      for (int i = 0; i < node.children.length; i++) {
        SkyMenuNode? result = queryMenuNodeByPath(node.children[i], index);
        if (result != null) {
          return result;
        }
      }
    }
    return null;
  }
}

class SkyMenuMeta {
  final String label;
  final IconData? icon;
  final Map<String, dynamic>? ext;

  const SkyMenuMeta({
    required this.label,
    this.icon,
    this.ext,
  });
}
