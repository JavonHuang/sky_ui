part of '../../sky_table.dart';

class SkyTableFooterCell<T> extends StatelessWidget {
  const SkyTableFooterCell({
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
    Widget? showWidget;
    if (column.footerTitle != null) {
      if (column.footerTitle!.text != null) {
        showWidget = Text(column.footerTitle!.text ?? '');
      }
      if (column.footerTitle!.widgetTitle != null) {
        showWidget = column.footerTitle!.widgetTitle;
      }
    } else {
      if (column.headerTitle.widgetTitle != null) {
        showWidget = column.headerTitle.widgetTitle;
      } else {
        showWidget = Text(column.headerTitle.text ?? '');
      }
    }

    return TekMeasureSize(
      onChange: (size) {
        gridTableController.updateFooterCellSize(column.key, rowIndex, size);
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
          child: showWidget,
        ),
      ),
    );
  }
}
