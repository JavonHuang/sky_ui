part of '../grid_table.dart';

class SkyGridRow<T> extends StatefulWidget {
  const SkyGridRow({
    super.key,
    required this.rowRecord,
    required this.columns,
    required this.rowIndex,
    required this.rowOnTab,
    this.heightNotifier,
    required this.isFixed,
  });
  final T rowRecord;
  final List<SkyGridTableColumn<T>> columns;
  final int rowIndex;
  final Function(T e)? rowOnTab;
  final HeightNotifier? heightNotifier;
  final bool isFixed;

  @override
  _SkyGridRow<T> createState() => _SkyGridRow<T>();
}

class _SkyGridRow<T> extends State<SkyGridRow<T>> {
  double? height;
  final GlobalKey _key = GlobalKey();

  void getHeight() {
    final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    double h = renderBox.size.height;
    if (widget.heightNotifier != null && !widget.isFixed) {
      widget.heightNotifier!.setRowHeihtMap(widget.rowIndex, h);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.heightNotifier != null && widget.isFixed) {
      widget.heightNotifier!.addListener(() {
        if (widget.isFixed && mounted) {
          setState(() {
            height = widget.heightNotifier!.rowHeightMap[widget.rowIndex];
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
    List<Widget> result = [];
    for (int i = 0; i < widget.columns.length; i++) {
      SkyGridTableColumn<T> item = widget.columns[i];
      if (item.flex) {
        result.add(Expanded(
          child: SkyGridCell<T>(
            column: item,
            rowRecord: widget.rowRecord,
            rowIndex: widget.rowIndex,
            lastRowCell: i == widget.columns.length - 1,
          ),
        ));
      } else {
        result.add(SkyGridCell<T>(
          column: item,
          rowRecord: widget.rowRecord,
          rowIndex: widget.rowIndex,
          lastRowCell: i == widget.columns.length - 1,
        ));
      }
    }

    return IntrinsicHeight(
      key: _key,
      child: GestureDetector(
        onTap: () {
          widget.rowOnTab?.call(widget.rowRecord);
        },
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: widget.rowIndex % 2 != 0 ? SkyColors().tableRowBg : null,
            border: Border(
              bottom: BorderSide(
                color: SkyColors().baseBorder,
                width: 1,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: result,
          ),
        ),
      ),
    );
  }
}
