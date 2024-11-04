import 'package:flutter/material.dart';

import 'common/display_block.dart';
import 'common/title.dart';
import 'link_demo/link_demo_1.dart';
import 'link_demo/link_demo_2.dart';
import 'link_demo/link_demo_3.dart';
import 'link_demo/link_demo_4.dart';

class LinkDemo extends StatefulWidget {
  const LinkDemo({super.key});

  @override
  State<LinkDemo> createState() => _LinkDemoState();
}

class _LinkDemoState extends State<LinkDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Link 文字链接",
          descr: "文字链接",
        ),
        DemoTitle(
          title: "基础用法",
          descr: "基础的文字链接用法。",
        ),
        DisplayBlock(
          path: "link_demo_1",
          child: LinkDemo1(),
        ),
        DemoTitle(
          title: "禁用状态",
          descr: "文字链接不可用状态。",
        ),
        DisplayBlock(
          path: "link_demo_2",
          child: LinkDemo2(),
        ),
        DemoTitle(
          title: "下划线",
          descr: "文字链接下划线。",
        ),
        DisplayBlock(
          path: "link_demo_3",
          child: LinkDemo3(),
        ),
        DemoTitle(
          title: "图标",
          descr: "文字链接下划线。",
        ),
        DisplayBlock(
          path: "link_demo_4",
          child: LinkDemo4(),
        ),
      ],
    );
  }
}
