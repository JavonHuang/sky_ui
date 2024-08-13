import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class SelectTest extends StatefulWidget {
  const SelectTest({super.key});

  @override
  State<SelectTest> createState() => _SelectTestState();
}

class _SelectTestState extends State<SelectTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkySelect(
          clearable: true,
          filterable: true,
          options: [
            SkySelectOption(label: "选项1", value: "1"),
            SkySelectOption(label: "选项2", value: "2"),
            SkySelectOption(label: "选项3", value: "3", disabled: true),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SkySelect(
          clearable: true,
          filterable: true,
          multiple: true,
          collapseTags:true ,
          options: [
            SkySelectOption(label: "选项1", value: "1"),
            SkySelectOption(label: "选项2", value: "2"),
            SkySelectOption(label: "选项3", value: "3", disabled: true),
          ],
        )
      ],
    );
  }
}
