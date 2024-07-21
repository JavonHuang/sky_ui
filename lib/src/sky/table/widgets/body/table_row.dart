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
          ),
        ));
      } else {
        result.add(SkyTableCell<T>(
          column: item,
          rowRecord: widget.rowRecord,
          rowIndex: widget.rowIndex,
          lastRowCell: i == widget.columns.length - 1,
        ));
      }
    }

    return IntrinsicHeight(
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.rowIndex % 2 != 0 ? SkyColors().tableRowBg : null,
          border: Border(
            bottom: BorderSide(
              color: SkyColors().baseBorder,
              width: 1,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: result,
        ),
      ),
    );
  }
}
