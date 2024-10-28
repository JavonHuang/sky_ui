import 'package:flutter/material.dart';

class Test2 extends StatefulWidget {
  const Test2({super.key});

  @override
  State<Test2> createState() => _Test2State();
}

class _Test2State extends State<Test2> {
  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> dataList = List.generate(
        20000,
        (index) => {
              "date": "2024-10-${1 + index}",
              "name": "王小虎$index",
              "province": "上海",
              "city": "普陀区",
              "address": "上海市普陀区金沙江路 $index 弄",
              "zip": "20033$index",
            });
    return Container(
      height: 500,
      child: ListView.builder(
        shrinkWrap: true,
        primary: true,
        itemCount: dataList.length,
        itemExtent: 40,
        itemBuilder: (context, index) {
          return Text(dataList[index]['date']);
        },
      ),
    );
  }
}
