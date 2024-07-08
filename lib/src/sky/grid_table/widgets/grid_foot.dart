part of '../grid_table.dart';

class SkyGridFoot<T> extends StatefulWidget {
  const SkyGridFoot({
    super.key,
    required this.headerRowNum,
    required this.columns,
    this.heightNotifier,
    required this.isFixed,
    required this.mergeHeaderColumn,
    required this.headerBoxSizeNotifier,
  });
  final int headerRowNum;
  final List<SkyGridTableColumn<T>> columns;
  final HeightNotifier? heightNotifier;
  final bool isFixed;
  final List<GridMergeHeaderColumn> mergeHeaderColumn;
  final HeaderBoxSizeNotifier headerBoxSizeNotifier;

  @override
  _SkyGridFootState<T> createState() => _SkyGridFootState<T>();
}

class _SkyGridFootState<T> extends State<SkyGridFoot<T>> {
  late List<Widget> mergeWidget = [];

  @override
  void initState() {
    super.initState();
    //  if (widget.heightNotifier != null && widget.isFixed)
    if (widget.mergeHeaderColumn.isNotEmpty) {
      widget.headerBoxSizeNotifier.addListener(() {
        if (mounted) {
          renderMergeWidget();
        }
      });
    }
  }

  void renderMergeWidget() {
    mergeWidget = [];
    for (GridMergeHeaderColumn item in widget.mergeHeaderColumn) {
      double rowHeight = 0;
      double cellWidth = 0;
      double left = 0;
      double top = 0;
      for (int i = 0; i < item.start[0]; i++) {
        top = top + widget.headerBoxSizeNotifier.getHeaderCellBoxSize(i, item.start[1]).height;
      }
      for (int i = 0; i < item.start[1]; i++) {
        left = left + widget.headerBoxSizeNotifier.getHeaderCellBoxSize(item.start[0], i).width;
      }

      for (int i = item.start[0]; i <= item.end[0]; i++) {
        rowHeight = rowHeight + widget.headerBoxSizeNotifier.getHeaderCellBoxSize(i, item.start[1]).height;
      }
      for (int j = item.start[1]; j <= item.end[1]; j++) {
        cellWidth = cellWidth + widget.headerBoxSizeNotifier.getHeaderCellBoxSize(item.start[0], j).width;
      }
      mergeWidget.add(Positioned(
        left: left,
        top: top,
        width: cellWidth,
        height: rowHeight,
        child: Container(
          padding: SkyGridTableStyle.paddingMerge,
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: SkyColors().defaultBg,
          ),
          child: item.headerTitle.text != null ? Text(item.headerTitle.text ?? '') : item.headerTitle.widgetTitle,
        ),
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rowList = [];
    for (int i = 0; i < widget.headerRowNum; i++) {
      rowList.add(SkyGridHeaderRow<T>(
        columns: widget.columns,
        heightNotifier: widget.heightNotifier,
        isFixed: widget.isFixed,
        rowIndex: i,
        headerBoxSizeNotifier: widget.headerBoxSizeNotifier,
        merge: widget.mergeHeaderColumn.isNotEmpty,
      ));
    }
    return Stack(
      children: [
        Column(
          children: rowList,
        ),
        ...mergeWidget,
      ],
    );
  }
}
