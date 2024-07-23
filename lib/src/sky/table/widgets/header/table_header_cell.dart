part of '../../sky_table.dart';

class SkyTableHeaderCell<T> extends StatelessWidget {
  const SkyTableHeaderCell({
    super.key,
    required this.column,
    required this.rowIndex,
    required this.lastRowCell,
    required this.gridTableController,
  });
  final SkyTableColumn<T> column;
  final int rowIndex;
  final bool lastRowCell;
  final TableController<T> gridTableController;

  @override
  Widget build(BuildContext context) {
    return TekMeasureSize(
      onChange: (size) {
        gridTableController.updateHeaderCellSize(column.key, rowIndex, size);
      },
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          width: column.flex ? null : column.cellWidth,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              column.headerTitle.text != null ? Text(column.headerTitle.text ?? '') : column.headerTitle.widgetTitle!,
              const SizedBox(
                width: 4,
              ),
              if (column.onSort != null)
                SortIcon(
                  gridTableController: gridTableController,
                  onSort: (e) {
                    column.onSort?.call(e, column);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
