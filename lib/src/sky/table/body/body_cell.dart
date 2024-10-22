import 'package:flutter/material.dart';

import '../index.dart';

class SkyTableBodyCell extends StatelessWidget {
  final Map<dynamic, dynamic> rowData;
  final SkyTableColumn column;

  const SkyTableBodyCell({
    super.key,
    required this.rowData,
    required this.column,
  });

  @override
  Widget build(BuildContext context) {
    Widget cellWidget = Container(
      width: column.getWidth == 0 ? null : column.getWidth,
      child: Text(rowData[column.prop]),
    );
    if (column.flex) {
      return Expanded(child: cellWidget);
    } else {
      return cellWidget;
    }
  }
}
