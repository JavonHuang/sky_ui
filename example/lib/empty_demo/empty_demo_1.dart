import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class EmptyDemo1 extends StatefulWidget {
  const EmptyDemo1({super.key});

  @override
  State<EmptyDemo1> createState() => _EmptyDemo1State();
}

class _EmptyDemo1State extends State<EmptyDemo1> {
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
