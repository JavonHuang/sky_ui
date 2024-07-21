part of '../../sky_table.dart';

class SkyTableHeader<T> extends StatefulWidget {
  const SkyTableHeader({
    super.key,
    required this.gridTableController,
    required this.columns,
  });
  final TableController<T> gridTableController;
  final List<SkyTableColumn<T>> columns;

  @override
  _SkyTableHeader<T> createState() => _SkyTableHeader<T>();
}

class _SkyTableHeader<T> extends State<SkyTableHeader<T>> {
  @override
  Widget build(BuildContext context) {
    List<Widget> rowList = [];
    late List<Widget> mergeWidget = [];
    Widget a = Directionality(
      textDirection: TextDirection.ltr,
      child: SkyTableHeaderRow<T>(
        gridTableController: widget.gridTableController,
        columns: widget.gridTableController.columns,
        rowIndex: 0,
      ),
    );
    final height = MeasureUtil.measureWidget(a).height;

    for (int i = 0; i < widget.gridTableController.headerRowNum; i++) {
      rowList.add(SkyTableHeaderRow<T>(
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
