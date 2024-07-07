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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      data = List.generate(20, (index) => Person(name: 'Javon_$index', age: 20 + index, height: 168 + index, weight: 54 + index, address: '广州市天河区黄埔大道${39 + index}号'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SkyInfiniteGridTable<Person>(
      data: data,
      loadFinish: true,
      columns: [
        SkyGridTableColumn<Person>(
          headerTitle: HeaderTitle(text: '姓名'),
          width: 200,
          itemBuilder: (row, index) {
            return Container(
              height: 50,
              child: Text(row.name),
            );
          },
        ),
        SkyGridTableColumn<Person>(
          headerTitle: HeaderTitle(text: '年龄'),
          width: 300,
          leftFixed: true,
          itemBuilder: (row, index) {
            return Container(
              child: Text(row.age.toString()),
            );
          },
        ),
        SkyGridTableColumn<Person>(
          headerTitle: HeaderTitle(text: '身高'),
          rightFixed: true,
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
