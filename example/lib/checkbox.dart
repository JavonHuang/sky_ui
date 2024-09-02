import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class CheckBoxText extends StatefulWidget {
  const CheckBoxText({super.key});

  @override
  State<CheckBoxText> createState() => _CheckBoxTextState();
}

class _CheckBoxTextState extends State<CheckBoxText> {
  late List<String> ceh = <String>[];
  late GlobalKey<SkyFormState> myForm = GlobalKey();
  late bool sing = false;
  late bool showitem = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("基础用法"),
        Row(
          children: [
            SkyCheckbox(
              text: "备选项",
              label: "备选项",
              model: true,
            ),
            SizedBox(
              width: 10,
            ),
            SkyCheckbox(
              border: true,
              text: "备选项",
              label: "备选项",
              model: false,
            ),
            SizedBox(
              width: 10,
            ),
            SkyCheckbox(
              buttonStyle: true,
              text: "备选项",
              label: "备选项",
              model: true,
            ),
            SizedBox(
              width: 10,
            ),
            SkyCheckboxGroup(
              model: ceh,
              onChanged: (v) {
                ceh = v;
              },
              children: [
                SkyCheckboxOption(
                  text: "备选项1",
                  label: "val1",
                ),
                SkyCheckboxOption(
                  text: "备选项2",
                  label: "val2",
                ),
              ],
            )
          ],
        ),
        SkyButton(
          text: "测试",
          onTap: () {
            setState(() {
              ceh = ['val1'];
              sing = true;
            });
          },
        ),
        SkyForm(
          key: myForm,
          children: [
            SkyFormField(
              label: "土豪登记",
              prop: 'tuhao',
              required: true,
              child: SkyCheckboxGroup(
                model: ceh,
                onChanged: (v) {},
                children: [
                  SkyCheckboxOption(
                    text: "备选项1",
                    label: "val1",
                  ),
                  SkyCheckboxOption(
                    text: "备选项2",
                    label: "val2",
                  ),
                ],
              ),
            ),
            if (showitem)
              SkyFormField(
                label: "单个",
                prop: 'sibagle',
                required: true,
                rule: Rules(
                  validator: (e) {
                    return Future.value(ValidatorResult(result: e, message: "土豪登记"));
                  },
                ),
                child: SkyCheckbox(
                  text: "备选项",
                  label: "备选项",
                  model: sing,
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
            myForm.currentState!.setValidate({
              "sibagle": true,
              "tuhao": ["val1", "val2"]
            });
          },
        ),
        SkyButton(
          text: "清空",
          onTap: () {
            myForm.currentState!.resetFields();
          },
        ),
        SkyButton(
          text: showitem ? "隐藏" : "显示",
          onTap: () {
            setState(() {
              showitem = !showitem;
            });
          },
        ),
      ],
    );
  }
}
