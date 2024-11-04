import 'package:flutter/material.dart';
import 'common/display_block.dart';
import 'common/title.dart';
import 'input_demo/input_demo_1.dart';
import 'input_demo/input_demo_2.dart';
import 'input_demo/input_demo_3.dart';
import 'input_demo/input_demo_4.dart';
import 'input_demo/input_demo_5.dart';
import 'input_demo/input_demo_6.dart';
import 'input_demo/input_demo_7.dart';
import 'input_demo/input_demo_8.dart';
import 'input_demo/input_demo_9.dart';

class InputDemo extends StatefulWidget {
  const InputDemo({super.key});

  @override
  State<InputDemo> createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DemoTitle(
          title: "Input 输入框",
          descr: "通过鼠标或键盘输入字符",
        ),
        DemoTitle(
          title: "基础用法",
          descr: "",
        ),
        DisplayBlock(
          path: "input_demo_1",
          child: InputDemo1(),
        ),
        DemoTitle(
          title: "禁用状态",
          descr: "",
        ),
        DisplayBlock(
          description: "通过 disabled 属性指定是否禁用 input 组件",
          path: "input_demo_2",
          child: InputDemo2(),
        ),
        DemoTitle(
          title: "可清空",
          descr: "",
        ),
        DisplayBlock(
          path: "input_demo_3",
          child: InputDemo3(),
        ),
        DemoTitle(
          title: "密码框",
          descr: "",
        ),
        DisplayBlock(
          path: "input_demo_4",
          child: InputDemo4(),
        ),
        DemoTitle(
          title: "带 icon 的输入框",
          descr: "带有图标标记输入类型",
        ),
        DisplayBlock(
          description: "可以通过 rightIcon 和 leftIcon 属性在 input 组件首部和尾部增加显示图标",
          path: "input_demo_5",
          child: InputDemo5(),
        ),
        DemoTitle(
          title: "文本域",
          descr: "用于输入多行文本信息，通过将 type 属性的值指定为 textarea。",
        ),
        DisplayBlock(
          path: "input_demo_6",
          child: InputDemo6(),
        ),
        DemoTitle(
          title: "可自适应文本高度的文本域",
          descr: "通过设置 minLines，maxLines，属性可以使得文本域的高度能够根据文本内容自动进行调整，并且 autosize 还可以设定为一个对象，指定最小行数和最大行数。",
        ),
        DisplayBlock(
          path: "input_demo_7",
          child: InputDemo7(),
        ),
        DemoTitle(
          title: "尺寸",
          descr: "",
        ),
        DisplayBlock(
          path: "input_demo_8",
          child: InputDemo8(),
        ),
        DemoTitle(
          title: "输入长度限制",
          descr: "",
        ),
        DisplayBlock(
          path: "input_demo_9",
          child: InputDemo9(),
        ),
      ],
    );
  }
}
