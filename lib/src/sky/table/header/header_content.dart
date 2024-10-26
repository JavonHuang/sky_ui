import 'package:flutter/material.dart';

import '../core/measure_util.dart';
import '../index.dart';
import 'header_row.dart';

class SkyHeaderContent extends StatefulWidget {
  final List<SkyTableColumn> columns;
  final bool content;
  final SkyTableController controller;
  const SkyHeaderContent({
    super.key,
    required this.columns,
    this.content = false,
    required this.controller,
  });

  @override
  State<SkyHeaderContent> createState() => _SkyHeaderContentState();
}

class _SkyHeaderContentState extends State<SkyHeaderContent> {
  @override
  Widget build(BuildContext context) {
    List<Widget> heanderRowWidgetList = [];
    for (int index = 0; index < widget.controller.headerRowCount; index++) {
      double? height = 0;
      if (widget.content) {
        height = MeasureUtil.measureWidget(Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(
              width: widget.controller.columnWidth,
              child: SkyHeaderRow(
                controller: widget.controller,
                columns: widget.columns,
                compute: true,
                headerRowIndex: index,
              )),
        )).height;
        widget.controller.setHeaderRowHeight(index, height);
      } else {
        height = widget.controller.getHeaderRowHeight(index);
      }
      heanderRowWidgetList.add(
        SizedBox(
          height: height,
          child: SkyHeaderRow(
            controller: widget.controller,
            columns: widget.columns,
            headerRowIndex: index,
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: heanderRowWidgetList,
    );
  }
}
