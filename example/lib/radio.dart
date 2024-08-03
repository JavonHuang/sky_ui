import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class RadioTest extends StatefulWidget {
  const RadioTest({super.key});

  @override
  State<RadioTest> createState() => _RadioTestState();
}

class _RadioTestState extends State<RadioTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        Text("基础用法"),
        Row(
          children: [
            SkyRadio(
              disabled: false,
              text: "吃热食",
            ),
          ],
        )
      ],
    );
  }
}
