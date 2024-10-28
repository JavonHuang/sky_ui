import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class PaginationDemo1 extends StatefulWidget {
  const PaginationDemo1({super.key});

  @override
  State<PaginationDemo1> createState() => _PaginationDemo1State();
}

class _PaginationDemo1State extends State<PaginationDemo1> {
  List<Map<dynamic, dynamic>> dataList = List.generate(20, (index) => {"date": "2024-10-${1 + index}", "name": "王小虎$index", "address": "上海市普陀区金沙江路 $index 弄"});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SkyPagination(
          total: 102,
        ),
      ],
    );
  }
}
