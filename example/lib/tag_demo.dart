import 'package:example/common/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'common/display_block.dart';
import 'common/title.dart';

class TagDemo extends StatefulWidget {
  const TagDemo({super.key});

  @override
  State<TagDemo> createState() => _TagDemoState();
}

class _TagDemoState extends State<TagDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Tag 标签",
          descr: "用于标记和选择。",
        ),
        DemoTitle(
          title: "基础用法",
        ),
        DisplayBlock(
          description: "由type属性来选择tag的类型，也可以通过color属性来自定义背景色。",
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
        ),
        DemoTitle(
          title: "可移除标签",
        ),
        DisplayBlock(
          description: "设置closable属性可以定义一个标签是否可移除。默认的标签移除时会附带渐变动画，如果不想使用，",
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
        ),
        DemoTitle(
          title: "不同尺寸",
        ),
        DisplayBlock(
          description: "Tag 组件提供除了默认值以外的三种尺寸，可以在不同场景下选择合适的按钮尺寸。",
          children: [
            SkyRow(
              gutter: 20,
              children: [
                SkyTag(
                  text: "标签一",
                  type: SkyType.primary,
                  plain: true,
                  closable: true,
                  size: SkySize.large,
                ),
                SkyTag(
                  text: "标签二",
                  type: SkyType.success,
                  plain: true,
                  closable: true,
                  size: SkySize.medium,
                ),
                SkyTag(
                  text: "标签三",
                  type: SkyType.info,
                  plain: true,
                  closable: true,
                  size: SkySize.small,
                ),
                SkyTag(
                  text: "标签四",
                  type: SkyType.warning,
                  plain: true,
                  closable: true,
                  size: SkySize.mini,
                ),
              ],
            )
          ],
        ),
        DemoTitle(
          title: "不同主题",
        ),
        DisplayBlock(
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
        ),
      ],
    );
  }
}
