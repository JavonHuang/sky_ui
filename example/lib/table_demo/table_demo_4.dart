import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class TableDemo4 extends StatefulWidget {
  const TableDemo4({super.key});

  @override
  State<TableDemo4> createState() => _TableDemo4State();
}

class _TableDemo4State extends State<TableDemo4> {
  List<Map<dynamic, dynamic>> dataList = List.generate(4, (index) => {"date": "2024-10-${1 + index}", "name": "王小虎$index", "address": "上海市普陀区金沙江路 $index 弄"});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 240,
          child: SkyTable(
            data: dataList,
            rowStyle: (rowDate, rowIndex) {
              if (rowIndex == 1) {
                return SkyRowStyle(backgroundColor: SkyColors().warning.withOpacity(0.1));
              }
              if (rowIndex == 3) {
                return SkyRowStyle(backgroundColor: SkyColors().success.withOpacity(0.1));
              }
              return null;
            },
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
                prop: "address",
                label: "地址",
                flex: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
