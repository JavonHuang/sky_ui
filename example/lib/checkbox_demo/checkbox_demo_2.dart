import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class CheckboxDemo2 extends StatefulWidget {
  const CheckboxDemo2({super.key});

  @override
  State<CheckboxDemo2> createState() => _CheckboxDemo2State();
}

class _CheckboxDemo2State extends State<CheckboxDemo2> {
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
            ),
            SkyCheckbox(
              text: "备选项",
              label: "备选项",
              disabled: true,
            ),
          ],
        ),
      ],
    );
  }
}
