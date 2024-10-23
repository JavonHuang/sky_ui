import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class CheckboxDemo5 extends StatefulWidget {
  const CheckboxDemo5({super.key});

  @override
  State<CheckboxDemo5> createState() => _CheckboxDemo5State();
}

class _CheckboxDemo5State extends State<CheckboxDemo5> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 10,
          children: [
            SkyCheckboxGroup(
              model: const ["val1", "val3"],
              min: 1,
              max: 2,
              children: [
                SkyCheckboxOption(
                  text: "上海",
                  label: "val1",
                ),
                SkyCheckboxOption(
                  text: "广州",
                  label: "val2",
                ),
                SkyCheckboxOption(
                  text: "深圳",
                  label: "val3",
                ),
                SkyCheckboxOption(
                  text: "北京",
                  label: "val4",
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
