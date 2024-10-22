import 'package:flutter/material.dart';
import '../../styles/styles.dart';
import '../common/generate_uuid.dart';
import 'body/body_row.dart';
import 'header/header_row.dart';
part 'table_controller.dart';
part 'table_default.dart';
part 'model/table_column.dart';

class SkyTable extends StatefulWidget {
  final List<Map<dynamic, dynamic>> data;
  final List<SkyTableColumn> columns;
  final SkyTableController? controller;
  const SkyTable({
    super.key,
    this.controller,
    required this.data,
    required this.columns,
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: SkyColors().baseBorder,
          width: 1,
        ),
      ),
      child: _SkyTableScope(
        skyTableState: this,
        child: LayoutBuilder(
          builder: (ctx, box) {
            controller.viewWidth = box.maxWidth;
            return TableDefault();
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
