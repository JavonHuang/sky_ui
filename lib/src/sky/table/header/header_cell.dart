import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../index.dart';
import '../styles.dart';

class HeaderCell extends StatelessWidget {
  final SkyTableColumn column;
  final bool compute;
  final SkyTableController controller;
  final int headerCellIndex;
  final int headerRowIndex;

  const HeaderCell({
    super.key,
    required this.column,
    this.compute = false,
    required this.controller,
    required this.headerCellIndex,
    required this.headerRowIndex,
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

    Widget cellWidget = Container(
      // color: Colors.red,
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
      child: column.headerCellBuilder != null ? column.headerCellBuilder!(headerRowIndex, headerCellIndex) : Text(column.label),
    );

    if (column.getFlex && width == 0 && !compute) {
      return Expanded(child: cellWidget);
    } else {
      return cellWidget;
    }
  }
}
