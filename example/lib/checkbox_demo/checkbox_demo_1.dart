import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class CheckboxDemo1 extends StatefulWidget {
  const CheckboxDemo1({super.key});

  @override
  State<CheckboxDemo1> createState() => _CheckboxDemo1State();
}

class _CheckboxDemo1State extends State<CheckboxDemo1> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 10,
          children: [
            SkyCheckbox(
              text: "备选项",
              label: "备选项",
              model: true,
            ),
          ],
        ),
      ],
    );
  }
}
