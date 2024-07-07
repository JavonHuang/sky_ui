part of 'grid_table.dart';

class SkyTableFixed<T> extends StatelessWidget {
  const SkyTableFixed({
    super.key,
    required this.data,
    required this.loadFinish,
    required this.columns,
    this.rowOnTab,
    required this.widthOverflow,
    required this.totalWidth,
  });
  final List<T> data;
  final bool loadFinish;
  final List<SkyGridTableColumn<T>> columns;
  final Function(T e)? rowOnTab;
  final bool widthOverflow;
  final double totalWidth;

  Widget renderTable(List<SkyGridTableColumn<T>> defaultColumns, HeightNotifier heightNotifier, bool isFixed) {
    return Column(
      children: [
        SkyGridHeader(
          columns: defaultColumns,
          rowNum: 1,
          heightNotifier: heightNotifier,
          isFixed: isFixed,
        ),
        Expanded(
          child: InfiniteScroll(
              loadFinish: loadFinish,
              data: data,
              controller: GridListViewScrollController().createScrollController(),
              itemBuilder: (context, index) {
                return SkyGridRow<T>(
                  rowRecord: data[index],
                  columns: defaultColumns,
                  rowIndex: index,
                  rowOnTab: rowOnTab,
                  heightNotifier: heightNotifier,
                  isFixed: isFixed,
                );
              }),
        ),
      ],
    );
  }

  List<Widget> renderFixed(List<SkyGridTableColumn<T>> rightFixedColumns, double rightWidth, List<SkyGridTableColumn<T>> leftFixedColumns, double leftWidth, HeightNotifier heightNotifier) {
    Widget rightFixedWidget = Positioned(
      top: 0,
      right: 0,
      bottom: 0,
      width: rightWidth,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [SkyShadows.tbFixedRight],
        ),
        child: renderTable(rightFixedColumns, heightNotifier, true),
      ),
    );
    Widget leftFixedWidget = Positioned(
      top: 0,
      left: 0,
      bottom: 0,
      width: leftWidth,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [SkyShadows.tbFixedLeft],
        ),
        child: renderTable(leftFixedColumns, heightNotifier, true),
      ),
    );
    if (rightFixedColumns.isNotEmpty && leftFixedColumns.isNotEmpty) {
      return [
        rightFixedWidget,
        leftFixedWidget,
      ];
    }
    if (leftFixedColumns.isNotEmpty) {
      return [
        leftFixedWidget,
      ];
    }
    if (rightFixedColumns.isNotEmpty) {
      return [rightFixedWidget];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final HeightNotifier heightNotifier = HeightNotifier();
    final innerController = ScrollController();

    List<SkyGridTableColumn<T>> rightFixedColumns = [];
    double rightFixedColumnsWidth = 0;
    List<SkyGridTableColumn<T>> leftFixedColumns = [];
    double leftFixedColumnsWidth = 0;

    List<SkyGridTableColumn<T>> defaultColumns = [];

    for (SkyGridTableColumn<T> e in columns) {
      if (e.rightFixed) {
        rightFixedColumnsWidth += e.cellWidth!;
        rightFixedColumns.add(e);
      } else if (e.leftFixed) {
        e.width ??= 80;
        leftFixedColumnsWidth += e.cellWidth!;
        leftFixedColumns.add(e);
      } else {
        defaultColumns.add(e);
      }
    }

    if (!widthOverflow) {
      return Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: leftFixedColumnsWidth,
              ),
              Expanded(
                child: renderTable(defaultColumns, heightNotifier, false),
              ),
              SizedBox(
                width: rightFixedColumnsWidth,
              ),
            ],
          ),
          ...renderFixed(rightFixedColumns, rightFixedColumnsWidth, leftFixedColumns, leftFixedColumnsWidth, heightNotifier),
        ],
      );
    } else {
      return Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: leftFixedColumnsWidth,
              ),
              Expanded(
                child: Scrollbar(
                  controller: innerController,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: innerController,
                    child: SizedBox(width: totalWidth, child: renderTable(defaultColumns, heightNotifier, false)),
                  ),
                ),
              ),
              SizedBox(
                width: rightFixedColumnsWidth,
              ),
            ],
          ),
          ...renderFixed(rightFixedColumns, rightFixedColumnsWidth, leftFixedColumns, leftFixedColumnsWidth, heightNotifier),
        ],
      );
    }
  }
}
