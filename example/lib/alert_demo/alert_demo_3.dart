import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import '../common/space.dart';

class AlertDemo3 extends StatefulWidget {
  const AlertDemo3({super.key});

  @override
  State<AlertDemo3> createState() => _AlertDemo3State();
}

class _AlertDemo3State extends State<AlertDemo3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SkyRow(
          children: [
            SkyCol(
              span: 24,
              child: SkyAlert(
                title: "不可关闭的 alert",
                type: SkyAlertType.success,
              ),
            )
          ],
        ),
        DemoSpace.vGap20,
        const SkyRow(
          children: [
            SkyCol(
              span: 24,
              child: SkyAlert(
                title: "自定义 close-text",
                type: SkyAlertType.info,
                closable: true,
                closeText: "知道了",
              ),
            )
          ],
        ),
        DemoSpace.vGap20,
        SkyRow(
          children: [
            SkyCol(
              span: 24,
              child: SkyAlert(
                title: "设置了回调的 alert",
                type: SkyAlertType.error,
                closable: true,
                close: () {
                  return Future.value(true);
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
