part of '../grid_table.dart';

class SkyGridHeaderRow<T> extends StatefulWidget {
  const SkyGridHeaderRow({
    super.key,
    required this.columns,
  });
  final List<SkyGridTableColumn<T>> columns;
  @override
  _SkyGridHeaderRow<T> createState() => _SkyGridHeaderRow<T>();
}

class _SkyGridHeaderRow<T> extends State<SkyGridHeaderRow<T>> {
  @override
  Widget build(BuildContext context) {
    List<Widget> rowList = [];
    for (int i = 0; i < widget.columns.length; i++) {
      SkyGridTableColumn<T> item = widget.columns[i];
      if (item.flex) {
        rowList.add(Expanded(
          child: SkyGridHeaderCell<T>(
            column: item,
            lastRowCell: i == widget.columns.length - 1,
          ),
        ));
      } else {
        rowList.add(SkyGridHeaderCell<T>(
          column: item,
          lastRowCell: i == widget.columns.length - 1,
        ));
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
