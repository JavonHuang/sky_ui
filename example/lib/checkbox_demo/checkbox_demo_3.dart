import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class CheckboxDemo3 extends StatefulWidget {
  const CheckboxDemo3({super.key});

  @override
  State<CheckboxDemo3> createState() => _CheckboxDemo3State();
}

class _CheckboxDemo3State extends State<CheckboxDemo3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 10,
          children: [
            SkyCheckboxGroup(
              model: ["val1", "val5"],
              children: [
                SkyCheckboxOption(
                  text: "复选A",
                  label: "val1",
                ),
                SkyCheckboxOption(
                  text: "复选B",
                  label: "val2",
                ),
                SkyCheckboxOption(
                  text: "复选C",
                  label: "val3",
                ),
                SkyCheckboxOption(
                  text: "禁用",
                  label: "val4",
                ),
                SkyCheckboxOption(
                  text: "选中且禁用",
                  label: "val5",
                  disabled: true,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
