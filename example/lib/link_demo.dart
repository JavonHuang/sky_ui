import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'common/display_block.dart';
import 'common/title.dart';

class LinkDemo extends StatefulWidget {
  const LinkDemo({super.key});

  @override
  State<LinkDemo> createState() => _LinkDemoState();
}

class _LinkDemoState extends State<LinkDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "Link 文字链接",
          descr: "文字链接",
        ),
        const DemoTitle(
          title: "基础用法",
          descr: "基础的文字链接用法。",
        ),
        DisplayBlock(
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
        ),
        const DemoTitle(
          title: "禁用状态",
          descr: "文字链接不可用状态。",
        ),
        DisplayBlock(
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
        ),
        const DemoTitle(
          title: "下划线",
          descr: "文字链接下划线。",
        ),
        DisplayBlock(
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
        ),
        const DemoTitle(
          title: "图标",
          descr: "文字链接下划线。",
        ),
        DisplayBlock(
          children: [
            SkyRow(
              children: [
                const SkyLink(
                  text: "编辑",
                  type: SkyLinkType.normal,
                  leftIcon: ElementIcons.edit,
                ),
                SizedBox(width: SkySpacings().mainSpacing),
                const SkyLink(
                  type: SkyLinkType.primary,
                  text: "查看",
                  rightIcon: ElementIcons.view,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
