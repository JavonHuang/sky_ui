import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class PaginationDemo3 extends StatefulWidget {
  const PaginationDemo3({super.key});

  @override
  State<PaginationDemo3> createState() => _PaginationDemo3State();
}

class _PaginationDemo3State extends State<PaginationDemo3> {
  List<Map<dynamic, dynamic>> dataList = List.generate(20, (index) => {"date": "2024-10-${1 + index}", "name": "王小虎$index", "address": "上海市普陀区金沙江路 $index 弄"});
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SkyPagination(
          pageSize: 20,
          pagerCount: 11,
          total: 1000,
          background: true,
        ),
      ],
    );
  }
}
