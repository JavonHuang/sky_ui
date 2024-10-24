import 'dart:async';

import 'package:flutter/material.dart';
import '../../styles/styles.dart';
import '../common/generate_uuid.dart';
import 'body/body_content.dart';
import 'header/header_row.dart';
import 'linked_scroll_controller.dart';
import 'model/sky_table_event.dart';
part 'table_controller.dart';
part 'table_default.dart';
part 'model/table_column.dart';
part 'model/table_style.dart';

class SkyTable extends StatefulWidget {
  final List<Map<dynamic, dynamic>> data;
  final List<SkyTableColumn> columns;
  final SkyTableController? controller;
  final Function(SkyTableController ctr)? loadFinish;
  final bool border;
  final bool stripe;
  final SkyRowStyle? Function(dynamic rowDate, int rowIndex)? rowStyle;

  const SkyTable({
    super.key,
    this.controller,
    required this.data,
    required this.columns,
    this.loadFinish,
    this.border = false,
    this.stripe = false,
    this.rowStyle,
  });

  static _SkyTableState? maybeOf(BuildContext context) {
    final _SkyTableScope? scope = context.dependOnInheritedWidgetOfExactType<_SkyTableScope>();
    return scope?.skyTableState;
  }

  @override
  State<SkyTable> createState() => _SkyTableState();
}

class _SkyTableState extends State<SkyTable> {
  SkyTableController? _internalController;

  SkyTableController get controller => widget.controller ?? _internalController!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = SkyTableController();
    }
    controller._attach(this);
    controller.data = [...widget.data];
    controller.columns = [...widget.columns];
    controller.loadFinish = widget.loadFinish;
    controller.border = widget.border;
    controller.stripe = widget.stripe;
    controller.rowStyle = widget.rowStyle;
  }

  @override
  void dispose() {
    controller._detach(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: controller.border
            ? Border.all(
                color: SkyColors().baseBorder,
                width: 1,
              )
            : null,
      ),
      child: _SkyTableScope(
        skyTableState: this,
        child: LayoutBuilder(
          builder: (ctx, box) {
            controller.viewWidth = box.maxWidth;
            return const TableDefault();
          },
        ),
      ),
    );
  }
}

class _SkyTableScope extends InheritedWidget {
  const _SkyTableScope({
    required super.child,
    required this.skyTableState,
  });

  final _SkyTableState skyTableState;

  @override
  bool updateShouldNotify(_SkyTableScope old) => skyTableState != old.skyTableState;
}
