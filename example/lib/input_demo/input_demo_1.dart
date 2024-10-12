import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class InputDemo1 extends StatefulWidget {
  const InputDemo1({super.key});

  @override
  State<InputDemo1> createState() => _InputDemo1State();
}

class _InputDemo1State extends State<InputDemo1> {
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
                placeholder: "请输入内容",
              ),
            )
          ],
        ),
      ],
    );
  }
}
