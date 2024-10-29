import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class EmptyDemo2 extends StatefulWidget {
  const EmptyDemo2({super.key});

  @override
  State<EmptyDemo2> createState() => _EmptyDemo2State();
}

class _EmptyDemo2State extends State<EmptyDemo2> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ParentSizeProvider(
          size: Size(200, 200),
          child: SkyEmpty(
            description: "描述文字",
          ),
        )
      ],
    );
  }
}
