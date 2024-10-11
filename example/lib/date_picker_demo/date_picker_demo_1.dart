import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class DatePickerDemo1 extends StatefulWidget {
  const DatePickerDemo1({super.key});

  @override
  State<DatePickerDemo1> createState() => _DatePickerDemo1State();
}

class _DatePickerDemo1State extends State<DatePickerDemo1> {
  late int model = DateTime.now().millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          children: [
            SkyCol(
              span: 6,
              child: SkyDatePicker(
                clearable: true,
                model: model,
                pickerOptions: SkyPickerOptions(
                  disabledDate: (e) {
                    return e.isAfter(DateTime.now());
                  },
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
