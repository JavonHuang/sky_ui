import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class CheckBoxText extends StatefulWidget {
  const CheckBoxText({super.key});

  @override
  State<CheckBoxText> createState() => _CheckBoxTextState();
}

class _CheckBoxTextState extends State<CheckBoxText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("基础用法"),
        const Row(
          children: [
            SkyCheckbox(
              text: "备选项",
              label: "备选项",
              model: true,
            ),
            SizedBox(
              width: 10,
            ),
            SkyCheckbox(
              border: true,
              text: "备选项",
              label: "备选项",
              model: false,
            ),
            SizedBox(
              width: 10,
            ),
            SkyCheckbox(
              buttonStyle: true,
              text: "备选项",
              label: "备选项",
              model: true,
            ),
            SizedBox(
              width: 10,
            ),
            SkyCheckboxGroup(
              children: [
                SkyCheckbox(
                  text: "备选项1",
                  label: "备选项1",
                  model: true,
                ),
                SkyCheckbox(
                  text: "备选项2",
                  label: "备选项2",
                  model: true,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
