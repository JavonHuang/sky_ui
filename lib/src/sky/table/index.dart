import 'package:flutter/material.dart';
import '../common/generate_uuid.dart';
import 'body/body_row.dart';
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

  @override
  State<SkyTable> createState() => _SkyTableState();
}

class _SkyTableState extends State<SkyTable> {
  SkyTableController? _internalController;

  SkyTableController get _controller => widget.controller ?? _internalController!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = SkyTableController();
    }
    _controller._attach(this);
    _controller.data = [...widget.data];
    _controller.columns = [...widget.columns];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (ctx, box) {
          _controller.viewWidth = box.maxWidth;
          return TableDefault(
            controller: _controller,
          );
        },
      ),
    );
  }
}
