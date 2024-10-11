import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class AlertDemo5 extends StatefulWidget {
  const AlertDemo5({super.key});

  @override
  State<AlertDemo5> createState() => _AlertDemo5State();
}

class _AlertDemo5State extends State<AlertDemo5> {
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
                title: "成功提示的文案",
                type: SkyAlertType.success,
                showIcon: true,
                center: true,
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
                title: "消息提示的文案",
                type: SkyAlertType.info,
                showIcon: true,
                center: true,
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
                title: "警告提示的文案",
                type: SkyAlertType.warning,
                showIcon: true,
                center: true,
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
                title: "错误提示的文案",
                type: SkyAlertType.error,
                showIcon: true,
                center: true,
              ),
            )
          ],
        ),
      ],
    );
  }
}
