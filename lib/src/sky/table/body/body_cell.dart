import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../index.dart';
import '../styles.dart';

class SkyTableBodyCell extends StatelessWidget {
  final Map<dynamic, dynamic> rowData;
  final SkyTableColumn column;
  final int rowIndex;

  const SkyTableBodyCell({
    super.key,
    required this.rowData,
    required this.column,
    required this.rowIndex,
  });

  @override
  Widget build(BuildContext context) {
    SkyTableController controller = SkyTable.maybeOf(context)!.controller;

    Widget cellWidget = Container(
      padding: SkyGridTableStyle.padding,
      // color: Colors.red,

      decoration: BoxDecoration(
        border: controller.border
            ? Border(
                right: BorderSide(
                  width: 1,
                  color: SkyColors().baseBorder,
                ),
              )
            : null,
      ),
      width: column.getWidth == 0 ? null : column.getWidth,
      child: column.action ? (column.actionBuilder?.call(rowData, rowIndex)) : Text(rowData[column.prop]),
    );
    if (column.getFlex) {
      return Expanded(child: cellWidget);
    } else {
      return cellWidget;
    }
  }
}
