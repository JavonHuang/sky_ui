import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class LoadingDemo3 extends StatefulWidget {
  const LoadingDemo3({super.key});

  @override
  State<LoadingDemo3> createState() => _LoadingDemo3State();
}

class _LoadingDemo3State extends State<LoadingDemo3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyButton(
              text: "全局2秒",
              type: SkyType.primary,
              onTap: () {
                SkyLoading.service();
                Future.delayed(const Duration(seconds: 2)).then((e) {
                  SkyLoading.close();
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
