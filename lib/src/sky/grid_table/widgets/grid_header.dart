part of '../grid_table.dart';

class SkyGridHeader<T> extends StatefulWidget {
  const SkyGridHeader({
    super.key,
    required this.headerRowNum,
    required this.columns,
    this.heightNotifier,
    required this.mergeHeaderColumn,
    required this.headerBoxSizeNotifier,
    required this.leftFixed,
    required this.rightFixed,
    required this.isFixed,
  });
  final int headerRowNum;
  final List<SkyGridTableColumn<T>> columns;
  final HeightNotifier? heightNotifier;
  final List<GridMergeHeaderColumn> mergeHeaderColumn;
  final HeaderBoxSizeNotifier headerBoxSizeNotifier;
  final bool leftFixed;
  final bool rightFixed;
  final bool isFixed;
  @override
  _SkyGridHeader<T> createState() => _SkyGridHeader<T>();
}

class _SkyGridHeader<T> extends State<SkyGridHeader<T>> {
  late List<Widget> mergeWidget = [];
  int get type {
    if (widget.isFixed) {
      return 0;
    }
    if (widget.leftFixed) {
      return -1;
    }
    if (widget.rightFixed) {
      return 1;
    }
    return 0;
  }

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
        top = top + widget.headerBoxSizeNotifier.getHeaderCellBoxSize(i, item.start[1], type).height;
      }
      for (int i = 0; i < item.start[1]; i++) {
        left = left + widget.headerBoxSizeNotifier.getHeaderCellBoxSize(item.start[0], i, type).width;
      }

      for (int i = item.start[0]; i <= item.end[0]; i++) {
        rowHeight = rowHeight + widget.headerBoxSizeNotifier.getHeaderCellBoxSize(i, item.start[1], type).height;
      }
      for (int j = item.start[1]; j <= item.end[1]; j++) {
        cellWidth = cellWidth + widget.headerBoxSizeNotifier.getHeaderCellBoxSize(item.start[0], j, type).width;
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
        rowIndex: i,
        headerBoxSizeNotifier: widget.headerBoxSizeNotifier,
        merge: widget.mergeHeaderColumn.isNotEmpty,
        leftFixed: widget.leftFixed,
        rightFixed: widget.rightFixed,
        isFixed: widget.isFixed,
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
