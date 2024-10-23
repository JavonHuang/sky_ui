import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class CheckboxDemo6 extends StatefulWidget {
  const CheckboxDemo6({super.key});

  @override
  State<CheckboxDemo6> createState() => _CheckboxDemo6State();
}

class _CheckboxDemo6State extends State<CheckboxDemo6> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          children: [
            SkyCheckboxGroup(
              model: const ["val1"],
              buttonStyle: true,
              size: SkySize.large,
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
        DemoSpace.vGap20,
        SkyRow(
          children: [
            SkyCheckboxGroup(
              model: const ["val1"],
              buttonStyle: true,
              size: SkySize.medium,
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
        DemoSpace.vGap20,
        SkyRow(
          children: [
            SkyCheckboxGroup(
              model: const ["val1"],
              buttonStyle: true,
              size: SkySize.small,
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
        DemoSpace.vGap20,
        SkyRow(
          children: [
            SkyCheckboxGroup(
              model: const ["val1"],
              buttonStyle: true,
              size: SkySize.mini,
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
