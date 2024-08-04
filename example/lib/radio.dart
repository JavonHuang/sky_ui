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
        const Row(
          children: [
            SkyRadio(
              text: "吃热食",
              label: 1,
            ),
            SkyRadio(
              disabled: true,
              text: "吃热食",
              label: "1",
            ),
            SkyRadio(
              disabled: false,
              buttonStyle: true,
              text: "吃热食",
              label: 2,
            ),
            SkyRadio(
              disabled: true,
              buttonStyle: true,
              text: "吃热食",
              label: 1,
            ),
            // SkyGroupRadio(
            //   model: "1",
            //   children: [
            //     SkyRadio(
            //       text: "吃热食",
            //       label: "1",
            //     ),
            //     SkyRadio(
            //       text: "吃热食",
            //       label: "2",
            //     ),
            //   ],
            // )
          ],
        )
      ],
    );
  }
}
