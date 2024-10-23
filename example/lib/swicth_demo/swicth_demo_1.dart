import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class SwicthDemo1 extends StatefulWidget {
  const SwicthDemo1({super.key});

  @override
  State<SwicthDemo1> createState() => _SwicthDemo1State();
}

class _SwicthDemo1State extends State<SwicthDemo1> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          children: [
            SkyCol(
              span: 6,
              child: SkySwitch(
                model: true,
                activeColor: Color(0xff13ce66),
                inactiveColor: Color(0xffff4949),
              ),
            )
          ],
        ),
      ],
    );
  }
}
