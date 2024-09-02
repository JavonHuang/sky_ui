import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class RadioTest extends StatefulWidget {
  const RadioTest({super.key});

  @override
  State<RadioTest> createState() => _RadioTestState();
}

class _RadioTestState extends State<RadioTest> {
  late GlobalKey<SkyFormState> myForm = GlobalKey();
  late String model = "1";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("基础用法"),
        Row(
          children: [
            SkyRadio(
              text: "吃热食",
              label: "1",
              border: true,
              disabled: true,
            ),
            SkyRadio(
              text: "吃热食",
              label: "1",
            ),
            SkyRadio(
              disabled: true,
              text: "吃热食",
              label: "1",
            ),
            SkyRadio(
              disabled: false,
              buttonStyle: true,
              text: "吃热食",
              label: "2",
            ),
            SkyRadio(
              disabled: true,
              buttonStyle: true,
              text: "吃热食",
              label: "3",
            ),
            SkyGroupRadio(
              model: "1",
              options: [
                SkyRadioOption(
                  text: "吃热食",
                  label: "1",
                ),
                SkyRadioOption(
                  text: "吃热食",
                  label: "2",
                ),
              ],
            )
          ],
        ),
        SkyForm(
          key: myForm,
          labelWidth: 100,
          children: [
            SkyFormField(
              label: "土豪登记",
              prop: 'tuhao',
              required: true,
              child: SkyRadio(
                text: "吃热食",
                label: "1",
                border: true,
                disabled: false,
              ),
            ),
            SkyFormField(
              label: "已婚",
              prop: 'group',
              required: true,
              child: SkyGroupRadio(
                model: model,
                options: [
                  SkyRadioOption(
                    text: "是",
                    label: "1",
                  ),
                  SkyRadioOption(
                    text: "否",
                    label: "2",
                  ),
                ],
              ),
            ),
          ],
        ),
        SkyButton(
          text: "验证",
          onTap: () {
            myForm.currentState!.validate().then((e) {
              print(e);
            });
          },
        ),
        SkyButton(
          text: "改变",
          onTap: () {
            setState(() {
              model = "2";
            });
          },
        ),
        SkyButton(
          text: "设置未婚",
          onTap: () {
            myForm.currentState!.setValidate({"group": "2"});
          },
        ),
        SkyButton(
          text: "重置",
          onTap: () {
            myForm.currentState!.resetFields();
          },
        ),
      ],
    );
  }
}
