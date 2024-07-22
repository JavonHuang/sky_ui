part of '../../sky_table.dart';

class SkyTableFooterRow<T> extends StatefulWidget {
  const SkyTableFooterRow({
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
  _SkyTableFooterRow<T> createState() => _SkyTableFooterRow<T>();
}

class _SkyTableFooterRow<T> extends State<SkyTableFooterRow<T>> {
  @override
  Widget build(BuildContext context) {
    List<Widget> cellList = [];

    for (int i = 0; i < widget.columns.length; i++) {
      SkyTableColumn<T> item = widget.columns[i];
      if (item.flex) {
        cellList.add(Expanded(
          child: SkyTableFooterCell<T>(
            column: item,
            lastRowCell: i == widget.columns.length - 1,
            rowIndex: widget.rowIndex,
            gridTableController: widget.gridTableController,
          ),
        ));
      } else {
        cellList.add(SkyTableFooterCell<T>(
          column: item,
          lastRowCell: i == widget.columns.length - 1,
          rowIndex: widget.rowIndex,
          gridTableController: widget.gridTableController,
        ));
      }
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
