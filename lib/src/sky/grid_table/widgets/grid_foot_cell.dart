part of '../grid_table.dart';

class SkyGridFootCell<T> extends StatefulWidget {
  const SkyGridFootCell({
    super.key,
    required this.rowIndex,
    required this.cellIndex,
    required this.column,
    required this.lastRowCell,
    required this.headerBoxSizeNotifier,
    required this.merge,
  });
  final int rowIndex;
  final int cellIndex;
  final SkyGridTableColumn<T> column;
  final bool lastRowCell;
  final HeaderBoxSizeNotifier headerBoxSizeNotifier;
  final bool merge;
  @override
  _SkyGridFootCell<T> createState() => _SkyGridFootCell<T>();
}

class _SkyGridFootCell<T> extends State<SkyGridFootCell<T>> {
  final GlobalKey _key = GlobalKey();

  void getBoxSize() {
    final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    widget.headerBoxSizeNotifier.setHeaderCellBoxSizeMap(widget.rowIndex, widget.cellIndex, renderBox.size.width, renderBox.size.height);
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
      child: widget.column.headerTitle.text != null ? Text(widget.column.headerTitle.text ?? '') : widget.column.headerTitle.widgetTitle,
    );
  }
}
