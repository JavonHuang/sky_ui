part of '../grid_table.dart';

class SkyGridFoot<T> extends StatefulWidget {
  SkyGridFoot({
    super.key,
    required this.footerRowNum,
    required this.columns,
    this.heightNotifier,
    required this.mergeFooterColumn,
    required this.footBoxSizeNotifier,
    required this.leftFixed,
    required this.rightFixed,
    required this.isFixed,
  });
  final int footerRowNum;
  final List<SkyGridTableColumn<T>> columns;
  final HeightNotifier? heightNotifier;
  final List<GridMergeFooterColumn> mergeFooterColumn;
  final FootBoxSizeNotifier footBoxSizeNotifier;
  final bool leftFixed;
  final bool rightFixed;
  late bool isFixed;
  @override
  _SkyGridFootState<T> createState() => _SkyGridFootState<T>();
}

class _SkyGridFootState<T> extends State<SkyGridFoot<T>> {
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
    //  if (widget.heightNotifier != null && widget.isFixed||)
    if (widget.mergeFooterColumn.isNotEmpty) {
      widget.footBoxSizeNotifier.addListener(() {
        if (mounted) {
          renderMergeWidget();
        }
      });
    }
  }

  void renderMergeWidget() {
    mergeWidget = [];
    for (GridMergeFooterColumn item in widget.mergeFooterColumn) {
      double rowHeight = 0;
      double cellWidth = 0;
      double left = 0;
      double top = 0;
      for (int i = 0; i < item.start[0]; i++) {
        top = top + widget.footBoxSizeNotifier.getfootCellBoxSize(i, item.start[1], type).height;
      }
      for (int i = 0; i < item.start[1]; i++) {
        left = left + widget.footBoxSizeNotifier.getfootCellBoxSize(item.start[0], i, type).width;
      }

      for (int i = item.start[0]; i <= item.end[0]; i++) {
        rowHeight = rowHeight + widget.footBoxSizeNotifier.getfootCellBoxSize(i, item.start[1], type).height;
      }
      for (int j = item.start[1]; j <= item.end[1]; j++) {
        cellWidth = cellWidth + widget.footBoxSizeNotifier.getfootCellBoxSize(item.start[0], j, type).width;
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
          child: item.footerTitle.text != null ? Text(item.footerTitle.text ?? '') : item.footerTitle.widgetTitle,
        ),
      ));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rowList = [];
    for (int i = 0; i < widget.footerRowNum; i++) {
      rowList.add(SkyGridFootRow<T>(
        columns: widget.columns,
        heightNotifier: widget.heightNotifier,
        rowIndex: i,
        footBoxSizeNotifier: widget.footBoxSizeNotifier,
        merge: widget.mergeFooterColumn.isNotEmpty,
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
