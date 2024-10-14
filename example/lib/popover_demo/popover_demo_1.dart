import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class PopoverDemo1 extends StatefulWidget {
  const PopoverDemo1({super.key});

  @override
  State<PopoverDemo1> createState() => _PopoverDemo1State();
}

class _PopoverDemo1State extends State<PopoverDemo1> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyPopover(
          child: SkyButton(
            text: "测试",
          ),
        ),
      ],
    );
  }
}
