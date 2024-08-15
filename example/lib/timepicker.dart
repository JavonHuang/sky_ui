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
        SkyTimePicker(),
      ],
    );
  }
}
