import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class GroupButton extends StatefulWidget {
  const GroupButton({super.key});

  @override
  State<GroupButton> createState() => _GroupButtonState();
}

class _GroupButtonState extends State<GroupButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("按钮组"),
        ButtonGroup(
          type: SkyButtonType.success,
          onTap: (e) {
            print(e);
          },
          children: const [
            SkyButton(
              text: '主要按钮',
              buttonKey: '1',
            ),
            SkyButton(
              text: '主要按钮2',
              buttonKey: '2',
            ),
          ],
        ),

        // Form(
        //   child: Column(
        //     children: [
        //       TextFormField(
        //         initialValue: '900',
        //         decoration: const InputDecoration(
        //           hintText: 'Enter your email',
        //         ),
        //         validator: (String? value) {
        //           if (value == null || value.isEmpty) {
        //             return 'Please enter some text';
        //           }
        //           return null;
        //         },
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
