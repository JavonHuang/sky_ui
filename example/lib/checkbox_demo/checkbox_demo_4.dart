import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class CheckboxDemo4 extends StatefulWidget {
  const CheckboxDemo4({super.key});

  @override
  State<CheckboxDemo4> createState() => _CheckboxDemo4State();
}

class _CheckboxDemo4State extends State<CheckboxDemo4> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 10,
          children: [
            SkyCheckbox(
              text: "备选项1",
              label: "备选项1",
              disabled: true,
              indeterminate: true,
            ),
          ],
        ),
      ],
    );
  }
}
