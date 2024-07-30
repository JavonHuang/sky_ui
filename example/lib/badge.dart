import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sky_ui/sky_ui.dart';

class BadgeTest extends StatefulWidget {
  const BadgeTest({super.key});

  @override
  State<BadgeTest> createState() => _BadgeTestState();
}

class _BadgeTestState extends State<BadgeTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("Badge 标记"),
        Row(
          children: [
            const SkyBadge(
              text: '3',
              child: SkyButton(
                text: "评论",
              ),
            ),
            SizedBox(width: SkySpacings().mainSpacing),
            const SkyBadge(
              text: "30",
              type: SkyBadgeType.danger,
              child: SkyButton(
                text: "评论",
                type: SkyType.success,
                plain: true,
              ),
            ),
            SizedBox(width: SkySpacings().mainSpacing),
          ],
        ),
      ],
    );
  }
}
