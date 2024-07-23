part of '../../sky_table.dart';

class SkyTableCell<T> extends StatelessWidget {
  const SkyTableCell({
    super.key,
    required this.column,
    required this.rowRecord,
    required this.rowIndex,
    required this.lastRowCell,
  });
  final SkyTableColumn<T> column;
  final T rowRecord;
  final int rowIndex;
  final bool lastRowCell;

  @override
  Widget build(BuildContext context) {
    Widget w = Container(
      width: column.cellWidth,
      padding: SkyGridTableStyle.padding,
      decoration: BoxDecoration(
        border: !lastRowCell
            ? Border(
                right: BorderSide(
                  color: SkyColors().baseBorder,
                  width: 1,
                ),
              )
            : null,
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
