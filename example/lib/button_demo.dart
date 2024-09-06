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
                const SkyButton(
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
            const SkyRow(
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
                SkyButton(
                  text: '成功按钮',
                  type: SkyType.success,
                ),
                SkyButton(
                  text: '信息按钮',
                  type: SkyType.info,
                  plain: true,
                ),
                SkyButton(
                  text: '警告按钮',
                  type: SkyType.warning,
                  plain: true,
                ),
                SkyButton(
                  text: '危险按钮',
                  type: SkyType.danger,
                  plain: true,
                ),
              ],
            ),
            DemoSpace.vGap20,
            const SkyRow(
              gutter: 10,
              children: [
                SkyButton(
                  text: '默认按钮',
                  round: true,
                ),
                SkyButton(
                  text: '主要按钮',
                  type: SkyType.primary,
                  round: true,
                ),
                SkyButton(
                  text: '成功按钮',
                  type: SkyType.success,
                  round: true,
                ),
                SkyButton(
                  text: '信息按钮',
                  type: SkyType.info,
                  round: true,
                ),
                SkyButton(
                  text: '警告按钮',
                  type: SkyType.warning,
                  round: true,
                ),
                SkyButton(
                  text: '危险按钮',
                  type: SkyType.danger,
                  round: true,
                ),
              ],
            ),
            DemoSpace.vGap20,
            const SkyRow(
              gutter: 10,
              children: [
                SkyButton(
                  leftIcon: ElementIcons.search,
                  circle: true,
                ),
                SkyButton(
                  leftIcon: ElementIcons.edit,
                  type: SkyType.primary,
                  circle: true,
                ),
                SkyButton(
                  leftIcon: ElementIcons.check,
                  type: SkyType.success,
                  circle: true,
                ),
                SkyButton(
                  leftIcon: ElementIcons.message,
                  type: SkyType.info,
                  circle: true,
                ),
                SkyButton(
                  leftIcon: ElementIcons.starOff,
                  type: SkyType.warning,
                  circle: true,
                ),
                SkyButton(
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
        const DisplayBlock(
          children: [
            SkyRow(
              gutter: 10,
              children: [
                SkyButton(
                  text: '默认按钮',
                  disabled: true,
                ),
                SkyButton(
                  text: '主要按钮',
                  type: SkyType.primary,
                  disabled: true,
                ),
                SkyButton(
                  text: '成功按钮',
                  type: SkyType.success,
                  disabled: true,
                ),
                SkyButton(
                  text: '信息按钮',
                  type: SkyType.info,
                  disabled: true,
                ),
                SkyButton(
                  text: '警告按钮',
                  type: SkyType.warning,
                  disabled: true,
                ),
                SkyButton(
                  text: '危险按钮',
                  type: SkyType.danger,
                  disabled: true,
                ),
              ],
            ),
            DemoSpace.vGap20,
            SkyRow(
              gutter: 10,
              children: [
                SkyButton(
                  text: '朴素按钮',
                  disabled: true,
                  plain: true,
                ),
                SkyButton(
                  text: '主要按钮',
                  type: SkyType.primary,
                  disabled: true,
                  plain: true,
                ),
                SkyButton(
                  text: '成功按钮',
                  type: SkyType.success,
                  disabled: true,
                  plain: true,
                ),
                SkyButton(
                  text: '信息按钮',
                  type: SkyType.info,
                  disabled: true,
                  plain: true,
                ),
                SkyButton(
                  text: '警告按钮',
                  type: SkyType.warning,
                  disabled: true,
                  plain: true,
                ),
                SkyButton(
                  text: '危险按钮',
                  type: SkyType.danger,
                  disabled: true,
                  plain: true,
                ),
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "文字按钮",
          descr: "没有边框和背景色的按钮。",
        ),
        const DisplayBlock(
          children: [
            SkyRow(
              gutter: 10,
              children: [
                SkyButton(
                  text: '文字按钮',
                  type: SkyType.text,
                ),
                SkyButton(
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
        const DisplayBlock(children: [
          SkyRow(
            gutter: 10,
            children: [
              SkyButton(
                type: SkyType.primary,
                leftIcon: ElementIcons.edit,
              ),
              SkyButton(
                type: SkyType.primary,
                leftIcon: ElementIcons.share,
              ),
              SkyButton(
                type: SkyType.primary,
                leftIcon: ElementIcons.delete,
              ),
              SkyButton(
                text: '搜索',
                type: SkyType.primary,
                leftIcon: ElementIcons.search,
              ),
              SkyButton(
                text: '上传',
                type: SkyType.primary,
                rightIcon: ElementIcons.upload,
              ),
            ],
          ),
        ]),
        const DemoTitle(
          title: "按钮组",
          descr: "以按钮组的方式出现，常用于多项类似操作。",
        ),
        const DisplayBlock(
          children: [
            SkyRow(
              gutter: 10,
              children: [
                ButtonGroup(
                  type: SkyType.primary,
                  children: [
                    SkyButton(
                      leftIcon: ElementIcons.arrowLeft,
                      text: '上一页',
                      buttonKey: '1',
                    ),
                    SkyButton(
                      rightIcon: ElementIcons.arrowRight,
                      text: '下一页',
                      buttonKey: '2',
                    ),
                  ],
                ),
                ButtonGroup(
                  type: SkyType.primary,
                  children: [
                    SkyButton(
                      leftIcon: ElementIcons.edit,
                      text: '',
                      buttonKey: '1',
                    ),
                    SkyButton(
                      rightIcon: ElementIcons.link,
                      text: '',
                      buttonKey: '2',
                    ),
                    SkyButton(
                      rightIcon: ElementIcons.delete,
                      text: '',
                      buttonKey: '3',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
              const SkyButton(
                text: '大型按钮',
                size: SkySize.large,
              ),
              SkyButton(
                text: '中等按钮',
                onTap: () {},
                size: SkySize.medium,
              ),
              const SkyButton(
                text: '小型按钮',
                size: SkySize.small,
              ),
              const SkyButton(
                text: '超小按钮',
                size: SkySize.mini,
              ),
            ],
          ),
          DemoSpace.vGap20,
          SkyRow(
            gutter: 10,
            children: [
              const SkyButton(
                text: '大型按钮',
                size: SkySize.large,
                round: true,
              ),
              SkyButton(
                text: '中等按钮',
                onTap: () {},
                size: SkySize.medium,
                round: true,
              ),
              const SkyButton(
                text: '小型按钮',
                size: SkySize.small,
                round: true,
              ),
              const SkyButton(
                text: '超小按钮',
                size: SkySize.mini,
                round: true,
              ),
            ],
          ),
        ]),
      ],
    );
  }
}
