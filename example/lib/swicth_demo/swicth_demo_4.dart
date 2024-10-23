import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class SwicthDemo4 extends StatefulWidget {
  const SwicthDemo4({super.key});

  @override
  State<SwicthDemo4> createState() => _SwicthDemo4State();
}

class _SwicthDemo4State extends State<SwicthDemo4> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          children: [
            SkyCol(
              span: 4,
              child: SkySwitch(
                model: true,
                disabled: true,
              ),
            ),
            SkyCol(
              span: 4,
              child: SkySwitch(
                model: false,
                disabled: true,
              ),
            )
          ],
        ),
      ],
    );
  }
}
