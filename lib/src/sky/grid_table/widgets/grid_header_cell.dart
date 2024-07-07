part of '../grid_table.dart';

class SkyGridHeaderCell<T> extends StatelessWidget {
  const SkyGridHeaderCell({
    super.key,
    required this.column,
    required this.lastRowCell,
  });
  final SkyGridTableColumn<T> column;
  final bool lastRowCell;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: column.cellWidth,
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
      child: column.headerTitle.text != null ? Text(column.headerTitle.text ?? '') : column.headerTitle.widgetTitle,
    );
  }
}
