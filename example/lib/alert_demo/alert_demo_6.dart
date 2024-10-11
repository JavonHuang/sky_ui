import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class AlertDemo6 extends StatefulWidget {
  const AlertDemo6({super.key});

  @override
  State<AlertDemo6> createState() => _AlertDemo6State();
}

class _AlertDemo6State extends State<AlertDemo6> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          children: [
            SkyCol(
              span: 24,
              child: SkyAlert(
                title: "带辅助性文字介绍",
                description: "这是一句绕口令：黑灰化肥会挥发发灰黑化肥挥发；灰黑化肥会挥发发黑灰化肥发挥。 黑灰化肥会挥发发灰黑化肥黑灰挥发化为灰……",
                type: SkyAlertType.success,
                closable: true,
              ),
            )
          ],
        ),
      ],
    );
  }
}
