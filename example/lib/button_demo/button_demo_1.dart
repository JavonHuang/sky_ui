import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class ButtonDemo1 extends StatefulWidget {
  const ButtonDemo1({super.key});

  @override
  State<ButtonDemo1> createState() => _ButtonDemo1State();
}

class _ButtonDemo1State extends State<ButtonDemo1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
