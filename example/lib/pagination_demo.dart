import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'pagination_demo/pagination_demo_1.dart';
import 'pagination_demo/pagination_demo_2.dart';
import 'pagination_demo/pagination_demo_3.dart';

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
          title: "Pagination 分页",
          descr: "当数据量过多时，使用分页分解数据。",
        ),
        DemoTitle(
          title: "基础用法",
          descr: "",
        ),
        DisplayBlock(
          description: "",
          path: "pagination_demo_1",
          child: PaginationDemo1(),
        ),
        DemoTitle(
          title: "设置最大页码按钮数",
          descr: "",
        ),
        DisplayBlock(
          description: "默认情况下，当总页数超过 7 页时，Pagination 会折叠多余的页码按钮。通过pager-count属性可以设置最大页码按钮数。",
          path: "pagination_demo_2",
          child: PaginationDemo2(),
        ),
        DemoTitle(
          title: "带有背景色的分页",
          descr: "",
        ),
        DisplayBlock(
          description: "设置background属性可以为分页按钮添加背景色。",
          path: "pagination_demo_3",
          child: PaginationDemo3(),
        ),
      ],
    );
  }
}
