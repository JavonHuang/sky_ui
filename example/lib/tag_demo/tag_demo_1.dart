import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TagDemo1 extends StatefulWidget {
  const TagDemo1({super.key});

  @override
  State<TagDemo1> createState() => _TagDemo1State();
}

class _TagDemo1State extends State<TagDemo1> {
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
              text: "标签一五",
              type: SkyType.danger,
              plain: true,
            ),
          ],
        )
      ],
    );
  }
}
