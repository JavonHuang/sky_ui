import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class BadgeDemo1 extends StatefulWidget {
  const BadgeDemo1({super.key});

  @override
  State<BadgeDemo1> createState() => _BadgeDemo1State();
}

class _BadgeDemo1State extends State<BadgeDemo1> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyRow(
          gutter: 20,
          children: [
            SkyBadge(
              text: "12",
              type: SkyBadgeType.danger,
              child: SkyButton(
                text: "评论",
                plain: true,
              ),
            ),
            SkyBadge(
              text: "3",
              type: SkyBadgeType.danger,
              child: SkyButton(
                text: "回复",
              ),
            ),
            SkyBadge(
              text: "3",
              type: SkyBadgeType.primary,
              child: SkyButton(
                text: "评论",
              ),
            ),
            SkyBadge(
              text: "3",
              type: SkyBadgeType.warning,
              child: SkyButton(
                text: "回复",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
