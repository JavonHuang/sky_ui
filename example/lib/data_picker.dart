import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class DataPickerTest extends StatefulWidget {
  const DataPickerTest({super.key});

  @override
  State<DataPickerTest> createState() => _DataPickerTestState();
}

class _DataPickerTestState extends State<DataPickerTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkyDataPicker(
          clearable: true,
        ),
      ],
    );
  }
}
