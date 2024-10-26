import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../index.dart';
import '../styles.dart';

class SkyTableBodyCell extends StatelessWidget {
  final Map<dynamic, dynamic> rowData;
  final SkyTableColumn column;
  final int rowIndex;
  final int cellIndex;

  final SkyTableController controller;
  final bool compute;

  const SkyTableBodyCell({
    super.key,
    required this.rowData,
    required this.column,
    required this.rowIndex,
    required this.controller,
    required this.compute,
    required this.cellIndex,
  });

  @override
  Widget build(BuildContext context) {
    double width = column.getWidth;
    if (controller.widthOverflow && column.getFlex) {
      width = column.getMinWidth;
    }
    if (compute && !controller.widthOverflow) {
      width = controller.flexWidth(column);
    }

    Widget? buildWidget = column.rowCellBuilder != null ? column.rowCellBuilder!(rowIndex, cellIndex) : Text(rowData[column.prop]);

    Widget cellWidget = Container(
      padding: SkyGridTableStyle.padding,
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
      width: width == 0 ? null : width,
      child: column.action ? (column.actionBuilder?.call(rowData, rowIndex)) : buildWidget,
    );

    if (column.getFlex && width == 0 && !compute) {
      return Expanded(child: cellWidget);
    } else {
      return cellWidget;
    }
  }
}
