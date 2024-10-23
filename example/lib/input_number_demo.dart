import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'input_number_demo/input_number_demo_1.dart';
import 'input_number_demo/input_number_demo_2.dart';
import 'input_number_demo/input_number_demo_3.dart';
import 'input_number_demo/input_number_demo_4.dart';
import 'input_number_demo/input_number_demo_5.dart';
import 'input_number_demo/input_number_demo_6.dart';

class InputNumberDemo extends StatefulWidget {
  const InputNumberDemo({super.key});

  @override
  State<InputNumberDemo> createState() => _InputNumberDemoState();
}

class _InputNumberDemoState extends State<InputNumberDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "InputNumber 计数器",
          descr: "仅允许输入标准的数字值，可定义范围",
        ),
        DemoTitle(
          title: "基础用法",
          descr: "",
        ),
        DisplayBlock(
          description: "要使用它，只需要在SkyInputNumber中使用model绑定变量即可，变量的初始值即为默认值。",
          child: InputNumberDemo1(),
        ),
        DemoTitle(
          title: "禁用状态",
          descr: "",
        ),
        DisplayBlock(
          child: InputNumberDemo2(),
        ),
        DemoTitle(
          title: "步数",
          descr: "允许定义递增递减的步数控制",
        ),
        DisplayBlock(
          description: "设置step属性可以控制步长，接受一个Number。",
          child: InputNumberDemo3(),
        ),
        DemoTitle(
          title: "精度",
          descr: "",
        ),
        DisplayBlock(
          description: "precision 的值必须是一个非负整数，并且不能小于 step 的小数位数。",
          child: InputNumberDemo4(),
        ),
        DemoTitle(
          title: "尺寸",
          descr: "提供了large medium、small、mini 四种尺寸的数字输入框",
        ),
        DisplayBlock(
          description: "precision 的值必须是一个非负整数，并且不能小于 step 的小数位数。",
          child: InputNumberDemo5(),
        ),
        DemoTitle(
          title: "按钮位置",
          descr: "",
        ),
        DisplayBlock(
          description: "precision 的值必须是一个非负整数，并且不能小于 step 的小数位数。",
          child: InputNumberDemo6(),
        ),
      ],
    );
  }
}
