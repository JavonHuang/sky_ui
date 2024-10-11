import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class ButtonDemo7 extends StatefulWidget {
  const ButtonDemo7({super.key});

  @override
  State<ButtonDemo7> createState() => _ButtonDemo7State();
}

class _ButtonDemo7State extends State<ButtonDemo7> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SkyRow(
        gutter: 10,
        children: [
          const SkyButton(
            text: '大型按钮',
            size: SkySize.large,
          ),
          SkyButton(
            text: '中等按钮',
            onTap: () {},
            size: SkySize.medium,
          ),
          const SkyButton(
            text: '小型按钮',
            size: SkySize.small,
          ),
          const SkyButton(
            text: '超小按钮',
            size: SkySize.mini,
          ),
        ],
      ),
      DemoSpace.vGap20,
      SkyRow(
        gutter: 10,
        children: [
          const SkyButton(
            text: '大型按钮',
            size: SkySize.large,
            round: true,
          ),
          SkyButton(
            text: '中等按钮',
            onTap: () {},
            size: SkySize.medium,
            round: true,
          ),
          const SkyButton(
            text: '小型按钮',
            size: SkySize.small,
            round: true,
          ),
          const SkyButton(
            text: '超小按钮',
            size: SkySize.mini,
            round: true,
          ),
        ],
      ),
    ]);
  }
}
