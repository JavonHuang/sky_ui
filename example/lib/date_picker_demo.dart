import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'date_picker_demo/date_picker_demo_1.dart';

class DatePickerDemo extends StatefulWidget {
  const DatePickerDemo({super.key});

  @override
  State<DatePickerDemo> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "DatePicker 日期选择器",
          descr: "用于选择日期",
        ),
        DemoTitle(
          title: "选择日",
          descr: "以「日」为基本单位，基础的日期选择控件",
        ),
        DisplayBlock(
          path: "date_picker_demo_1",
          child: DatePickerDemo1(),
        ),
      ],
    );
  }
}
