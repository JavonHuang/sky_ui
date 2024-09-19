import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'common/display_block.dart';
import 'common/title.dart';

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
          children: [
            SkyRow(
              children: [
                SkyCol(
                  span: 6,
                  child: SkyTimePicker(
                    model: DateTime.now().millisecondsSinceEpoch,
                    editable: false,
                    clearable: true,
                    pickerOptions: SkyTimeSelectPickerOptions(
                      start: "09:10:30",
                      step: "00:10:20",
                      end: "10:01:50",
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "任意时间点",
          descr: "可以选择任意时间",
        ),
        DisplayBlock(
          description: "通过minTime,maxTime,限制可选时间范围。",
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
                      step: "00:10:20",
                    ),
                  ),
                ),
                SkyCol(
                  span: 6,
                  child: SkyTimePicker(
                    arrowControl: true,
                    clearable: true,
                    model: DateTime.now().millisecondsSinceEpoch,
                    pickerOptions: SkyTimeSelectPickerOptions(
                      step: "00:10:20",
                      minTime: "08:10:30",
                      maxTime: "10:20:54",
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        const DemoTitle(
          title: "固定时间范围",
          descr: "若先选择开始时间，则结束时间内备选项的状态会随之改变",
        ),
        DisplayBlock(
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
        ),
        const DemoTitle(
          title: "任意时间范围",
          descr: "可选择任意的时间范围",
        ),
        DisplayBlock(
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
        ),
      ],
    );
  }
}
