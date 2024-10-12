import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class LinkDemo3 extends StatefulWidget {
  const LinkDemo3({super.key});

  @override
  State<LinkDemo3> createState() => _LinkDemo3State();
}

class _LinkDemo3State extends State<LinkDemo3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          children: [
            const SkyLink(
              type: SkyLinkType.normal,
              text: "无下划线",
              underline: false,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyLink(
              type: SkyLinkType.normal,
              text: "有下划线",
            ),
          ],
        ),
      ],
    );
  }
}
