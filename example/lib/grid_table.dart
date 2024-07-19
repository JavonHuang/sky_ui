import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class Person {
  final String name;
  final int age;
  final int height;
  final int weight;
  final String address;

  Person({
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.address,
  });
}

class GridTable extends StatefulWidget {
  const GridTable({super.key});

  @override
  State<GridTable> createState() => _GridTableState();
}

class _GridTableState extends State<GridTable> {
  List<Person> data = [];
  late bool loadFinish = false;
  late bool loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      data = List.generate(200, (index) => Person(name: 'Javon_$index', age: index, height: 168 + index, weight: 54 + index, address: '广州市天河区黄埔大道${39 + index}号'));
    });
  }

  void loadMore() async {
    if (loading) {
      return;
    }
    setState(() {
      loading = true;
    });
    await Future.delayed(const Duration(seconds: 2), () {
      loading = false;
      data = [
        ...data,
        ...List.generate(10, (index) => Person(name: 'Javon_${index + data.length}', age: index + data.length, height: 168 + index, weight: 54 + index, address: '广州市天河区黄埔大道${39 + index}号'))
      ];
      setState(() {
        loadFinish = data.length > 300;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SkyInfiniteGridTable<Person>(
      data: data,
      loadFinish: loadFinish,
      loading: loading,
      loadMore: loadMore,
      mergeHeaderColumn: [
        GridMergeHeaderColumn(headerTitle: HeaderTitle(text: '测试'), start: [1, 1], end: [1, 3])
      ],
      mergeFooterColumn: [
        GridMergeFooterColumn(footerTitle: HeaderTitle(text: 'javon'), start: [0, 1], end: [0, 3])
      ],
      footerRowNum: 1,
      headerRowNum: 2,
      columns: [
        SkyGridTableColumn<Person>(
          leftFixed: true,
          headerTitle: HeaderTitle(
              widgetTitle: Container(
            // height: 60,
            child: Text('姓名'),
          )),
          width: 200,
          itemBuilder: (row, index) {
            return Container(
              child: Text(row.name),
            );
          },
        ),
        SkyGridTableColumn<Person>(
          headerTitle: HeaderTitle(
              widgetTitle: Container(
            child: Text('年龄'),
          )),
          width: 300,
          itemBuilder: (row, index) {
            return Container(
              child: Text(row.age.toString() + (index % 2 == 0 ? '\n 787878 \n 898989 \n 787878 \n 898989 \n 787878 \n 898989 \n 787878 \n 898989' : '')),
            );
          },
        ),
        SkyGridTableColumn<Person>(
          headerTitle: HeaderTitle(text: '身高'),
          rightFixed: true,
          width: 200,
          itemBuilder: (row, index) {
            return Container(
              child: Text(row.height.toString()),
            );
          },
        ),
        SkyGridTableColumn<Person>(
          headerTitle: HeaderTitle(text: '住址'),
          width: 200,
          itemBuilder: (row, index) {
            return Container(
              child: Text(row.address.toString()),
            );
          },
        ),
        SkyGridTableColumn<Person>(
          headerTitle: HeaderTitle(text: '体重'),
          width: 300,
          itemBuilder: (row, index) {
            return Container(
              child: Text(row.weight.toString()),
            );
          },
        ),
      ],
    );
  }
}
