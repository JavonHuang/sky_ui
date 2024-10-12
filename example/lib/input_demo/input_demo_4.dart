import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class InputDemo4 extends StatefulWidget {
  const InputDemo4({super.key});

  @override
  State<InputDemo4> createState() => _InputDemo4State();
}

class _InputDemo4State extends State<InputDemo4> {
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
                showPassword: true,
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
