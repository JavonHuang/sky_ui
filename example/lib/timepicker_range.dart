import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TimePickRangeTest extends StatefulWidget {
  const TimePickRangeTest({super.key});

  @override
  State<TimePickRangeTest> createState() => _TimePickTestState();
}

class _TimePickTestState extends State<TimePickRangeTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkyTimePickerRange(
          clearable: true,
          model: [DateTime.now().millisecondsSinceEpoch, DateTime.now().add(const Duration(minutes: 10)).millisecondsSinceEpoch],
          pickerRangeOptions: SkyPickerRangeOptions(
            maxTime: "23:20:54",
          ),
        ),
      ],
    );
  }
}
