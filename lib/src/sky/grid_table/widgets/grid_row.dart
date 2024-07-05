part of '../grid_table.dart';

class SkyGridRow<T> extends StatelessWidget {
  const SkyGridRow({
    super.key,
    required this.rowRecord,
    required this.columns,
    required this.rowIndex,
    required this.rowOnTab,
  });
  final T rowRecord;
  final List<SkyGridTableColumn<T>> columns;
  final int rowIndex;
  final Function(T e)? rowOnTab;
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
      child: GestureDetector(
        onTap: () {
          rowOnTab?.call(rowRecord);
        },
        child: Container(
          decoration: BoxDecoration(
            color: rowIndex % 2 != 0 ? SkyColors().tableRowBg : null,
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
      ),
    );
  }
}
