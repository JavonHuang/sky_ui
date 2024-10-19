part of '../index.dart';

class SkyTreeNode {
  late List<SkyTreeNode> children;
  final String index;
  final SkyTreeMeta data;
  late bool isExpend;
  late bool disabled;

  SkyTreeNode({
    this.children = const [],
    required this.data,
    required this.index,
    this.isExpend = false,
    this.disabled = false,
  });

  bool get isLeaf => children.isEmpty;
  late SkyTreeNode? parentNode;
  late bool checked = false;
  late bool loadFinish = false;
  late bool pinding = false;

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
    return SkyTreeCommon.find(this, e) != null;
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
