part of '../grid_table.dart';

class SkyGridHeaderRow<T> extends StatefulWidget {
  const SkyGridHeaderRow({
    super.key,
    required this.rowIndex,
    required this.columns,
    this.headerHeightNotifier,
    required this.headerBoxSizeNotifier,
    this.merge = false,
    required this.leftFixed,
    required this.rightFixed,
    required this.isFixed,
  });
  final int rowIndex;

  final List<SkyGridTableColumn<T>> columns;
  final HeaderHeightNotifier? headerHeightNotifier;
  final HeaderBoxSizeNotifier headerBoxSizeNotifier;
  final bool merge;
  final bool leftFixed;
  final bool rightFixed;
  final bool isFixed;
  @override
  _SkyGridHeaderRow<T> createState() => _SkyGridHeaderRow<T>();
}

class _SkyGridHeaderRow<T> extends State<SkyGridHeaderRow<T>> {
  double? height;

  final GlobalKey _key = GlobalKey();

  void getHeight() {
    final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    double h = renderBox.size.height;
    // if (widget.heightNotifier != null && !widget.isFixed)
    if (widget.headerHeightNotifier != null) {
      widget.headerHeightNotifier!.setRowHeihtMap(widget.rowIndex, h);
    }
  }

  @override
  void initState() {
    super.initState();
    //  if (widget.heightNotifier != null && widget.isFixed)
    if (widget.headerHeightNotifier != null) {
      widget.headerHeightNotifier!.addListener(() {
        if (mounted && height != widget.headerHeightNotifier!.rowHeightMap[widget.rowIndex]) {
          setState(() {
            height = widget.headerHeightNotifier!.rowHeightMap[widget.rowIndex];
          });
        }
      });
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getHeight();
    });
  }

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
            headerBoxSizeNotifier: widget.headerBoxSizeNotifier,
            merge: widget.merge,
            rowIndex: widget.rowIndex,
            cellIndex: i,
            leftFixed: widget.leftFixed,
            rightFixed: widget.rightFixed,
            isFixed: widget.isFixed,
          ),
        ));
      } else {
        rowList.add(SkyGridHeaderCell<T>(
          column: item,
          lastRowCell: i == widget.columns.length - 1,
          headerBoxSizeNotifier: widget.headerBoxSizeNotifier,
          merge: widget.merge,
          rowIndex: widget.rowIndex,
          cellIndex: i,
          leftFixed: widget.leftFixed,
          rightFixed: widget.rightFixed,
          isFixed: widget.isFixed,
        ));
      }
    }
    return IntrinsicHeight(
      key: _key,
      child: Container(
        height: height,
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: rowList,
        ),
      ),
    );
  }
}
