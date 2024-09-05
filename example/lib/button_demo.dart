import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'common/display_block.dart';
import 'common/space.dart';
import 'common/title.dart';

class ButtonDemo extends StatefulWidget {
  const ButtonDemo({super.key});

  @override
  State<ButtonDemo> createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "基础用法",
          descr: "常用的操作按钮。",
        ),
        DisplayBlock(
          children: [
            SkyRow(
              gutter: 10,
              children: [
                SkyButton(
                  text: '默认按钮',
                ),
                SkyButton(
                  text: '主要按钮',
                  type: SkyType.primary,
                  onTap: () {},
                ),
                const SkyButton(
                  text: '成功按钮',
                  type: SkyType.success,
                ),
                const SkyButton(
                  text: '信息按钮',
                  type: SkyType.info,
                ),
                const SkyButton(
                  text: '警告按钮',
                  type: SkyType.warning,
                ),
                const SkyButton(
                  text: '危险按钮',
                  type: SkyType.danger,
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 10,
              children: [
                SkyButton(
                  text: '朴素按钮',
                  plain: true,
                ),
                SkyButton(
                  text: '主要按钮',
                  type: SkyType.primary,
                  plain: true,
                  size: SkySize.medium,
                ),
                const SkyButton(
                  text: '成功按钮',
                  type: SkyType.success,
                ),
                const SkyButton(
                  text: '信息按钮',
                  type: SkyType.info,
                  plain: true,
                ),
                const SkyButton(
                  text: '警告按钮',
                  type: SkyType.warning,
                  plain: true,
                ),
                const SkyButton(
                  text: '危险按钮',
                  type: SkyType.danger,
                  plain: true,
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 10,
              children: [
                const SkyButton(
                  text: '默认按钮',
                  round: true,
                ),
                const SkyButton(
                  text: '主要按钮',
                  type: SkyType.primary,
                  round: true,
                ),
                const SkyButton(
                  text: '成功按钮',
                  type: SkyType.success,
                  round: true,
                ),
                const SkyButton(
                  text: '信息按钮',
                  type: SkyType.info,
                  round: true,
                ),
                const SkyButton(
                  text: '警告按钮',
                  type: SkyType.warning,
                  round: true,
                ),
                const SkyButton(
                  text: '危险按钮',
                  type: SkyType.danger,
                  round: true,
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 10,
              children: [
                const SkyButton(
                  leftIcon: ElementIcons.search,
                  circle: true,
                ),
                const SkyButton(
                  leftIcon: ElementIcons.starOff,
                  type: SkyType.primary,
                  circle: true,
                ),
                const SkyButton(
                  leftIcon: ElementIcons.message,
                  type: SkyType.success,
                  circle: true,
                ),
                const SkyButton(
                  leftIcon: ElementIcons.check,
                  type: SkyType.info,
                  circle: true,
                ),
                const SkyButton(
                  leftIcon: ElementIcons.edit,
                  type: SkyType.warning,
                  circle: true,
                ),
                const SkyButton(
                  leftIcon: ElementIcons.delete,
                  type: SkyType.danger,
                  circle: true,
                ),
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "禁用状态",
          descr: "按钮不可用状态。",
        ),
        DisplayBlock(
          children: [
            SkyRow(
              gutter: 10,
              children: [
                const SkyButton(
                  text: '默认按钮',
                  disabled: true,
                ),
                const SkyButton(
                  text: '主要按钮',
                  type: SkyType.primary,
                  disabled: true,
                ),
                const SkyButton(
                  text: '成功按钮',
                  type: SkyType.success,
                  disabled: true,
                ),
                const SkyButton(
                  text: '信息按钮',
                  type: SkyType.info,
                  disabled: true,
                ),
                const SkyButton(
                  text: '警告按钮',
                  type: SkyType.warning,
                  disabled: true,
                ),
                const SkyButton(
                  text: '危险按钮',
                  type: SkyType.danger,
                  disabled: true,
                ),
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "文字按钮",
          descr: "没有边框和背景色的按钮。",
        ),
        DisplayBlock(
          children: [
            SkyRow(
              gutter: 10,
              children: [
                const SkyButton(
                  text: '文字按钮',
                  type: SkyType.text,
                ),
                const SkyButton(
                  text: '文字按钮',
                  type: SkyType.text,
                  disabled: true,
                ),
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "图标按钮",
          descr: "带图标的按钮可增强辨识度（有文字）或节省空间（无文字）。",
        ),
        DisplayBlock(children: [
          SkyRow(
            gutter: 10,
            children: [
              const SkyButton(
                type: SkyType.primary,
                leftIcon: ElementIcons.edit,
              ),
              const SkyButton(
                type: SkyType.primary,
                leftIcon: ElementIcons.share,
              ),
              const SkyButton(
                type: SkyType.primary,
                leftIcon: ElementIcons.delete,
              ),
              const SkyButton(
                text: '搜索',
                type: SkyType.primary,
                leftIcon: ElementIcons.search,
              ),
              const SkyButton(
                text: '上传',
                type: SkyType.primary,
                rightIcon: ElementIcons.upload,
              ),
            ],
          ),
        ]),
        const DemoTitle(
          title: "加载中",
          descr: "点击按钮后进行数据加载操作，在按钮上显示加载状态。",
        ),
        const DisplayBlock(
          children: [
            SkyRow(
              gutter: 10,
              children: [
                SkyButton(
                  text: '加载中',
                  type: SkyType.primary,
                  loading: true,
                ),
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "不同尺寸",
          descr: "Button 组件提供除了默认值以外的三种尺寸，可以在不同场景下选择合适的按钮尺寸。",
        ),
        DisplayBlock(children: [
          SkyRow(
            gutter: 10,
            children: [
              SkyButton(
                text: 'large按钮',
                size: SkySize.large,
              ),
              SkyButton(
                text: 'medium按钮',
                type: SkyType.primary,
                onTap: () {},
                size: SkySize.medium,
              ),
              const SkyButton(
                text: 'small按钮',
                type: SkyType.success,
                size: SkySize.small,
              ),
              const SkyButton(
                text: 'mini按钮',
                type: SkyType.info,
                size: SkySize.mini,
              ),
            ],
          ),
        ]),
      ],
    );
  }
}
