import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TableDemo1 extends StatefulWidget {
  const TableDemo1({super.key});

  @override
  State<TableDemo1> createState() => _TableDemo1State();
}

class _TableDemo1State extends State<TableDemo1> {
  List<Map<dynamic, dynamic>> dataList = List.generate(20, (index) => {"date": "2024-10-14", "name": "王小虎$index", "address": "上海市普陀区金沙江路 $index 弄"});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 400,
          child: SkyTable(
            border: true,
            data: dataList,
            columns: [
              SkyTableColumn(
                prop: "date",
                width: 200,
                label: "日期",
                fixed: SkyFixed.left,
              ),
              SkyTableColumn(
                prop: "date",
                width: 200,
                label: "日期",
              ),
              SkyTableColumn(
                prop: "name",
                label: "姓名",
                fixed: SkyFixed.right,
                width: 80,
              ),
              SkyTableColumn(
                prop: "address",
                label: "地址",
                width: 2000,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
