import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TimePickerDemo3 extends StatefulWidget {
  const TimePickerDemo3({super.key});

  @override
  State<TimePickerDemo3> createState() => _TimePickerDemo3State();
}

class _TimePickerDemo3State extends State<TimePickerDemo3> {
  late int model = DateTime.now().millisecondsSinceEpoch;
  // ignore: avoid_init_to_null
  late String? startTime = null;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyCol(
              span: 6,
              child: SkyTimePicker(
                arrowControl: true,
                clearable: true,
                model: DateTime.now().millisecondsSinceEpoch,
                pickerOptions: SkyTimeSelectPickerOptions(
                  start: '08:30',
                  step: '00:15',
                  end: '18:30',
                ),
                onChanged: (e) {
                  setState(() {
                    startTime = e;
                  });
                },
              ),
            ),
            SkyCol(
              span: 6,
              child: SkyTimePicker(
                arrowControl: true,
                clearable: true,
                model: DateTime.now().millisecondsSinceEpoch,
                pickerOptions: SkyTimeSelectPickerOptions(
                  start: '08:30',
                  step: '00:15',
                  end: '18:30',
                  minTime: startTime,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
