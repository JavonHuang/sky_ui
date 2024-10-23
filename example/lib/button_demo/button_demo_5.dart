import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class ButtonDemo5 extends StatefulWidget {
  const ButtonDemo5({super.key});

  @override
  State<ButtonDemo5> createState() => _ButtonDemo5State();
}

class _ButtonDemo5State extends State<ButtonDemo5> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
