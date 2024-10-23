import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'infinite_scroll_demo/infinite_scroll_demo_1.dart';

class InfiniteScrollDemo extends StatefulWidget {
  const InfiniteScrollDemo({super.key});

  @override
  State<InfiniteScrollDemo> createState() => _InfiniteScrollDemoState();
}

class _InfiniteScrollDemoState extends State<InfiniteScrollDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "InfiniteScroll 无限滚动",
          descr: "滚动至底部时，加载更多数据。",
        ),
        DemoTitle(
          title: "基础用法",
        ),
        DisplayBlock(
          child: InfiniteScrollDemo1(),
        ),
      ],
    );
  }
}
