import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TimePickTest extends StatefulWidget {
  const TimePickTest({super.key});

  @override
  State<TimePickTest> createState() => _TimePickTestState();
}

class _TimePickTestState extends State<TimePickTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkyTimePicker(
          model: DateTime.now().microsecondsSinceEpoch,
          pickerOptions: SkyPickerPptions(
            start: "09:10:30",
            step: "00:10:20",
            end: "12:01:50",
            maxTime: "10:20:54",
          ),
        ),
        SkyTimePicker(
          arrowControl: true,
          clearable: true,
          model: DateTime.now().microsecondsSinceEpoch,
          pickerOptions: SkyPickerPptions(
            start: "09:10:30",
            step: "00:10:20",
            end: "12:01:50",
            minTime: "08:10:30",
            maxTime: "10:20:54",
          ),
        ),
      ],
    );
  }
}
