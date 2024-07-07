part of '../grid_table.dart';

class SkyGridHeader<T> extends StatelessWidget {
  const SkyGridHeader({
    super.key,
    required this.rowNum,
    required this.columns,
    this.heightNotifier,
    required this.isFixed,
  });
  final int rowNum;
  final List<SkyGridTableColumn<T>> columns;
  final HeightNotifier? heightNotifier;
  final bool isFixed;
  @override
  Widget build(BuildContext context) {
    List<Widget> rowList = [];
    for (int i = 0; i < rowNum; i++) {
      rowList.add(SkyGridHeaderRow<T>(
        columns: columns,
        heightNotifier: heightNotifier,
        isFixed: isFixed,
        rowIndex: rowNum,
      ));
    }
    return Column(
      children: rowList,
    );
  }
}
