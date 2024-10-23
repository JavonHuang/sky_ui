import 'package:flutter/material.dart';

import '../../../styles/styles.dart';
import '../index.dart';
import 'header_cell.dart';

class HeaderRow extends StatelessWidget {
  final List<SkyTableColumn> columns;
  const HeaderRow({
    super.key,
    required this.columns,
  });

  @override
  Widget build(BuildContext context) {
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
          children: columns.map((column) {
            return HeaderCell(
              column: column,
            );
          }).toList(),
        ),
      ),
    );
  }
}
