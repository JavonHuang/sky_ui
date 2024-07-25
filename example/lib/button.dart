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
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("基础用法"),
        Row(
          children: [
            SkyButton(
              text: '默认按钮',
            ),
            SkyButton(
              text: '主要按钮',
              type: SkyButtonType.primary,
            ),
            SkyButton(
              text: '成功按钮',
              type: SkyButtonType.success,
            ),
            SkyButton(
              text: '信息按钮',
              type: SkyButtonType.info,
            ),
            SkyButton(
              text: '警告按钮',
              type: SkyButtonType.warning,
            ),
            SkyButton(
              text: '危险按钮',
              type: SkyButtonType.danger,
            ),
          ],
        ),
        Row(
          children: [
            SkyButton(
              text: '默认按钮',
            ),
            SkyButton(
              text: '主要按钮',
              type: SkyButtonType.primary,
              plain: true,
            ),
            SkyButton(
              text: '成功按钮',
              type: SkyButtonType.success,
              plain: true,
            ),
            SkyButton(
              text: '信息按钮',
              type: SkyButtonType.info,
              plain: true,
            ),
            SkyButton(
              text: '警告按钮',
              type: SkyButtonType.warning,
              plain: true,
            ),
            SkyButton(
              text: '危险按钮',
              type: SkyButtonType.danger,
              plain: true,
            ),
          ],
        ),
        Row(
          children: [
            SkyButton(
              text: '默认按钮',
              round: true,
            ),
            SkyButton(
              text: '主要按钮',
              type: SkyButtonType.primary,
              round: true,
            ),
            SkyButton(
              text: '成功按钮',
              type: SkyButtonType.success,
              round: true,
            ),
            SkyButton(
              text: '信息按钮',
              type: SkyButtonType.info,
              round: true,
            ),
            SkyButton(
              text: '警告按钮',
              type: SkyButtonType.warning,
              round: true,
            ),
            SkyButton(
              text: '危险按钮',
              type: SkyButtonType.danger,
              round: true,
            ),
          ],
        ),
        Row(
          children: [
            SkyButton(
              leftIcon: ElementIcons.search,
              circle: true,
            ),
            SkyButton(
              leftIcon: ElementIcons.starOff,
              type: SkyButtonType.primary,
              circle: true,
            ),
            SkyButton(
              leftIcon: ElementIcons.message,
              type: SkyButtonType.success,
              circle: true,
            ),
            SkyButton(
              leftIcon: ElementIcons.check,
              type: SkyButtonType.info,
              circle: true,
            ),
            SkyButton(
              leftIcon: ElementIcons.edit,
              type: SkyButtonType.warning,
              circle: true,
            ),
            SkyButton(
              leftIcon: ElementIcons.delete,
              type: SkyButtonType.danger,
              circle: true,
            ),
          ],
        ),
        Text("禁用状态"),
        Row(
          children: [
            SkyButton(
              text: '默认按钮',
              disabled: true,
            ),
            SkyButton(
              text: '主要按钮',
              type: SkyButtonType.primary,
              disabled: true,
            ),
            SkyButton(
              text: '成功按钮',
              type: SkyButtonType.success,
              disabled: true,
            ),
            SkyButton(
              text: '信息按钮',
              type: SkyButtonType.info,
              disabled: true,
            ),
            SkyButton(
              text: '警告按钮',
              type: SkyButtonType.warning,
              disabled: true,
            ),
            SkyButton(
              text: '危险按钮',
              type: SkyButtonType.danger,
              disabled: true,
            ),
          ],
        ),
        Text("图标按钮"),
        Row(
          children: [
            SkyButton(
              text: '信息按钮',
              type: SkyButtonType.primary,
              leftIcon: ElementIcons.aim,
              rightIcon: ElementIcons.alarmClock,
            ),
          ],
        )
      ],
    );
  }
}
