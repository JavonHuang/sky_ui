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
  BoxBorder? get border {
    if (!lastRowCell && gridTableController.border) {
      return Border(
        right: BorderSide(
          color: SkyColors().baseBorder,
          width: 1,
        ),
      );
    }
    return null;
  }

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
            border: border,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: SkyGridTableStyle.headerStyle,
                child: column.headerTitle.text != null ? Text(column.headerTitle.text ?? '') : column.headerTitle.widgetTitle!,
              ),
              const SizedBox(
                width: 4,
              ),
              if (column.onSort != null)
                SortIcon(
                  orderBy: gridTableController.getSortMap(column.key),
                  gridTableController: gridTableController,
                  onSort: (e) {
                    gridTableController.updateSortMap(column.key, e);
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
