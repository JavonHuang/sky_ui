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
          model: [DateTime.now().microsecondsSinceEpoch, DateTime.now().add(const Duration(minutes: 10)).microsecondsSinceEpoch],
          pickerOptions: SkyPickerPptions(
            // start: "09:10:30",
            // step: "00:10:20",
            // end: "10:01:50",
            maxTime: "23:20:54",
          ),
        ),
      ],
    );
  }
}
