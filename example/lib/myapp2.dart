import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'alert_demo.dart';
import 'badge_demo.dart';
import 'button_demo.dart';
import 'checkbox_demo.dart';
import 'collapse_demo.dart';
import 'date_picker_demo.dart';
import 'descriptions_demo.dart';
import 'dialog_demo.dart';
import 'icon_demo.dart';
import 'infinite_scroll_demo.dart';
import 'input_demo.dart';
import 'input_number_demo.dart';
import 'layout_demo.dart';
import 'link_demo.dart';
import 'loading_demo.dart';
import 'menu_demo.dart';
import 'message_box_demo.dart';
import 'message_demo.dart';
import 'radio_demo.dart';
import 'swicth_demo.dart';
import 'tabs_demo.dart';
import 'tag_demo.dart';
import 'tes.dart';
import 'time_picker_demo.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<NavigatorState> globalNavigatorState = GlobalKey<NavigatorState>();
    return MaterialApp(
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
    {"widget": const TagDemo(), "name": "Tag 标签", "type": 1},
    {"widget": const BadgeDemo(), "name": "Badge 标记", "type": 1},
    {"widget": const DescriptionsDemo(), "name": "Descriptions 描述列表", "type": 1},
    {"widget": null, "name": "Notice", "type": 0},
    {"widget": const AlertDemo(), "name": "Alert 警告", "type": 1},
    {"widget": const LoadingDemo(), "name": "Loading 加载", "type": 1},
    {"widget": const MessageDemo(), "name": "Message 消息提示", "type": 1},
    {"widget": const MessageBoxDemo(), "name": "MessageBox 弹框", "type": 1},
    {"widget": null, "name": "Navigation", "type": 0},
    {"widget": const TabsDemo(), "name": "Tabs 标签页", "type": 1},
    {"widget": const MenuDemo(), "name": "NavMenu 导航菜单", "type": 1},
    {"widget": null, "name": "Others", "type": 0},
    {"widget": const DialogDemo(), "name": "Dialog 对话框", "type": 1},
    {"widget": const CollapseDemo(), "name": "Collapse 折叠面板", "type": 1},
    {"widget": const InfiniteScrollDemo(), "name": "InfiniteScroll 无限滚动", "type": 1},
    {"widget": const TestDemo(), "name": "测试页面", "type": 1},
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
      // appBar: AppBar(
      //   title: const Row(
      //     children: [
      //       Expanded(
      //         child: Text("sky-ui"),
      //       ),
      //     ],
      //   ),
      // ),
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
