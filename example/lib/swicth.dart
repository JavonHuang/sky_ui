import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class SwicthTest extends StatefulWidget {
  const SwicthTest({super.key});

  @override
  State<SwicthTest> createState() => _SwicthTestState();
}

class _SwicthTestState extends State<SwicthTest> {
  late GlobalKey<SkyFormState> myForm = GlobalKey();
  late bool model = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("基础用法"),
        Row(
          children: [
            // SkySwitch(
            //   activeText: "开启",
            //   inactiveText: "关闭",
            // ),
            // SkySwitch(
            //   disabled: true,
            //   activeText: "开启",
            //   inactiveText: "关闭",
            // ),
            // SkySwitch(
            //   activeText: "开启",
            //   inactiveText: "关闭",
            //   activeColor: SkyColors().success,
            //   inactiveColor: SkyColors().danger,
            //   size: SkySize.large,
            // ),
          ],
        ),
        SkyForm(
          key: myForm,
          model: {
            "tuhao": false,
          },
          labelWidth: 100,
          children: [
            SkyFormField(
              label: "土豪登记",
              prop: 'tuhao',
              required: true,
              child: SkySwitch(
                activeText: "开启",
                inactiveText: "关闭",
                activeColor: SkyColors().success,
                inactiveColor: SkyColors().danger,
                size: SkySize.large,
                model: model,
              ),
            ),
          ],
        ),
        SkyButton(
          text: "改变",
          onTap: () {
            setState(() {
              model = true;
            });
          },
        ),
        SkyButton(
          text: "验证",
          onTap: () {
            myForm.currentState!.validate().then((e) {
              print(e);
            });
          },
        ),
      ],
    );
  }
}
