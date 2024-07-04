part of '../grid_table.dart';

class SkyGridHeader<T> extends StatelessWidget {
  const SkyGridHeader({
    super.key,
    required this.rowNum,
    required this.columns,
  });
  final int rowNum;
  final List<SkyGridTableColumn<T>> columns;

  @override
  Widget build(BuildContext context) {
    List<Widget> rowList = [];
    for (int i = 0; i < rowNum; i++) {
      rowList.add(SkyGridHeaderRow<T>(columns: columns));
    }
    return Column(
      children: rowList,
    );
  }
}
