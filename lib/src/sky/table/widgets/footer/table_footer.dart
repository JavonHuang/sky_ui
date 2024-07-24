part of '../../sky_table.dart';

class SkyTableFooter<T> extends StatefulWidget {
  const SkyTableFooter({
    super.key,
    required this.gridTableController,
    required this.columns,
    this.type = 0,
  });
  final TableController<T> gridTableController;
  final List<SkyTableColumn<T>> columns;
  final int type; //-1-left；0-main；1-right
  @override
  _SkyTableFooter<T> createState() => _SkyTableFooter<T>();
}

class _SkyTableFooter<T> extends State<SkyTableFooter<T>> {
  late List<Widget> mergeWidget = [];
  late double height = 0;
  void renderMerge() {
    if (widget.type != 0) return;
    for (SkyMergeColumn item in widget.gridTableController.mergeFooterColumn) {
      double rowHeight = 0;
      double cellWidth = 0;
      double left = 0;
      double top = 0;
      top = height * item.start[0];
      for (int i = 0; i < item.start[1]; i++) {
        SkyTableColumn<T> column = widget.gridTableController.mainColumns[i];
        left += widget.gridTableController.getFooterCellSize(column.key, item.start[0]).width;
      }
      rowHeight = ((item.end[0] - item.start[0]) + 1) * height;

      for (int j = item.start[1]; j <= item.end[1]; j++) {
        SkyTableColumn<T> column = widget.gridTableController.mainColumns[j];
        cellWidth += widget.gridTableController.getFooterCellSize(column.key, item.start[0]).width;
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
          child: item.title.text != null ? Text(item.title.text ?? '') : item.title.widgetTitle,
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
        child: SkyTableFooterRow<T>(
          gridTableController: widget.gridTableController,
          columns: widget.gridTableController.columns,
          rowIndex: 0,
        ),
      ),
    );
    height = MeasureUtil.measureWidget(a).height;

    for (int i = 0; i < widget.gridTableController.footerRowNum; i++) {
      rowList.add(SkyTableFooterRow<T>(
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
