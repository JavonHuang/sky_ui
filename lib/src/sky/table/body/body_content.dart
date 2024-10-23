import 'dart:async';
import 'package:flutter/material.dart';
import '../index.dart';
import 'body_row.dart';

class SkyTableBodyContent extends StatelessWidget {
  final List<SkyTableColumn> columns;
  final ScrollController? scrollController;
  const SkyTableBodyContent({
    super.key,
    required this.columns,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    SkyTableController controller = SkyTable.maybeOf(context)!.controller;

    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          controller: scrollController,
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            if (index == controller.data.length - 1 && controller.loadFinish != null) {
              scheduleMicrotask(() {
                controller.loadFinish?.call(controller);
              });
            }

            return SkyTableBodyRow(
              rowIndex: index,
              columns: columns,
              controller: controller,
            );
          }),
    );
  }
}
