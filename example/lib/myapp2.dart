import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'button_demo.dart';
import 'checkbox_demo.dart';
import 'icon_demo.dart';
import 'layout_demo.dart';
import 'link_demo.dart';
import 'radio_demo.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      // routes: routes,
      home: const MyMain(),
    );
  }
}

class MyMain extends StatefulWidget {
  const MyMain({super.key});

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  late Map<String, dynamic> showMenu = {"widget": const ButtonDemo(), "name": "Button 按钮"};
  late List<Map<String, dynamic>> menuList = [
    {"widget": const LayoutDemo(), "name": "Layout 布局"},
    {"widget": const IconDemo(), "name": "Icon 图标"},
    {"widget": const ButtonDemo(), "name": "Button 按钮"},
    {"widget": const LinkDemo(), "name": "Link 文字链接"},
    {"widget": const RadioDemo(), "name": "Radio 单选框"},
    {"widget": const CheckboxDemo(), "name": "Checkbox 多选框"}
  ];

  Widget renderMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: menuList.map((item) {
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
            SizedBox(
              width: 200,
              child: renderMenu(),
            ),
            Expanded(child: renderContain())
          ],
        ),
      ),
    );
  }
}
