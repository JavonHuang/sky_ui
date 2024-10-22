import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../index.dart';
import 'header_cell.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SkyTableController controller = SkyTable.maybeOf(context)!.controller;

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
          children: controller.columns.map((column) {
            return HeaderCell(
              column: column,
            );
          }).toList(),
        ),
      ),
    );
  }
}
