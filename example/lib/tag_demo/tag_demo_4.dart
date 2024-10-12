import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class TagDemo4 extends StatefulWidget {
  const TagDemo4({super.key});

  @override
  State<TagDemo4> createState() => _TagDemo4State();
}

class _TagDemo4State extends State<TagDemo4> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyTag(
              text: "标签一",
              type: SkyType.primary,
              plain: true,
            ),
            SkyTag(
              text: "标签二",
              type: SkyType.success,
              plain: true,
            ),
            SkyTag(
              text: "标签三",
              type: SkyType.info,
              plain: true,
            ),
            SkyTag(
              text: "标签四",
              type: SkyType.warning,
              plain: true,
            ),
            SkyTag(
              text: "标签五",
              type: SkyType.danger,
              plain: true,
            ),
          ],
        ),
        DemoSpace.vGap20,
        SkyRow(
          gutter: 20,
          children: [
            SkyTag(
              text: "标签一",
              type: SkyType.primary,
            ),
            SkyTag(
              text: "标签二",
              type: SkyType.success,
            ),
            SkyTag(
              text: "标签三",
              type: SkyType.info,
            ),
            SkyTag(
              text: "标签四",
              type: SkyType.warning,
            ),
            SkyTag(
              text: "标签五",
              type: SkyType.danger,
            ),
          ],
        )
      ],
    );
  }
}
