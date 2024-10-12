import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class TimePickerDemo4 extends StatefulWidget {
  const TimePickerDemo4({super.key});

  @override
  State<TimePickerDemo4> createState() => _TimePickerDemo4State();
}

class _TimePickerDemo4State extends State<TimePickerDemo4> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyCol(
              span: 12,
              child: SkyTimePickerRange(
                clearable: true,
                model: [DateTime.now().millisecondsSinceEpoch, DateTime.now().add(const Duration(minutes: 10)).millisecondsSinceEpoch],
                pickerRangeOptions: SkyPickerRangeOptions(
                  maxTime: "23:20:54",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
