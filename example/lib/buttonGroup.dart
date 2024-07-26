import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class GroupButton extends StatefulWidget {
  const GroupButton({super.key});

  @override
  State<GroupButton> createState() => _GroupButtonState();
}

class _GroupButtonState extends State<GroupButton> {
  @override
  Widget build(BuildContext context) {
    return const ButtonGroup(
      children: [
        SkyButton(
          text: '主要按钮',
          type: SkyButtonType.primary,
        ),
        SkyButton(
          text: '主要按钮',
          type: SkyButtonType.primary,
        ),
      ],
    );
  }
}
