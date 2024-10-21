part of '../../sky_table.dart';

class SkyTableHeader<T> extends StatefulWidget {
  const SkyTableHeader({
    super.key,
    required this.gridTableController,
    required this.columns,
    this.type = 0,
  });
  final TableController<T> gridTableController;
  final List<SkyTableColumn<T>> columns;
  final int type; //-1-left；0-main；1-right

  @override
  _SkyTableHeader<T> createState() => _SkyTableHeader<T>();
}

class _SkyTableHeader<T> extends State<SkyTableHeader<T>> {
  late List<Widget> mergeWidget = [];
  late double height = 0;
  late List<SkyTableColumn<T>> columns = [];
  void renderMerge() {
    if (widget.type != 0) return;
    for (SkyMergeColumn item in widget.gridTableController.mergeHeaderColumn) {
      double rowHeight = 0;
      double cellWidth = 0;
      double left = 0;
      double top = 0;
      top = height * item.start[0];
      for (int i = 0; i < item.start[1]; i++) {
        SkyTableColumn<T> column = widget.gridTableController.mainColumns[i];
        left += widget.gridTableController.getHeaderCellSize(column.key, item.start[0]).width;
      }
      rowHeight = ((item.end[0] - item.start[0]) + 1) * height;

      for (int j = item.start[1]; j <= item.end[1]; j++) {
        SkyTableColumn<T> column = widget.gridTableController.mainColumns[j];
        cellWidth += widget.gridTableController.getHeaderCellSize(column.key, item.start[0]).width;
        columns.add(column);
      }
      mergeWidget.add(Positioned(
        left: left,
        top: top,
        width: cellWidth,
        height: rowHeight,
        child: Container(
          padding: SkyGridTableStyle.paddingMerge,
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: SkyColors().defaultBg,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: SkyGridTableStyle.headerStyle,
                child: item.title.text != null ? Text(item.title.text ?? '') : item.title.widgetTitle!,
              ),
              const SizedBox(
                width: 4,
              ),
              if (item.onSort != null)
                SortIcon(
                  orderBy: widget.gridTableController.getSortMap(item.key),
                  gridTableController: widget.gridTableController,
                  onSort: (e) {
                    widget.gridTableController.updateSortMap(item.key, e);
                    item.onSort?.call(e, columns);
                  },
                ),
            ],
          ),
        ),
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rowList = [];
    Widget a = Directionality(
      textDirection: TextDirection.ltr,
      child: SizedBox(
        width: widget.gridTableController.getRenderWidth(widget.type),
        child: SkyTableHeaderRow<T>(
          gridTableController: widget.gridTableController,
          columns: widget.gridTableController.columns,
          rowIndex: 0,
        ),
      ),
    );
    height = MeasureUtil.measureWidget(a).height;

    for (int i = 0; i < widget.gridTableController.headerRowNum; i++) {
      rowList.add(SkyTableHeaderRow<T>(
        height: height,
        gridTableController: widget.gridTableController,
        rowIndex: i,
        columns: widget.columns,
      ));
    }

    return TekMeasureSize(
      onChange: (size) {
        renderMerge();
      },
      child: Stack(
        children: [
          Column(
            children: rowList,
          ),
          ...mergeWidget,
        ],
      ),
    );
  }
}
