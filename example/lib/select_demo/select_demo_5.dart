import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class SelectDemo5 extends StatefulWidget {
  const SelectDemo5({super.key});

  @override
  State<SelectDemo5> createState() => _SelectDemo5State();
}

class _SelectDemo5State extends State<SelectDemo5> {
  late List<SkySelectOption<String>> options = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      options = List.generate(30, (i) => SkySelectOption(label: "选项$i", value: "1$i")).toList();
    });
  }

  final List<String> data = ['语文', '数学', '英语', '物理', '化学', '生物', '地理'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyCol(
              span: 10,
              child: SkySelect(
                placeholder: "请选择",
                multiple: true,
                options: options,
              ),
            ),
            SkyCol(
              span: 10,
              child: SkySelect(
                placeholder: "请选择",
                multiple: true,
                collapseTags: true,
                options: options,
              ),
            ),
          ],
        )
      ],
    );
  }
}
