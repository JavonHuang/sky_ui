import 'dart:async';

import 'package:example/test2.dart';
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

class SkyGridTable extends StatefulWidget {
  const SkyGridTable({super.key});

  @override
  State<SkyGridTable> createState() => _SkyGridTableState();
}

class _SkyGridTableState extends State<SkyGridTable> {
  List<Person> data = [];
  TableController<Person> tableController = TableController<Person>();
  late bool loadFinish = false;
  late bool loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      data = List.generate(10, (index) => Person(name: 'Javon_$index', age: index, height: 168 + index, weight: 54 + index, address: '广州市天河区黄埔大道${39 + index}号'));
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
      data = [
        ...data,
        ...List.generate(10, (index) => Person(name: 'Javon_${index + data.length}', age: index + data.length, height: 168 + index, weight: 54 + index, address: '广州市天河区黄埔大道${39 + index}号'))
      ];
      tableController.setData(data);
      setState(() {
        loadFinish = data.length > 50;
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SkyTable<Person>(
      tableController: tableController,
      data: data,
      loadFinish: loadFinish,
      loading: loading,
      loadMore: loadMore,
      columns: [
        SkyTableColumn<Person>(
          leftFixed: true,
          headerTitle: WidgetTitle(
              widgetTitle: Container(
            height: 60,
            child: Text('姓名'),
          )),
          width: 200,
          itemBuilder: (row, index) {
            return Container(
              color: Colors.blue,
              child: Text(row.name),
            );
          },
        ),
        SkyTableColumn<Person>(
          headerTitle: WidgetTitle(
              widgetTitle: Container(
            child: Text('年龄'),
          )),
          width: 300,
          itemBuilder: (row, index) {
            return Container(
              color: Colors.red,
              child: Text(row.age.toString() + (index % 2 == 0 ? '\n 787878 \n 898989 \n 787878 \n 898989 \n 787878 \n 898989 \n 787878 \n 898989' : '')),
            );
          },
        ),
        SkyTableColumn<Person>(
          headerTitle: WidgetTitle(text: '身高'),
          rightFixed: true,
          width: 200,
          itemBuilder: (row, index) {
            return Text(row.height.toString());
          },
        ),
        SkyTableColumn<Person>(
          headerTitle: WidgetTitle(text: '住址'),
          width: 200,
          itemBuilder: (row, index) {
            return Text(row.address.toString());
          },
        ),
        SkyTableColumn<Person>(
          headerTitle: WidgetTitle(text: '体重'),
          width: 300,
          itemBuilder: (row, index) {
            return Text(row.weight.toString());
          },
        ),
      ],
    );
  }
}
