import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class LinkText extends StatefulWidget {
  const LinkText({super.key});

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("Link 文字链接"),
        Row(
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
        const Text("Link 文字链接带图标"),
        Row(
          children: [
            const SkyLink(
              text: "默认链接",
              type: SkyLinkType.normal,
              leftIcon: ElementIcons.addLocation,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyLink(
              type: SkyLinkType.primary,
              text: "主要链接",
              rightIcon: ElementIcons.apple,
            ),
          ],
        ),
        SizedBox(height: SkySpacings().mainSpacing),
      ],
    );
  }
}
