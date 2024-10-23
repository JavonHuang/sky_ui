import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class ButtonDemo4 extends StatefulWidget {
  const ButtonDemo4({super.key});

  @override
  State<ButtonDemo4> createState() => _ButtonDemo4State();
}

class _ButtonDemo4State extends State<ButtonDemo4> {
  @override
  Widget build(BuildContext context) {
    return const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
    ]);
  }
}
