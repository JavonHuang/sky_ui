part of '../grid_table.dart';

class SkyGridRow<T> extends StatelessWidget {
  const SkyGridRow({
    super.key,
    required this.rowRecord,
    required this.columns,
    required this.rowIndex,
  });
  final T rowRecord;
  final List<SkyGridTableColumn<T>> columns;
  final int rowIndex;

  @override
  Widget build(BuildContext context) {
    List<Widget> result = [];
    for (SkyGridTableColumn<T> item in columns) {
      if (item.flex) {
        result.add(Expanded(
          child: SkyGridCell<T>(column: item, rowRecord: rowRecord, rowIndex: rowIndex),
        ));
      } else {
        result.add(SkyGridCell<T>(column: item, rowRecord: rowRecord, rowIndex: rowIndex));
      }
    }
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
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
