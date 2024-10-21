import 'package:flutter/material.dart';
part 'table_controller.dart';

class SkyTable extends StatefulWidget {
  const SkyTable({super.key});

  @override
  State<SkyTable> createState() => _SkyTableState();
}

class _SkyTableState extends State<SkyTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (c, b) {
          return Text("56789");
        },
      ),
    );
  }
}
