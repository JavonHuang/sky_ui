import 'package:example/button.dart';
import 'package:example/layout.dart';
import 'package:example/radio.dart';
import 'package:example/swicth.dart';
import 'package:example/tag.dart';
// import 'package:example/tes.dart';
import 'package:example/test2.dart';
import 'package:example/testpage.dart';
import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'badge.dart';
import 'buttonGroup.dart';
import 'checkbox.dart';
import 'data_picker.dart';
import 'grid_table.dart';
import 'input.dart';
import 'link.dart';
import 'select.dart';
import 'table.dart';
import 'timepicker.dart';
import 'timepicker_range.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Map<String, Widget>> menuList = [
      // {'FilePickerDemo': FilePickerDemo()},
      {
        'MyContextMenu': const MyContextMenu(
          message: "0909",
        ),
      },
      {'CheckBoxText': const CheckBoxText()},
      {'RadioTest': const RadioTest()},
      {'GroupButton': const GroupButton()},
      {'ButtonTest': const ButtonTest()},
      {'LinkText': const LinkText()},
      {'TagTest': const TagTest()},
      {'BadgeTest': const BadgeTest()},
      {'InputTest': const InputTest()},
      {'SwicthTest': const SwicthTest()},
      {'FlexLayoutTestRoute': const FlexLayoutTestRoute()},
      {'SelectTest': const SelectTest()},
      {'TimePickTest': const TimePickTest()},
      {'TimePickRangeTest': const TimePickRangeTest()},
      {'DataPickerTest': const DataPickerTest()},
    ];
    Map<String, Widget Function(BuildContext)> routes = {};
    for (Map<String, Widget> item in menuList) {
      // if (item.keys.first != 'InputTest') {
      routes[item.keys.first] = (context) => Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Expanded(
                    child: Text("New route"),
                  ),
                ],
              ),
            ),
            backgroundColor: SkyColors().white,
            body: SingleChildScrollView(
              child: item[item.keys.first],
            ),
          );
      // } else {
      //   routes[item.keys.first] = (context) => item[item.keys.first]!;
      // }
    }
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: routes,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Map<String, Widget> showMenu = {'InputTest': const InputTest()};
  late List<Map<String, Widget>> menuList = [];

  Widget _renderTab() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: showMenu[showMenu.keys.first]!,
      ),
    );
  }

  void _navigateToSecondPage(String key, Widget w) {
    if (key != 'InputTest') {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Scaffold(
                    appBar: AppBar(
                      title: Row(
                        children: [
                          Expanded(
                            child: Text("New route"),
                          ),
                        ],
                      ),
                    ),
                    backgroundColor: SkyColors().white,
                    body: SingleChildScrollView(
                      child: w,
                    ),
                  )));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => w));
    }
  }

  @override
  Widget build(BuildContext context) {
    menuList = [
      // {'FilePickerDemo': FilePickerDemo()},
      {
        'MyContextMenu': const MyContextMenu(
          message: "0909",
        ),
      },
      {'CheckBoxText': const CheckBoxText()},
      {'RadioTest': const RadioTest()},
      {'GroupButton': const GroupButton()},
      {'ButtonTest': const ButtonTest()},
      {'LinkText': const LinkText()},
      {'TagTest': const TagTest()},
      {'BadgeTest': const BadgeTest()},
      {'InputTest': const InputTest()},
      {'SwicthTest': const SwicthTest()},
      {'FlexLayoutTestRoute': const FlexLayoutTestRoute()},
      {'SelectTest': const SelectTest()},
      {'TimePickTest': const TimePickTest()},
      {'TimePickRangeTest': const TimePickRangeTest()},
      {'DataPickerTest': const DataPickerTest()},
    ];
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: SkyColors().defaultBg,
              width: 180,
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: menuList
                    .map(
                      (e) => InkWell(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          color: showMenu.keys.first == e.keys.first ? SkyColors().primary : SkyColors().defaultBg,
                          child: Text(e.keys.first),
                        ),
                        onTap: () {
                          // _navigateToSecondPage(e.keys.first, e[e.keys.first]!);
                          // setState(() {
                          //   showMenu = e;
                          // });
                          Navigator.pushNamed(context, e.keys.first);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(child: _renderTab())
          ],
        ),
      ),
    );
  }
}
