import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TagTest extends StatefulWidget {
  const TagTest({super.key});

  @override
  State<TagTest> createState() => _TagTestState();
}

class _TagTestState extends State<TagTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("Tag 标签"),
        Row(
          children: [
            const SkyTag(
              text: "标签一",
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyTag(
              text: "标签二",
              type: SkyTagType.primary,
              closable: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyTag(
              text: "标签二",
              type: SkyTagType.primary,
              closable: true,
              plain: true,
            )
          ],
        ),
        SizedBox(height: SkySpacings().mainSpacing),
      ],
    );
  }
}
