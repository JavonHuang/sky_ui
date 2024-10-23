import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class LinkDemo1 extends StatefulWidget {
  const LinkDemo1({super.key});

  @override
  State<LinkDemo1> createState() => _LinkDemo1State();
}

class _LinkDemo1State extends State<LinkDemo1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          children: [
            const SkyLink(
              text: "默认链接",
              type: SkyLinkType.normal,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyLink(
              type: SkyLinkType.primary,
              text: "主要链接",
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyLink(
              type: SkyLinkType.success,
              text: "成功链接",
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyLink(
              type: SkyLinkType.warning,
              text: "警告链接",
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyLink(
              type: SkyLinkType.danger,
              text: "危险链接",
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyLink(
              type: SkyLinkType.info,
              text: "信息链接",
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyLink(
              type: SkyLinkType.normal,
              text: "无下划线",
              underline: false,
            ),
          ],
        ),
      ],
    );
  }
}
