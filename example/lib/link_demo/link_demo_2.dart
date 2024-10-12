import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class LinkDemo2 extends StatefulWidget {
  const LinkDemo2({super.key});

  @override
  State<LinkDemo2> createState() => _LinkDemo2State();
}

class _LinkDemo2State extends State<LinkDemo2> {
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
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyLink(
              type: SkyLinkType.primary,
              text: "主要链接",
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyLink(
              type: SkyLinkType.success,
              text: "成功链接",
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyLink(
              type: SkyLinkType.warning,
              text: "警告链接",
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyLink(
              type: SkyLinkType.danger,
              text: "危险链接",
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyLink(
              type: SkyLinkType.info,
              text: "信息链接",
              disabled: true,
            ),
          ],
        ),
      ],
    );
  }
}
