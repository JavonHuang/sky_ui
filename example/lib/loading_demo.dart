import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'loading_demo/loading_demo_1.dart';
import 'loading_demo/loading_demo_2.dart';
import 'loading_demo/loading_demo_3.dart';

class LoadingDemo extends StatefulWidget {
  const LoadingDemo({super.key});

  @override
  State<LoadingDemo> createState() => _LoadingDemoState();
}

class _LoadingDemoState extends State<LoadingDemo> {
  late SkyLoading skyLoading_1 = SkyLoading(hidden: false);
  late SkyLoading skyLoading_2 = SkyLoading(hidden: false, customizeColor: const Color.fromARGB(61, 0, 0, 0));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Loading 加载",
          descr: "加载数据时显示动效。",
        ),
        DemoTitle(
          title: "区域加载",
          descr: "在表格等容器中加载数据时显示。",
        ),
        DisplayBlock(
          description: "Sky-ui 提供了类对象的服务控制。通过SkyLoading实例对象可以在指定实现局部加载，通过hide，show函数可以实现显示隐藏。",
          path: "loading_demo_1",
          child: LoadingDemo1(),
        ),
        DemoTitle(
          title: "自定义",
          descr: "可自定义加载文案、图标和背景色。",
        ),
        DisplayBlock(
          description: "Sky-ui 提供了类对象的服务控制。通过SkyLoading实例对象可以在指定实现局部加载，通过hide，show函数可以实现显示隐藏。",
          path: "loading_demo_2",
          child: LoadingDemo2(),
        ),
        DemoTitle(
          title: "整页加载",
          descr: "页面数据加载时显示。",
        ),
        DisplayBlock(
          description: "Sky-ui SkyLoading静态对象实现了全局遮罩，通过service，close控制显示隐藏",
          path: "loading_demo_3",
          child: LoadingDemo3(),
        ),
      ],
    );
  }
}
