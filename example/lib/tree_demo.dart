import 'package:flutter/material.dart';

import 'common/display_block.dart';
import 'common/title.dart';
import 'tree_demo/tree_demo_1.dart';
import 'tree_demo/tree_demo_2.dart';
import 'tree_demo/tree_demo_3.dart';
import 'tree_demo/tree_demo_4.dart';
import 'tree_demo/tree_demo_5.dart';
import 'tree_demo/tree_demo_6.dart';

class TreeDemo extends StatefulWidget {
  const TreeDemo({super.key});

  @override
  State<TreeDemo> createState() => _TreeDemoState();
}

class _TreeDemoState extends State<TreeDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Tree 树形控件",
          descr: "用清晰的层级结构展示信息，可展开或折叠。",
        ),
        DemoTitle(
          title: "基础用法",
          descr: "基础的树形结构展示。",
        ),
        DisplayBlock(
          description: "",
          path: "tree_demo_1",
          child: TreeDemo1(),
        ),
        DemoTitle(
          title: "可选择",
          descr: "适用于需要选择层级时使用。",
        ),
        DisplayBlock(
          description: "",
          path: "tree_demo_2",
          child: TreeDemo2(),
        ),
        DemoTitle(
          title: "懒加载自定义叶子节点",
          descr: "",
        ),
        DisplayBlock(
          description: "",
          path: "tree_demo_3",
          child: TreeDemo3(),
        ),
        DemoTitle(
          title: "默认展开和默认选中",
          descr: "",
        ),
        DisplayBlock(
          description: "",
          path: "tree_demo_4",
          child: TreeDemo4(),
        ),
        DemoTitle(
          title: "禁用状态",
          descr: "可将 Tree 的某些节点设置为禁用状态",
        ),
        DisplayBlock(
          description: "",
          path: "tree_demo_5",
          child: TreeDemo5(),
        ),
        DemoTitle(
          title: "自定义节点内容",
          descr: "节点的内容支持自定义，可以在节点区添加按钮或图标等内容",
        ),
        DisplayBlock(
          description: "",
          path: "tree_demo_6",
          child: TreeDemo6(),
        ),
      ],
    );
  }
}
