import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'common/display_block.dart';
import 'common/title.dart';
import 'time_picker_demo/time_picker_demo_1.dart';
import 'time_picker_demo/time_picker_demo_2.dart';
import 'time_picker_demo/time_picker_demo_3.dart';
import 'time_picker_demo/time_picker_demo_4.dart';

class TimePickerDemo extends StatefulWidget {
  const TimePickerDemo({super.key});

  @override
  State<TimePickerDemo> createState() => _TimePickerDemoState();
}

class _TimePickerDemoState extends State<TimePickerDemo> {
  late int model = DateTime.now().millisecondsSinceEpoch;
  late String? startTime = null;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DemoTitle(
          title: "TimePicker 时间选择器",
          descr: "用于选择时间",
        ),
        const DemoTitle(
          title: "提供几个固定的时间点供用户选择",
          descr: "",
        ),
        DisplayBlock(
          description: "分别通过start、end和step指定可选的起始时间、结束时间和步长",
          child: TimePickerDemo1(),
        ),
        const DemoTitle(
          title: "任意时间点",
          descr: "可以选择任意时间",
        ),
        DisplayBlock(
          description: "通过minTime,maxTime,限制可选时间范围。",
          child: TimePickerDemo2(),
        ),
        const DemoTitle(
          title: "固定时间范围",
          descr: "若先选择开始时间，则结束时间内备选项的状态会随之改变",
        ),
        DisplayBlock(
          child: TimePickerDemo3(),
        ),
        const DemoTitle(
          title: "任意时间范围",
          descr: "可选择任意的时间范围",
        ),
        DisplayBlock(
          child: TimePickerDemo4(),
        ),
      ],
    );
  }
}
