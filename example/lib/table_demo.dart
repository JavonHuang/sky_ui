import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'table_demo/table_demo_1.dart';
import 'table_demo/table_demo_2.dart';
import 'table_demo/table_demo_3.dart';
import 'table_demo/table_demo_4.dart';
import 'table_demo/table_demo_5.dart';

class TableDemo extends StatefulWidget {
  const TableDemo({super.key});

  @override
  State<TableDemo> createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Table 表格",
          descr: "用于展示多条结构类似的数据，可对数据进行排序、筛选、对比或其他自定义操作。",
        ),
        DemoTitle(
          title: "基础表格",
          descr: "基础的表格展示用法。",
        ),
        DisplayBlock(
          description: "",
          child: TableDemo1(),
        ),
        DemoTitle(
          title: "带斑马纹表格",
          descr: "使用带斑马纹的表格，可以更容易区分出不同行的数据。",
        ),
        DisplayBlock(
          description: "",
          child: TableDemo2(),
        ),
        DemoTitle(
          title: "带边框表格",
          descr: "",
        ),
        DisplayBlock(
          description: "",
          child: TableDemo3(),
        ),
        DemoTitle(
          title: "带状态表格",
          descr: "可将表格内容 highlight 显示，方便区分「成功、信息、警告、危险」等内容。",
        ),
        DisplayBlock(
          description: "可以通过指定 Table 组件的 rowStyle 函数钩子来为 Table 中的某一行设置样式，表明该行处于某种状态。",
          child: TableDemo4(),
        ),
        DemoTitle(
          title: "固定列",
          descr: "横向内容过多时，可选择固定列。",
        ),
        DisplayBlock(
          description: "固定列需要使用fixed属性，它接受 SkyFixed ，表示左边固定还是右边固定。",
          child: TableDemo5(),
        ),
      ],
    );
  }
}
