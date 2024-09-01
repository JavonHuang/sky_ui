import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class InputTest extends StatefulWidget {
  const InputTest({super.key});

  @override
  State<InputTest> createState() => _InputTestState();
}

class _InputTestState extends State<InputTest> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  late GlobalKey<SkyFormState> myForm = GlobalKey();
  late double labelwidth = 100;
  late String nameparam = "javonnameparam";
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: SkySpacings().mainSpacing),
        const Text("Input 输入框"),
        SkyFormField(
          prop: "name",
          label: '姓名',
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
                inline: true,
                formFiledWidth: 400,
                spaceHeight: 10,
                spaceWidth: 5,
                labelWidth: 80,
                model: {"name1": "JavonHuang", "tuhao": "测试3"},
                key: myForm,
                rules: {
                  "name1": Rules(
                    validator: (e) {
                      return Future.value(ValidatorResult(result: e.toString().length < 3, message: "请输入小于3个字符"));
                    },
                  ),
                  "name2": Rules(
                    validator: (e) {
                      return Future.value(ValidatorResult(result: e.toString().length < 3, message: "请输入小于2个字符"));
                    },
                  ),
                  "tuhao": Rules(
                    validator: (e) {
                      return Future.value(ValidatorResult(result: e == "测试2", message: "必须选择测试2"));
                    },
                  ),
                },
                children: [
                  const SkyFormField(
                    label: "土豪登记",
                    prop: 'tuhao',
                    required: true,
                    child: SkyGroupRadio(
                      disabled: false,
                      buttonStyle: true,
                      children: [
                        SkyRadio(
                          disabled: false,
                          text: "测试1",
                          label: "测试1",
                        ),
                        SkyRadio(
                          disabled: false,
                          text: "测试2",
                          label: "测试2",
                        ),
                        SkyRadio(
                          disabled: false,
                          text: "测试3",
                          label: "测试3",
                        ),
                        SkyRadio(
                          disabled: false,
                          text: "测试4",
                          label: "测试4",
                        ),
                      ],
                    ),
                  ),
                  const SkyFormField(
                    label: "是否已婚",
                    prop: 'sex',
                    required: true,
                    child: SkyRadio(
                      disabled: false,
                      text: "2",
                      label: "2",
                    ),
                  ),
                  const SkyFormField(
                    prop: "name1",
                    label: '测试',
                    child: SkyInput(
                      readOnly: true,
                      clearable: true,
                    ),
                  ),
                  SkyFormField(
                    prop: "name2",
                    label: '测试2',
                    rule: Rules(
                      validator: (e) {
                        return Future.value(ValidatorResult(result: e.toString().length < 3, message: "请输入小于4个字符"));
                      },
                    ),
                    child: const SkyInput(
                      // readOnly: true,
                      clearable: true,
                      leftIcon: ElementIcons.search,
                    ),
                  ),
                  SkyFormField(
                    prop: "age",
                    label: '年龄',
                    required: true,
                    rule: Rules(
                      validator: (e) {
                        return Future.value(ValidatorResult(result: e.toString().length < 3, message: "请输入小于3个字符"));
                      },
                    ),
                    child: const SkyInput(
                      rightIcon: ElementIcons.search,
                    ),
                  ),
                  const SkyFormField(
                    prop: "name4",
                    label: '计数器',
                    required: true,
                    child: SkyInputNumber(
                      min: -2,
                      readOnly: false,
                      step: 0.01,
                      precision: 2,
                      placeholder: "请输入计数器",
                    ),
                  ),
                  const SkyFormField(
                    prop: "name5",
                    label: '计数器',
                    required: true,
                    child: SkyInputNumber(
                      readOnly: false,
                      rightPosition: true,
                      placeholder: "请输入计数器",
                    ),
                  ),
                  SkyButton(
                    text: "表单提交",
                    onTap: () async {
                      myForm.currentState!.validate().then((e) {
                        print(e);
                      });
                    },
                  ),
                  SkyButton(
                    text: "年龄提交",
                    onTap: () async {
                      myForm.currentState!.validateField('age');
                    },
                  ),
                  SkyButton(
                    text: "清空检验",
                    onTap: () async {
                      myForm.currentState!.clearValidate();
                    },
                  ),
                  SkyButton(
                    text: "重置初始化",
                    onTap: () async {
                      myForm.currentState!.resetFields();
                    },
                  ),
                  SkyButton(
                    text: "指定更新",
                    onTap: () async {
                      myForm.currentState!.setValidate({'age': '99'});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: SkySpacings().mainSpacing),
        TextField(),
        TextFormField(),
      ],
    );
  }
}
