import 'package:flutter/material.dart';

import '../index.dart';
import 'body_cell.dart';

class SkyTableBodyRow extends StatelessWidget {
  final Map<dynamic, dynamic> rowData;
  final List<SkyTableColumn> columns;

  const SkyTableBodyRow({
    super.key,
    required this.rowData,
    required this.columns,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: rowData.keys.map((key) {
        SkyTableColumn column = columns.firstWhere((e) => e.prop == key);
        return SkyTableBodyCell(
          rowData: rowData,
          column: column,
        );
      }).toList(),
    );
  }
}
