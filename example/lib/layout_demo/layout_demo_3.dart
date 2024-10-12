import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class LayoutDemo3 extends StatefulWidget {
  const LayoutDemo3({super.key});

  @override
  State<LayoutDemo3> createState() => _LayoutDemo3State();
}

class _LayoutDemo3State extends State<LayoutDemo3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyCol(
              span: 16,
              height: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFd3dce6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SkyCol(
              span: 8,
              height: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFd3dce6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
        DemoSpace.vGap20,
        SkyRow(
          gutter: 20,
          children: [
            SkyCol(
              span: 8,
              height: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFd3dce6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SkyCol(
              span: 8,
              height: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFd3dce6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SkyCol(
              span: 4,
              height: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFd3dce6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SkyCol(
              span: 4,
              height: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFd3dce6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
        DemoSpace.vGap20,
        SkyRow(
          gutter: 20,
          children: [
            SkyCol(
              span: 4,
              height: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFd3dce6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SkyCol(
              span: 16,
              height: 36,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFd3dce6),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            SkyCol(
              span: 4,
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
