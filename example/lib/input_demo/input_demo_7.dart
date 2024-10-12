import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class InputDemo7 extends StatefulWidget {
  const InputDemo7({super.key});

  @override
  State<InputDemo7> createState() => _InputDemo7State();
}

class _InputDemo7State extends State<InputDemo7> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyCol(
              span: 24,
              child: SkyInput(
                minLines: 3,
                model: "JavonHuang",
                maxLength: 500,
                placeholder: "请输入内容",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
