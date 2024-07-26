import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class ButtonTest extends StatefulWidget {
  const ButtonTest({super.key});

  @override
  State<ButtonTest> createState() => _ButtonTestState();
}

class _ButtonTestState extends State<ButtonTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("基础用法"),
        Row(
          children: [
            const SkyButton(
              text: '默认按钮',
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '主要按钮',
              type: SkyButtonType.primary,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '成功按钮',
              type: SkyButtonType.success,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '信息按钮',
              type: SkyButtonType.info,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '警告按钮',
              type: SkyButtonType.warning,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '危险按钮',
              type: SkyButtonType.danger,
            ),
          ],
        ),
        SizedBox(height: SkySpacings().mainSpacing),
        Row(
          children: [
            const SkyButton(
              text: '默认按钮',
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '主要按钮',
              type: SkyButtonType.primary,
              plain: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '成功按钮',
              type: SkyButtonType.success,
              plain: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '信息按钮',
              type: SkyButtonType.info,
              plain: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '警告按钮',
              type: SkyButtonType.warning,
              plain: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '危险按钮',
              type: SkyButtonType.danger,
              plain: true,
            ),
          ],
        ),
        SizedBox(height: SkySpacings().mainSpacing),
        Row(
          children: [
            const SkyButton(
              text: '默认按钮',
              round: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '主要按钮',
              type: SkyButtonType.primary,
              round: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '成功按钮',
              type: SkyButtonType.success,
              round: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '信息按钮',
              type: SkyButtonType.info,
              round: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '警告按钮',
              type: SkyButtonType.warning,
              round: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '危险按钮',
              type: SkyButtonType.danger,
              round: true,
            ),
          ],
        ),
        SizedBox(height: SkySpacings().mainSpacing),
        Row(
          children: [
            const SkyButton(
              leftIcon: ElementIcons.search,
              circle: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              leftIcon: ElementIcons.starOff,
              type: SkyButtonType.primary,
              circle: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              leftIcon: ElementIcons.message,
              type: SkyButtonType.success,
              circle: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              leftIcon: ElementIcons.check,
              type: SkyButtonType.info,
              circle: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              leftIcon: ElementIcons.edit,
              type: SkyButtonType.warning,
              circle: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              leftIcon: ElementIcons.delete,
              type: SkyButtonType.danger,
              circle: true,
            ),
          ],
        ),
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("禁用状态"),
        Row(
          children: [
            const SkyButton(
              text: '默认按钮',
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '主要按钮',
              type: SkyButtonType.primary,
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '成功按钮',
              type: SkyButtonType.success,
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '信息按钮',
              type: SkyButtonType.info,
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '警告按钮',
              type: SkyButtonType.warning,
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '危险按钮',
              type: SkyButtonType.danger,
              disabled: true,
            ),
          ],
        ),
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("图标按钮"),
        const Row(
          children: [
            SkyButton(
              text: '信息按钮',
              type: SkyButtonType.primary,
              leftIcon: ElementIcons.aim,
              rightIcon: ElementIcons.alarmClock,
            ),
          ],
        ),
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("文字按钮"),
        Row(
          children: [
            const SkyButton(
              text: '文字按钮',
              type: SkyButtonType.text,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '文字按钮',
              type: SkyButtonType.text,
              disabled: true,
            ),
          ],
        ),
        const Text("图标按钮"),
        Row(
          children: [
            const SkyButton(
              type: SkyButtonType.primary,
              leftIcon: ElementIcons.edit,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              type: SkyButtonType.primary,
              leftIcon: ElementIcons.share,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              type: SkyButtonType.primary,
              leftIcon: ElementIcons.delete,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '搜索',
              type: SkyButtonType.primary,
              leftIcon: ElementIcons.search,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '上传',
              type: SkyButtonType.primary,
              rightIcon: ElementIcons.upload,
            ),
          ],
        ),
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("加载中"),
        const Row(
          children: [
            SkyButton(
              text: '加载中',
              type: SkyButtonType.primary,
              loading: true,
            ),
          ],
        ),
      ],
    );
  }
}
