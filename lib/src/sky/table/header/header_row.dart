import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../core/measure_util.dart';
import '../index.dart';
import 'header_cell.dart';

class SkyHeaderRow extends StatefulWidget {
  final List<SkyTableColumn> columns;
  final bool compute;
  final SkyTableController controller;
  final int headerRowIndex;

  const SkyHeaderRow({
    super.key,
    required this.columns,
    this.compute = false,
    required this.controller,
    required this.headerRowIndex,
  });

  @override
  State<SkyHeaderRow> createState() => _SkyHeaderRowState();
}

class _SkyHeaderRowState extends State<SkyHeaderRow> {
  @override
  Widget build(BuildContext context) {
    int headerCellIndex = 0;
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: SkyColors().baseBorder,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widget.columns.map((column) {
            return HeaderCell(
              column: column,
              compute: widget.compute,
              controller: widget.controller,
              headerCellIndex: headerCellIndex++,
              headerRowIndex: widget.headerRowIndex,
            );
          }).toList(),
        ),
      ),
    );
  }
}
