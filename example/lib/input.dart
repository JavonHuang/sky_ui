import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class InputTest extends StatefulWidget {
  const InputTest({super.key});

  @override
  State<InputTest> createState() => _InputTestState();
}

class _InputTestState extends State<InputTest> {
  late GlobalKey<SkyFormState> myForm = GlobalKey();
  late double labelwidth = 100;
  late String nameparam = "javonnameparam";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("Input 输入框"),
        SkyFormField(
          prop: "name",
          label: '姓名',
          initialValue: "Javon",
          child: SkyInput(
            disabled: true,
            clearable: true,
            model: nameparam,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SkyButton(
          text: "更新单个值",
          onTap: () async {
            setState(() {
              nameparam = "更新了";
            });
          },
        ),
        Row(
          children: [
            Expanded(
              child: SkyForm(
                labelWidth: 100,
                key: myForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const SkyFormField(
                      prop: "name1",
                      label: '测试',
                      initialValue: "Javon",
                      child: SkyInput(
                        readOnly: true,
                        clearable: true,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SkyFormField(
                      prop: "name2",
                      label: '测试2',
                      initialValue: "Javon",
                      rules: Rules(
                        validator: (e) {
                          return Future.value(ValidatorResult(result: e.toString().length < 3, message: "请输入小于4个字符"));
                        },
                      ),
                      child: const SkyInput(
                        readOnly: true,
                        clearable: true,
                        leftIcon: ElementIcons.search,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SkyFormField(
                      prop: "age",
                      label: '年龄',
                      required: true,
                      initialValue: "100",
                      rules: Rules(
                        validator: (e) {
                          return Future.value(ValidatorResult(result: e.toString().length < 3, message: "请输入小于3个字符"));
                        },
                      ),
                      child: const SkyInput(
                        rightIcon: ElementIcons.search,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SkyFormField(
                      prop: "name4",
                      label: '计数器',
                      required: true,
                      child: SkyInputNumber(
                        readOnly: false,
                        clearable: true,
                        placeholder: "请输入计数器",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SkyButton(
                      text: "表单提交",
                      onTap: () async {
                        myForm.currentState!.validate().then((e) {
                          print(e);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SkyButton(
                      text: "年龄提交",
                      onTap: () async {
                        myForm.currentState!.validateField('age');
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SkyButton(
                      text: "清空检验",
                      onTap: () async {
                        myForm.currentState!.clearValidate();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SkyButton(
                      text: "重置初始化",
                      onTap: () async {
                        myForm.currentState!.resetFields();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SkyButton(
                      text: "指定更新",
                      onTap: () async {
                        myForm.currentState!.setValidate({'age': '99'});
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: SkySpacings().mainSpacing),
      ],
    );
  }
}
