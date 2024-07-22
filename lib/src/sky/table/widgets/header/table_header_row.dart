part of '../../sky_table.dart';

class SkyTableHeaderRow<T> extends StatefulWidget {
  const SkyTableHeaderRow({
    super.key,
    required this.rowIndex,
    required this.gridTableController,
    this.height,
    required this.columns,
  });
  final int rowIndex;
  final TableController<T> gridTableController;
  final double? height;
  final List<SkyTableColumn<T>> columns;
  @override
  _SkyTableHeaderRow<T> createState() => _SkyTableHeaderRow<T>();
}

class _SkyTableHeaderRow<T> extends State<SkyTableHeaderRow<T>> {
  @override
  Widget build(BuildContext context) {
    List<Widget> cellList = [];

    for (int i = 0; i < widget.columns.length; i++) {
      SkyTableColumn<T> item = widget.columns[i];
      if (item.flex) {
        cellList.add(Expanded(
          child: SkyTableHeaderCell<T>(
            column: item,
            lastRowCell: i == widget.columns.length - 1,
            rowIndex: widget.rowIndex,
            gridTableController: widget.gridTableController,
          ),
        ));
      } else {
        cellList.add(SkyTableHeaderCell<T>(
          column: item,
          lastRowCell: i == widget.columns.length - 1,
          rowIndex: widget.rowIndex,
          gridTableController: widget.gridTableController,
        ));
      }
      // print(widget.gridTableController.getHeaderCellSize(item.key, widget.rowIndex));
    }
    return IntrinsicHeight(
      child: Container(
        height: widget.height,
        decoration: BoxDecoration(
          color: SkyColors().defaultBg,
          border: Border(
            bottom: BorderSide(
              color: SkyColors().baseBorder,
              width: 1,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cellList,
        ),
      ),
    );
  }
}
