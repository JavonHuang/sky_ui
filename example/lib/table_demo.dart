import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'table_demo/table_demo_1.dart';

class TableDemo extends StatefulWidget {
  const TableDemo({super.key});

  @override
  State<TableDemo> createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        child: TableDemo1(),
      ),
    ]);
  }
}
