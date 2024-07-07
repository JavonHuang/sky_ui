part of '../grid_table.dart';

class SkyGridHeaderRow<T> extends StatefulWidget {
  const SkyGridHeaderRow({
    super.key,
    required this.rowIndex,
    required this.columns,
    this.heightNotifier,
    required this.isFixed,
  });
  final int rowIndex;

  final List<SkyGridTableColumn<T>> columns;
  final HeightNotifier? heightNotifier;
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
    if (widget.heightNotifier != null && !widget.isFixed) {
      widget.heightNotifier!.setRowHeihtMap(-widget.rowIndex, h);
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.heightNotifier != null && widget.isFixed) {
      widget.heightNotifier!.addListener(() {
        if (widget.isFixed && mounted) {
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
          child: SkyGridHeaderCell<T>(
            column: item,
            lastRowCell: i == widget.columns.length - 1,
          ),
        ));
      } else {
        rowList.add(SkyGridHeaderCell<T>(
          column: item,
          lastRowCell: i == widget.columns.length - 1,
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
