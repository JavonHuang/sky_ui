import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../index.dart';
import '../styles.dart';

class HeaderCell extends StatelessWidget {
  final SkyTableColumn column;

  const HeaderCell({
    super.key,
    required this.column,
  });

  @override
  Widget build(BuildContext context) {
    SkyTableController controller = SkyTable.maybeOf(context)!.controller;

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
      width: column.getWidth == 0 ? null : column.getWidth,
      child: Text(column.label),
    );
    if (column.getFlex) {
      return Expanded(child: cellWidget);
    } else {
      return cellWidget;
    }
  }
}
