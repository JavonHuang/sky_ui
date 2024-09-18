import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/space.dart';
import 'common/title.dart';

class DescriptionsDemo extends StatefulWidget {
  const DescriptionsDemo({super.key});

  @override
  State<DescriptionsDemo> createState() => _DescriptionsDemoState();
}

class _DescriptionsDemoState extends State<DescriptionsDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "Descriptions 描述列表",
          descr: "列表形式展示多个字段。",
        ),
        const DemoTitle(
          title: "基本用法",
          descr: "",
        ),
        DisplayBlock(
          children: [
            SkyDescriptions(
              title: "用户信息",
              children: [],
            ),
          ],
        ),
      ],
    );
  }
}
