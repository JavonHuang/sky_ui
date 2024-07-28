import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class InputTest extends StatefulWidget {
  const InputTest({super.key});

  @override
  State<InputTest> createState() => _InputTestState();
}

class _InputTestState extends State<InputTest> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("Input 输入框"),
        Row(
          children: [
            Expanded(
              child: SkyInput(),
            ),
            // Expanded(
            //   child: TextField(
            //     decoration: InputDecoration(
            //       contentPadding: EdgeInsets.all(10.0),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(0.0),
            //         borderSide: BorderSide(color: const Color.fromARGB(255, 128, 118, 118), width: 0.5, style: BorderStyle.solid),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(0.0),
            //         borderSide: BorderSide(color: Colors.red, width: 0.5, style: BorderStyle.solid),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        SizedBox(height: SkySpacings().mainSpacing),
      ],
    );
  }
}
