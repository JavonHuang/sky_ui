import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class DataPickerTest extends StatefulWidget {
  const DataPickerTest({super.key});

  @override
  State<DataPickerTest> createState() => _DataPickerTestState();
}

class _DataPickerTestState extends State<DataPickerTest> {
  late int model = DateTime.now().millisecondsSinceEpoch;
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
        SkyDatePicker(
          type: SkyDatePickerType.year,
        ),
        SkyButton(
          text: "变化",
          onTap: () {
            setState(() {
              model = DateTime.now().subtract(const Duration(days: 2)).millisecondsSinceEpoch;
            });
          },
        )
      ],
    );
  }
}
