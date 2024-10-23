import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class InputNumberDemo5 extends StatefulWidget {
  const InputNumberDemo5({super.key});

  @override
  State<InputNumberDemo5> createState() => _InputNumberDemo5State();
}

class _InputNumberDemo5State extends State<InputNumberDemo5> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyCol(
              span: 6,
              child: SkyInputNumber(
                placeholder: "请输入数字",
                model: 1,
                size: SkySize.large,
              ),
            ),
            SkyCol(
              span: 6,
              child: SkyInputNumber(
                placeholder: "请输入数字",
                model: 1,
                size: SkySize.medium,
              ),
            ),
            SkyCol(
              span: 6,
              child: SkyInputNumber(
                placeholder: "请输入数字",
                model: 1,
                size: SkySize.small,
              ),
            ),
            SkyCol(
              span: 6,
              child: SkyInputNumber(
                placeholder: "请输入数字",
                model: 1,
                size: SkySize.mini,
              ),
            )
          ],
        ),
      ],
    );
  }
}
