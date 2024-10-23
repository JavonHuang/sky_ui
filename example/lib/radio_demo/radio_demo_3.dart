import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class RadioDemo3 extends StatefulWidget {
  const RadioDemo3({super.key});

  @override
  State<RadioDemo3> createState() => _RadioDemo3State();
}

class _RadioDemo3State extends State<RadioDemo3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          children: [
            SkyGroupRadio(
              model: "1",
              options: [
                SkyRadioOption(
                  text: "备选项",
                  label: "1",
                ),
                SkyRadioOption(
                  text: "备选项",
                  label: "2",
                ),
                SkyRadioOption(
                  text: "备选项",
                  label: "3",
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
