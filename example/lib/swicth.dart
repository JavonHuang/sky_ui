import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class SwicthTest extends StatefulWidget {
  const SwicthTest({super.key});

  @override
  State<SwicthTest> createState() => _SwicthTestState();
}

class _SwicthTestState extends State<SwicthTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("基础用法"),
        Row(
          children: [
            SkySwitch(
              activeText: "开启",
              inactiveText: "关闭",
            ),
            SkySwitch(
              disabled: true,
              activeText: "开启",
              inactiveText: "关闭",
            ),
            SkySwitch(
              activeText: "开启",
              inactiveText: "关闭",
              activeColor: SkyColors().success,
              inactiveColor: SkyColors().danger,
              size: SkySize.large,
            ),
          ],
        ),
      ],
    );
  }
}
