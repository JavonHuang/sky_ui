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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
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
      ),
    );
  }
}
