import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TableDemo3 extends StatefulWidget {
  const TableDemo3({super.key});

  @override
  State<TableDemo3> createState() => _TableDemo3State();
}

class _TableDemo3State extends State<TableDemo3> {
  List<Map<dynamic, dynamic>> dataList = List.generate(20, (index) => {"date": "2024-10-${1 + index}", "name": "王小虎$index", "address": "上海市普陀区金沙江路 $index 弄"});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 240,
          child: SkyTable(
            border: true,
            data: dataList,
            columns: [
              SkyTableColumn(
                prop: "date",
                width: 200,
                label: "日期",
              ),
              SkyTableColumn(
                prop: "name",
                label: "姓名",
                width: 80,
              ),
              SkyTableColumn(
                prop: "address", label: "地址", width: 200,
                // flex: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
