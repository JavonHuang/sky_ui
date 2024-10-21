import '../index.dart';

class SkyTreeCommon {
  static SkyTreeNode? find(SkyTreeNode node, String id) {
    return queryMenuNodeByPath(node, id);
  }

  static SkyTreeNode? queryMenuNodeByPath(SkyTreeNode node, String index) {
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

  ///遍历节点
  static void traverseNode(List<SkyTreeNode> list, Function(SkyTreeNode e) func) {
    for (SkyTreeNode node in list) {
      func(node);
      if (node.children.isNotEmpty) {
        traverseNode(node.children, func);
      }
    }
  }
}
