import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'alert_demo.dart';
import 'badge_demo.dart';
import 'button_demo.dart';
import 'checkbox_demo.dart';
import 'date_picker_demo.dart';
import 'icon_demo.dart';
import 'input_demo.dart';
import 'input_number_demo.dart';
import 'layout_demo.dart';
import 'link_demo.dart';
import 'loading_demo.dart';
import 'message_demo.dart';
import 'radio_demo.dart';
import 'swicth_demo.dart';
import 'time_picker_demo.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<NavigatorState> globalNavigatorState = GlobalKey<NavigatorState>();
    return MaterialApp(
      builder: FToastBuilder(),
      title: 'Flutter Demo',
      navigatorKey: globalNavigatorState,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      // routes: routes,
      home: MyMain(globalNavigatorState: globalNavigatorState),
    );
  }
}

class MyMain extends StatefulWidget {
  MyMain({super.key, globalNavigatorState}) {
    SkyInit().register(globalNavigatorState);
  }

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  late Map<String, dynamic> showMenu = {"widget": const ButtonDemo(), "name": "Button 按钮"};
  late List<Map<String, dynamic>> menuList = [
    {"widget": null, "name": "Basic", "type": 0},
    {"widget": const LayoutDemo(), "name": "Layout 布局", "type": 1},
    {"widget": const IconDemo(), "name": "Icon 图标", "type": 1},
    {"widget": const ButtonDemo(), "name": "Button 按钮", "type": 1},
    {"widget": const LinkDemo(), "name": "Link 文字链接", "type": 1},
    {"widget": null, "name": "Form", "type": 0},
    {"widget": const RadioDemo(), "name": "Radio 单选框", "type": 1},
    {"widget": const CheckboxDemo(), "name": "Checkbox 多选框", "type": 1},
    {"widget": const InputDemo(), "name": "Input 输入框", "type": 1},
    {"widget": const InputNumberDemo(), "name": "InputNumber 计数器", "type": 1},
    {"widget": const SwicthDemo(), "name": "Switch 开关", "type": 1},
    {"widget": const TimePickerDemo(), "name": "TimePicker 时间选择器", "type": 1},
    {"widget": const DatePickerDemo(), "name": "DatePicker 日期选择器", "type": 1},
    {"widget": null, "name": "Data", "type": 0},
    {"widget": const BadgeDemo(), "name": "Badge 标记", "type": 1},
    {"widget": null, "name": "Notice", "type": 0},
    {"widget": const AlertDemo(), "name": "Alert 警告", "type": 1},
    {"widget": const LoadingDemo(), "name": "Loading 加载", "type": 1},
    {"widget": const MessageDemo(), "name": "Message 消息提示", "type": 1},
    {"widget": null, "name": "Navigation", "type": 0},
    {"widget": null, "name": "Others", "type": 0},
  ];

  Widget renderMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: menuList.map((item) {
        if (item['type'] == 1) {
          return SkyButton(
            size: SkySize.medium,
            type: SkyType.text,
            text: item["name"],
            customTextColor: SkyColors().primaryText,
            customHoverColor: SkyColors().primary,
            onTap: () {
              setState(() {
                showMenu = item;
              });
            },
          );
        } else {
          return Text(
            item["name"],
            style: TextStyle(color: SkyColors().placeholderText, fontSize: SkyFontSizes().auxiliaryFont),
          );
        }
        ;
      }).toList(),
    );
  }

  Widget renderContain() {
    if (showMenu['widget'] != null) {
      return SingleChildScrollView(
        child: Container(
          child: showMenu["widget"]!,
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Expanded(
              child: Text("sky-ui"),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: SizedBox(
                width: 200,
                child: renderMenu(),
              ),
            ),
            Expanded(child: renderContain())
          ],
        ),
      ),
    );
  }
}
