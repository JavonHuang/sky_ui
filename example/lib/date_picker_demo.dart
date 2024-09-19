import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'common/display_block.dart';
import 'common/title.dart';

class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({super.key});

  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  late int model = DateTime.now().millisecondsSinceEpoch;
  late String weekStr = "2024-40";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "DatePicker 日期选择器",
          descr: "用于选择日期",
        ),
        const DemoTitle(
          title: "选择日",
          descr: "以「日」为基本单位，基础的日期选择控件",
        ),
        DisplayBlock(
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
        ),
      ],
    );
  }
}
