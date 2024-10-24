import 'dart:async';
import 'package:flutter/material.dart';
import '../../../styles/styles.dart';
import '../index.dart';
import '../model/sky_table_event.dart';
import 'body_cell.dart';

class SkyTableBodyRow extends StatefulWidget {
  final int rowIndex;
  final SkyTableController controller;
  final List<SkyTableColumn> columns;

  const SkyTableBodyRow({
    super.key,
    required this.rowIndex,
    required this.controller,
    required this.columns,
  });

  @override
  State<SkyTableBodyRow> createState() => _SkyTableBodyRowState();
}

class _SkyTableBodyRowState extends State<SkyTableBodyRow> {
  Color? triangleColor;

  late final StreamSubscription<SkyTableEvent> _listener;

  @override
  void initState() {
    super.initState();
    _listener = widget.controller.skyTableEventStreamController.stream.listen((_) {
      if (_.eventName == SkyTableEventType.rowHover && _.key == widget.rowIndex.toString()) {
        setState(() {
          triangleColor = _.value ? SkyColors().tableRowBgHover : null;
        });
      }
    });
  }

  @override
  void dispose() {
    _listener.pause();
    _listener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (e) {
          widget.controller.skyTableEventStreamController.add(SkyTableEvent(key: widget.rowIndex.toString(), eventName: SkyTableEventType.rowHover, value: true));
        },
        onExit: (e) {
          widget.controller.skyTableEventStreamController.add(SkyTableEvent(key: widget.rowIndex.toString(), eventName: SkyTableEventType.rowHover, value: false));
        },
        child: Container(
          decoration: BoxDecoration(
            color: triangleColor,
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
              return SkyTableBodyCell(
                rowData: widget.controller.data[widget.rowIndex],
                column: column,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
