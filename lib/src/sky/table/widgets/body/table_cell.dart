part of '../../sky_table.dart';

class SkyTableCell<T> extends StatelessWidget {
  const SkyTableCell({
    super.key,
    required this.column,
    required this.rowRecord,
    required this.rowIndex,
    required this.lastRowCell,
    required this.gridTableController,
  });
  final SkyTableColumn<T> column;
  final T rowRecord;
  final int rowIndex;
  final bool lastRowCell;
  final TableController<T> gridTableController;

  BoxBorder? get border {
    if (!lastRowCell && gridTableController.border) {
      return Border(
        right: BorderSide(
          color: SkyColors().baseBorder,
          width: 1,
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Widget w = Container(
      width: column.cellWidth,
      constraints: BoxConstraints(
        minWidth: column.cellWidth, // 最小宽度
      ),
      padding: SkyGridTableStyle.padding,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: border,
      ),
      child: column.itemBuilder(rowRecord, rowIndex),
    );
    return Directionality(
      textDirection: TextDirection.ltr,
      child: column.cellOnTab != null
          ? GestureDetector(
              onTap: () {
                column.cellOnTab?.call(rowRecord, rowIndex);
              },
              child: w,
            )
          : w,
    );
  }
}
