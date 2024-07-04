part of '../grid_table.dart';

class SkyGridHeaderRow<T> extends StatelessWidget {
  const SkyGridHeaderRow({
    super.key,
    required this.columns,
  });
  final List<SkyGridTableColumn<T>> columns;

  @override
  Widget build(BuildContext context) {
    List<Widget> rowList = [];
    for (SkyGridTableColumn<T> item in columns) {
      if (item.flex) {
        rowList.add(Expanded(
          child: SkyGridHeaderCell<T>(column: item),
        ));
      } else {
        rowList.add(SkyGridHeaderCell<T>(column: item));
      }
    }
    return Container(
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
        children: rowList,
      ),
    );
  }
}
