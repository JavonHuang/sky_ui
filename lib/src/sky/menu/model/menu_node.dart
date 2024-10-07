part of '../index.dart';

class SkyMenuNode {
  final List<SkyMenuNode> children;
  final String index;
  final SkyMenuMeta data;

  bool get isLeaf => children.isEmpty;

  const SkyMenuNode({
    this.children = const [],
    required this.data,
    required this.index,
  });

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
  final MenuMateExt? ext;

  const SkyMenuMeta({
    required this.label,
    this.icon,
    this.ext,
  });
}

abstract class MenuMateExt {
  const MenuMateExt();

  T? me<T extends MenuMateExt>() {
    return call<T>();
  }

  T? call<T extends MenuMateExt>() {
    if (this is T) {
      return this as T;
    }
    return null;
  }
}
