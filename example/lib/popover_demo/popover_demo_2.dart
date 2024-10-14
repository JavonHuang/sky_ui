import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/space.dart';

class PopoverDemo2 extends StatefulWidget {
  const PopoverDemo2({super.key});

  @override
  State<PopoverDemo2> createState() => _PopoverDemo2State();
}

class _PopoverDemo2State extends State<PopoverDemo2> {
  SkyPopoverController controller = SkyPopoverController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkyPopover(
          trigger: SkyPopoverTrigger.manual,
          controller: controller,
          child: SkyButton(
            text: "测试",
            onTap: () {
              controller.open();
            },
          ),
        ),
      ],
    );
  }
}
