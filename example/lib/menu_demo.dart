import 'package:flutter/material.dart';

import 'common/display_block.dart';
import 'common/title.dart';
import 'menu_demo/menu_demo_1.dart';

class MenuDemo extends StatefulWidget {
  const MenuDemo({super.key});

  @override
  State<MenuDemo> createState() => _MenuDemoState();
}

class _MenuDemoState extends State<MenuDemo> {
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
          description: "Alert 组件提供四种主题，由type属性指定，默认值为info。",
          path: "menu_demo_1",
          child: MenuDemo1(),
        ),
      ],
    );
  }
}
