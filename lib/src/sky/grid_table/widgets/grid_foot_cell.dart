part of '../grid_table.dart';

class SkyGridFootCell<T> extends StatefulWidget {
  const SkyGridFootCell({
    super.key,
    required this.rowIndex,
    required this.cellIndex,
    required this.column,
    required this.lastRowCell,
    required this.footBoxSizeNotifier,
    required this.merge,
    required this.leftFixed,
    required this.rightFixed,
    required this.isFixed,
  });
  final int rowIndex;
  final int cellIndex;
  final SkyGridTableColumn<T> column;
  final bool lastRowCell;
  final FootBoxSizeNotifier footBoxSizeNotifier;
  final bool merge;
  final bool leftFixed;
  final bool rightFixed;
  final bool isFixed;
  @override
  _SkyGridFootCell<T> createState() => _SkyGridFootCell<T>();
}

class _SkyGridFootCell<T> extends State<SkyGridFootCell<T>> {
  final GlobalKey _key = GlobalKey();

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

  void getBoxSize() {
    if (_key.currentContext == null) {
      return;
    }
    final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    widget.footBoxSizeNotifier.setfooterCellBoxSizeMap(widget.rowIndex, widget.cellIndex, renderBox.size.width, renderBox.size.height, type);
  }

  @override
  void initState() {
    super.initState();
    if (widget.merge) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getBoxSize();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      width: widget.column.cellWidth,
      padding: SkyGridTableStyle.padding,
      decoration: BoxDecoration(
        border: !widget.lastRowCell
            ? Border(
                right: BorderSide(
                  color: SkyColors().baseBorder,
                  width: 1,
                ),
              )
            : null,
      ),
      child: widget.column.itemFooterBuilder != null
          ? widget.column.itemFooterBuilder!(widget.cellIndex)
          : (widget.column.headerTitle.text != null ? Text(widget.column.headerTitle.text ?? '') : widget.column.headerTitle.widgetTitle),
    );
  }
}
