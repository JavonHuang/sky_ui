import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class TagDemo2 extends StatefulWidget {
  const TagDemo2({super.key});

  @override
  State<TagDemo2> createState() => _TagDemo2State();
}

class _TagDemo2State extends State<TagDemo2> {
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
              closable: true,
            ),
            SkyTag(
              text: "标签二",
              type: SkyType.success,
              plain: true,
              closable: true,
            ),
            SkyTag(
              text: "标签三",
              type: SkyType.info,
              plain: true,
              closable: true,
            ),
            SkyTag(
              text: "标签四",
              type: SkyType.warning,
              plain: true,
              closable: true,
            ),
            SkyTag(
              text: "标签一五",
              type: SkyType.danger,
              plain: true,
              closable: true,
            ),
          ],
        )
      ],
    );
  }
}
