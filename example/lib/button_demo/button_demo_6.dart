import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class ButtonDemo6 extends StatefulWidget {
  const ButtonDemo6({super.key});

  @override
  State<ButtonDemo6> createState() => _ButtonDemo6State();
}

class _ButtonDemo6State extends State<ButtonDemo6> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
