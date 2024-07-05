part of '../grid_table.dart';

class SkyGridCell<T> extends StatelessWidget {
  const SkyGridCell({
    super.key,
    required this.column,
    required this.rowRecord,
    required this.rowIndex,
  });
  final SkyGridTableColumn<T> column;
  final T rowRecord;
  final int rowIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: column.cellWidth,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: SkyColors().baseBorder,
            width: 1,
          ),
        ),
      ),
      child: column.itemBuilder(rowRecord, rowIndex),
    );
  }
}
