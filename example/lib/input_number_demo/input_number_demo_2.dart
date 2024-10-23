import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class InputNumberDemo2 extends StatefulWidget {
  const InputNumberDemo2({super.key});

  @override
  State<InputNumberDemo2> createState() => _InputNumberDemo2State();
}

class _InputNumberDemo2State extends State<InputNumberDemo2> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          children: [
            SkyCol(
              span: 6,
              child: SkyInputNumber(
                placeholder: "请输入数字",
                model: 1,
                disabled: true,
              ),
            )
          ],
        ),
      ],
    );
  }
}
