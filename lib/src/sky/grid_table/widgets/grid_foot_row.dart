part of '../grid_table.dart';

class SkyGridFootRow<T> extends StatefulWidget {
  const SkyGridFootRow({
    super.key,
    required this.rowIndex,
    required this.columns,
    this.heightNotifier,
    required this.isFixed,
    required this.headerBoxSizeNotifier,
    this.merge = false,
  });
  final int rowIndex;

  final List<SkyGridTableColumn<T>> columns;
  final HeightNotifier? heightNotifier;
  final bool isFixed;
  final HeaderBoxSizeNotifier headerBoxSizeNotifier;
  final bool merge;

  @override
  _SkyGridFootRowState<T> createState() => _SkyGridFootRowState<T>();
}

class _SkyGridFootRowState<T> extends State<SkyGridFootRow<T>> {
  double? height;

  final GlobalKey _key = GlobalKey();

  void getHeight() {
    final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    double h = renderBox.size.height;
    // if (widget.heightNotifier != null && !widget.isFixed)
    if (widget.heightNotifier != null) {
      widget.heightNotifier!.setRowHeihtMap(-widget.rowIndex, h);
    }
  }

  @override
  void initState() {
    super.initState();
    //  if (widget.heightNotifier != null && widget.isFixed)
    if (widget.heightNotifier != null) {
      widget.heightNotifier!.addListener(() {
        if (mounted && height != widget.heightNotifier!.rowHeightMap[-widget.rowIndex]) {
          setState(() {
            height = widget.heightNotifier!.rowHeightMap[-widget.rowIndex];
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
          child: SkyGridFootCell<T>(
            column: item,
            lastRowCell: i == widget.columns.length - 1,
            headerBoxSizeNotifier: widget.headerBoxSizeNotifier,
            merge: widget.merge,
            rowIndex: widget.rowIndex,
            cellIndex: i,
          ),
        ));
      } else {
        rowList.add(SkyGridFootCell<T>(
          column: item,
          lastRowCell: i == widget.columns.length - 1,
          headerBoxSizeNotifier: widget.headerBoxSizeNotifier,
          merge: widget.merge,
          rowIndex: widget.rowIndex,
          cellIndex: i,
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
