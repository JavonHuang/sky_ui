import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class InputDemo3 extends StatefulWidget {
  const InputDemo3({super.key});

  @override
  State<InputDemo3> createState() => _InputDemo3State();
}

class _InputDemo3State extends State<InputDemo3> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          children: [
            SkyCol(
              span: 6,
              child: SkyInput(
                clearable: true,
                placeholder: "请输入内容",
              ),
            )
          ],
        ),
      ],
    );
  }
}
