import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'pagination_demo/pagination_demo_1.dart';

class PaginationDemo extends StatefulWidget {
  const PaginationDemo({super.key});

  @override
  State<PaginationDemo> createState() => _PaginationDemoState();
}

class _PaginationDemoState extends State<PaginationDemo> {
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
          child: PaginationDemo1(),
        ),
      ],
    );
  }
}
