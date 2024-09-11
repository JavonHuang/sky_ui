import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/space.dart';
import 'common/title.dart';

class LoadingDemo extends StatefulWidget {
  const LoadingDemo({super.key});

  @override
  State<LoadingDemo> createState() => _LoadingDemoState();
}

class _LoadingDemoState extends State<LoadingDemo> {
  late SkyLoading skyLoading_1 = SkyLoading();
  late SkyLoading skyLoading_2 = SkyLoading();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "Loading 加载",
          descr: "加载数据时显示动效。",
        ),
        const DemoTitle(
          title: "区域加载",
          descr: "在表格等容器中加载数据时显示。",
        ),
        DisplayBlock(
          description: "Alert 组件提供四种主题，由type属性指定，默认值为info。",
          children: [
            skyLoading_1.builder(
              context,
              child: Container(
                height: 100,
                // color: Colors.blue,
              ),
            ),
            skyLoading_2.builder(
              context,
              child: Container(
                height: 100,
                // color: Colors.green,
              ),
            ),
            SkyRow(
              gutter: 20,
              children: [
                SkyButton(
                  text: "全局",
                  onTap: () {
                    SkyLoading.service();
                    Future.delayed(const Duration(seconds: 2)).then((e) {
                      SkyLoading.close();
                    });
                  },
                ),
                // ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
