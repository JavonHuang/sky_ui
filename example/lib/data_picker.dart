import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class DataPickerTest extends StatefulWidget {
  const DataPickerTest({super.key});

  @override
  State<DataPickerTest> createState() => _DataPickerTestState();
}

class _DataPickerTestState extends State<DataPickerTest> {
  late int model = DateTime.now().millisecondsSinceEpoch;
  late String weekStr = "2024-40";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkyDatePicker(
          clearable: true,
          model: model,
          format: "yyyy年MM月dd日",
          pickerOptions: SkyPickerOptions(
            disabledDate: (e) {
              return e.isAfter(DateTime.now());
            },
            shortcuts: [
              Shortcut(
                text: "今天",
                onTap: (today, setValue) {
                  setValue(today);
                },
              ),
              Shortcut(
                text: "昨天",
                onTap: (today, setValue) {
                  setValue(today.subtract(const Duration(days: 1)));
                },
              ),
              Shortcut(
                text: "一周前",
                onTap: (today, setValue) {
                  setValue(today.subtract(const Duration(days: 7)));
                },
              ),
              Shortcut(
                text: "一周后",
                onTap: (today, setValue) {
                  setValue(today.add(const Duration(days: 7)));
                },
              )
            ],
          ),
        ),
        SizedBox(
          height: SkySpacings().mainSpacing,
        ),
        SkyDatePicker(
          type: SkyDatePickerType.month,
        ),
        SizedBox(
          height: SkySpacings().mainSpacing,
        ),
        SkyDatePicker(
          type: SkyDatePickerType.month,
        ),
        SizedBox(
          height: SkySpacings().mainSpacing,
        ),
        SkyDatePicker(
          format: "yyyy第ww周",
          type: SkyDatePickerType.week,
          model: weekStr,
        ),
        SizedBox(
          height: SkySpacings().mainSpacing,
        ),
        SkyDatePicker(
          clearable: true,
          format: "yyyy年MM月",
          type: SkyDatePickerType.months,
          model: [model],
        ),
        SizedBox(
          height: SkySpacings().mainSpacing,
        ),
        SkyDatePicker(
          clearable: true,
          format: "yyyy年MM月dd日",
          type: SkyDatePickerType.dates,
          model: [model],
        ),
        SizedBox(
          height: SkySpacings().mainSpacing,
        ),
        SkyDatePicker(
          clearable: true,
          format: "yyyy年",
          type: SkyDatePickerType.years,
          model: [model],
        ),
        SizedBox(
          height: SkySpacings().mainSpacing,
        ),
        SkyButton(
          text: "变化",
          onTap: () {
            setState(() {
              weekStr = "2024-35";
              model = DateTime.now().subtract(const Duration(days: 2)).millisecondsSinceEpoch;
            });
          },
        ),
        SizedBox(
          height: SkySpacings().mainSpacing,
        ),
        SkyDatePicker(
          clearable: true,
          type: SkyDatePickerType.daterange,
        ),
      ],
    );
  }
}
