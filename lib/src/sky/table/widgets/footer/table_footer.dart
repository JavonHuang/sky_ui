part of '../../sky_table.dart';

class SkyTableFooter<T> extends StatefulWidget {
  const SkyTableFooter({
    super.key,
    required this.gridTableController,
    required this.columns,
  });
  final TableController<T> gridTableController;
  final List<SkyTableColumn<T>> columns;

  @override
  _SkyTableFooter<T> createState() => _SkyTableFooter<T>();
}

class _SkyTableFooter<T> extends State<SkyTableFooter<T>> {
  @override
  Widget build(BuildContext context) {
    List<Widget> rowList = [];
    late List<Widget> mergeWidget = [];
    Widget a = Directionality(
      textDirection: TextDirection.ltr,
      child: SkyTableFooterRow<T>(
        gridTableController: widget.gridTableController,
        columns: widget.gridTableController.columns,
        rowIndex: 0,
      ),
    );
    final height = MeasureUtil.measureWidget(a).height;

    for (int i = 0; i < widget.gridTableController.footerRowNum; i++) {
      rowList.add(SkyTableFooterRow<T>(
        height: height,
        gridTableController: widget.gridTableController,
        rowIndex: i,
        columns: widget.columns,
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
