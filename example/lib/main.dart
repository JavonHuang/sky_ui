import 'package:example/button.dart';
import 'package:example/layout.dart';
import 'package:example/radio.dart';
import 'package:example/swicth.dart';
import 'package:example/tag.dart';
import 'package:example/tes.dart';
import 'package:example/test2.dart';
import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'badge.dart';
import 'buttonGroup.dart';
import 'checkbox.dart';
import 'grid_table.dart';
import 'input.dart';
import 'link.dart';
import 'select.dart';
import 'table.dart';
import 'timepicker.dart';
import 'timepicker_range.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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
  late Map<String, Widget> showMenu = {'CheckBoxText': const CheckBoxText()};
  late List<Map<String, Widget>> menuList = [
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
    {
      'MyContextMenu': const MyContextMenu(
        message: "0909",
      ),
    },
    {'TimePickTest': const TimePickTest()},
    {'TimePickRangeTest': const TimePickRangeTest()}
  ];

  Widget _renderTab() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40),
        child: showMenu[showMenu.keys.first]!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                          setState(() {
                            showMenu = e;
                          });
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
