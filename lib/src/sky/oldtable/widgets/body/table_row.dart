part of '../../sky_table.dart';

class SkyTableRow<T> extends StatefulWidget {
  const SkyTableRow({
    super.key,
    required this.rowRecord,
    required this.rowIndex,
    required this.gridTableController,
    this.height,
    required this.columns,
  });
  final T rowRecord;
  final int rowIndex;
  final TableController<T> gridTableController;
  final List<SkyTableColumn<T>> columns;

  final double? height;
  @override
  _SkyTableRow<T> createState() => _SkyTableRow<T>();
}

class _SkyTableRow<T> extends State<SkyTableRow<T>> {
  Color? triangleColor;

  late final StreamSubscription<SkyTableEvent> _listener;

  @override
  void initState() {
    super.initState();
    _listener = widget.gridTableController.skyTableEventStreamController.stream.listen((_) {
      if (_.eventName == SkyTableEventType.rowHover && _.key == widget.rowIndex.toString()) {
        setState(() {
          triangleColor = _.value;
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
    List<Widget> result = [];
    for (int i = 0; i < widget.columns.length; i++) {
      SkyTableColumn<T> item = widget.columns[i];
      if (item.flex) {
        result.add(Expanded(
          child: SkyTableCell<T>(
            column: item,
            rowRecord: widget.rowRecord,
            rowIndex: widget.rowIndex,
            lastRowCell: i == widget.columns.length - 1,
            gridTableController: widget.gridTableController,
          ),
        ));
      } else {
        result.add(SkyTableCell<T>(
          column: item,
          rowRecord: widget.rowRecord,
          rowIndex: widget.rowIndex,
          lastRowCell: i == widget.columns.length - 1,
          gridTableController: widget.gridTableController,
        ));
      }
    }

    return IntrinsicHeight(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (e) {
          widget.gridTableController.skyTableEventStreamController.add(SkyTableEvent(key: widget.rowIndex.toString(), eventName: SkyTableEventType.rowHover, value: SkyColors().tableRowBgHover));
        },
        onExit: (e) {
          widget.gridTableController.skyTableEventStreamController.add(SkyTableEvent(key: widget.rowIndex.toString(), eventName: SkyTableEventType.rowHover, value: null));
        },
        child: Container(
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.rowIndex % 2 != 0 ? SkyColors().tableDefaultRowBg : SkyColors().tableRowBg,
            border: Border(
              bottom: BorderSide(
                color: SkyColors().baseBorder,
                width: 1,
              ),
            ),
          ),
          child: Container(
            color: triangleColor,
            child: widget.gridTableController.rowOnTab != null
                ? GestureDetector(
                    onTap: () {
                      widget.gridTableController.rowOnTab?.call(widget.gridTableController.data[widget.rowIndex], widget.rowIndex);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: result,
                    ),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: result,
                  ),
          ),
        ),
      ),
    );
  }
}
