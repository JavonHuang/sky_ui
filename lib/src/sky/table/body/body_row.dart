import 'package:flutter/material.dart';
import 'package:sky_ui/src/sky/common/sky_hover.dart';

import '../../../styles/styles.dart';
import '../index.dart';
import 'body_cell.dart';

class SkyTableBodyRow extends StatelessWidget {
  const SkyTableBodyRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SkyTableController controller = SkyTable.maybeOf(context)!.controller;

    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: controller.data.length,
          itemBuilder: (context, index) {
            return IntrinsicHeight(
              child: SkyHover(
                disabled: false,
                builder: (context, onHover) => Container(
                  decoration: BoxDecoration(
                    color: index % 2 == 1 || onHover ? SkyColors().tableRowBg : SkyColors().tableDefaultRowBg,
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
                      return SkyTableBodyCell(
                        rowData: controller.data[index],
                        column: column,
                      );
                    }).toList(),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
