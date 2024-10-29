import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class EmptyDemo3 extends StatefulWidget {
  const EmptyDemo3({super.key});

  @override
  State<EmptyDemo3> createState() => _EmptyDemo3State();
}

class _EmptyDemo3State extends State<EmptyDemo3> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ParentSizeProvider(
          size: Size(200, 200),
          child: SkyEmpty(
            child: SkyButton(
              text: "按钮",
              type: SkyType.primary,
            ),
          ),
        )
      ],
    );
  }
}
