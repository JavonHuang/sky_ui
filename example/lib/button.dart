import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class ButtonTest extends StatefulWidget {
  const ButtonTest({super.key});

  @override
  State<ButtonTest> createState() => _ButtonTestState();
}

class _ButtonTestState extends State<ButtonTest> {
  late bool dis = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        Text("基础用法"),
        Row(
          children: [
            SkyButton(
              text: '默认按钮',
              disabled: dis,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            SkyButton(
              text: '主要按钮',
              type: SkyType.primary,
              onTap: () {
                setState(() {
                  dis = !dis;
                });
              },
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '成功按钮',
              type: SkyType.success,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '信息按钮',
              type: SkyType.info,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '警告按钮',
              type: SkyType.warning,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '危险按钮',
              type: SkyType.danger,
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
              type: SkyType.primary,
              plain: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '成功按钮',
              type: SkyType.success,
              plain: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '信息按钮',
              type: SkyType.info,
              plain: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '警告按钮',
              type: SkyType.warning,
              plain: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '危险按钮',
              type: SkyType.danger,
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
              type: SkyType.primary,
              round: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '成功按钮',
              type: SkyType.success,
              round: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '信息按钮',
              type: SkyType.info,
              round: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '警告按钮',
              type: SkyType.warning,
              round: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '危险按钮',
              type: SkyType.danger,
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
              type: SkyType.primary,
              circle: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              leftIcon: ElementIcons.message,
              type: SkyType.success,
              circle: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              leftIcon: ElementIcons.check,
              type: SkyType.info,
              circle: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              leftIcon: ElementIcons.edit,
              type: SkyType.warning,
              circle: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              leftIcon: ElementIcons.delete,
              type: SkyType.danger,
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
              type: SkyType.primary,
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '成功按钮',
              type: SkyType.success,
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '信息按钮',
              type: SkyType.info,
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '警告按钮',
              type: SkyType.warning,
              disabled: true,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '危险按钮',
              type: SkyType.danger,
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
              type: SkyType.primary,
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
              type: SkyType.text,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '文字按钮',
              type: SkyType.text,
              disabled: true,
            ),
          ],
        ),
        const Text("图标按钮"),
        Row(
          children: [
            const SkyButton(
              type: SkyType.primary,
              leftIcon: ElementIcons.edit,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              type: SkyType.primary,
              leftIcon: ElementIcons.share,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              type: SkyType.primary,
              leftIcon: ElementIcons.delete,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '搜索',
              type: SkyType.primary,
              leftIcon: ElementIcons.search,
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyButton(
              text: '上传',
              type: SkyType.primary,
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
              type: SkyType.primary,
              loading: true,
            ),
          ],
        ),
      ],
    );
  }
}
