import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class SelectDemo2 extends StatefulWidget {
  const SelectDemo2({super.key});

  @override
  State<SelectDemo2> createState() => _SelectDemo2State();
}

class _SelectDemo2State extends State<SelectDemo2> {
  late List<SkySelectOption<String>> options = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      options = List.generate(100, (i) => SkySelectOption(label: "选项$i", value: "1$i")).toList();
    });
  }

  final List<String> data = ['语文', '数学', '英语', '物理', '化学', '生物', '地理'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkySelect(
          placeholder: "请选择",
          options: [
            SkySelectOption(label: "选项1", value: "1"),
            SkySelectOption(label: "选项2", value: "2"),
            SkySelectOption(label: "选项3", value: "3", disabled: true),
          ],
        ),
      ],
    );
  }
}
