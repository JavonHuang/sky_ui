import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class LayoutDemo2 extends StatefulWidget {
  const LayoutDemo2({super.key});

  @override
  State<LayoutDemo2> createState() => _LayoutDemo2State();
}

class _LayoutDemo2State extends State<LayoutDemo2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyCol(
              span: 6,
              height: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFd3dce6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SkyCol(
              span: 6,
              height: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFd3dce6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SkyCol(
              span: 6,
              height: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFd3dce6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SkyCol(
              span: 6,
              height: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFd3dce6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
