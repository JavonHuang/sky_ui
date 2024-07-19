part of 'grid_table.dart';

class SkyTableFixed<T> extends StatefulWidget {
  const SkyTableFixed({
    super.key,
    required this.data,
    required this.gridTableController,
    required this.loadFinish,
    required this.loading,
    required this.columns,
    this.rowOnTab,
    this.loadMore,
  });
  final GridTableController<T> gridTableController;
  final List<T> data;
  final bool loadFinish;
  final bool loading;
  final List<SkyGridTableColumn<T>> columns;
  final Function(T e)? rowOnTab;
  final Function()? loadMore;

  @override
  _SkyTableFixedState<T> createState() => _SkyTableFixedState<T>();
}

class _SkyTableFixedState<T> extends State<SkyTableFixed<T>> {
  final HeightNotifier heightNotifier = HeightNotifier();
  final FooterHeightNotifier footerHeightNotifier = FooterHeightNotifier();
  final HeaderHeightNotifier headerHeightNotifier = HeaderHeightNotifier();

  final HeaderBoxSizeNotifier headerBoxSizeNotifier = HeaderBoxSizeNotifier();

  final innerController = ScrollController();

  LinkedScrollControllerGroup _controllers = LinkedScrollControllerGroup();

  // final GridListViewScrollController _gridListViewScrollController = GridListViewScrollController();
  late ScrollController _leftScrollController = _controllers.addAndGet(); // _gridListViewScrollController.createScrollController();
  late ScrollController scrollController = _controllers.addAndGet(); //_gridListViewScrollController.createScrollController();
  late ScrollController _rightScrollController = _controllers.addAndGet(); // _gridListViewScrollController.createScrollController();

  @override
  void initState() {
    super.initState();
  }

  Widget renderTable(
    List<SkyGridTableColumn<T>> defaultColumns,
    HeightNotifier heightNotifier,
    bool isFixed,
    ScrollController scrollController,
    bool scrollbars,
    bool leftFixed,
    bool rightFixed,
  ) {
    return Column(
      children: [
        SkyGridHeader(
          columns: defaultColumns,
          headerRowNum: widget.gridTableController.headerRowNum,
          headerHeightNotifier: headerHeightNotifier,
          isFixed: isFixed,
          leftFixed: leftFixed,
          rightFixed: rightFixed,
          mergeHeaderColumn: widget.gridTableController.mergeHeaderColumn,
          headerBoxSizeNotifier: headerBoxSizeNotifier,
        ),
        Expanded(
          child: InfiniteScroll(
              loadFinish: widget.loadFinish,
              loading: widget.loading,
              data: widget.data,
              controller: scrollController,
              scrollbars: scrollbars,
              loadMore: isFixed ? null : widget.loadMore,
              showTips: !isFixed,
              itemBuilder: (context, index) {
                Widget a = Directionality(
                  textDirection: TextDirection.ltr,
                  child: SkyGridRow<T>(
                    rowRecord: widget.data[index],
                    columns: widget.columns,
                    rowIndex: index,
                    rowOnTab: widget.rowOnTab,
                    heightNotifier: heightNotifier,
                    isFixed: isFixed,
                    gridTableController: widget.gridTableController,
                  ),
                );

                final measureHeight = MeasureUtil.measureWidget(a).height;
                print(measureHeight);
                widget.gridTableController.setRowHeihtMap(index, measureHeight);

                return SkyGridRow<T>(
                  height: widget.gridTableController.getRowHeiht(index),
                  rowRecord: widget.data[index],
                  columns: defaultColumns,
                  rowIndex: index,
                  rowOnTab: widget.rowOnTab,
                  heightNotifier: heightNotifier,
                  isFixed: isFixed,
                  gridTableController: widget.gridTableController,
                );
              }),
        ),
        SkyGridFoot(
          columns: defaultColumns,
          footerRowNum: widget.gridTableController.footerRowNum,
          footerHeightNotifier: footerHeightNotifier,
          isFixed: isFixed,
          leftFixed: leftFixed,
          rightFixed: rightFixed,
          mergeFooterColumn: widget.gridTableController.mergeFooterColumn,
          footBoxSizeNotifier: FootBoxSizeNotifier(),
        ),
      ],
    );
  }

  List<Widget> renderFixed(
    List<SkyGridTableColumn<T>> rightFixedColumns,
    double rightWidth,
    List<SkyGridTableColumn<T>> leftFixedColumns,
    double leftWidth,
    HeightNotifier heightNotifier,
  ) {
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
        child: renderTable(rightFixedColumns, heightNotifier, true, _rightScrollController, true, false, true),
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
        child: renderTable(leftFixedColumns, heightNotifier, true, _leftScrollController, false, true, false),
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
    List<SkyGridTableColumn<T>> rightFixedColumns = [];
    double rightFixedColumnsWidth = 0;
    List<SkyGridTableColumn<T>> leftFixedColumns = [];
    double leftFixedColumnsWidth = 0;

    List<SkyGridTableColumn<T>> defaultColumns = [];

    for (SkyGridTableColumn<T> e in widget.columns) {
      if (e.rightFixed) {
        rightFixedColumnsWidth += e.cellWidth!;
        rightFixedColumns.add(e);
      } else if (e.leftFixed) {
        leftFixedColumnsWidth += e.cellWidth!;
        leftFixedColumns.add(e);
      } else {
        defaultColumns.add(e);
      }
    }

    if (!widget.gridTableController.widthOverflow) {
      return Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: leftFixedColumnsWidth,
              ),
              Expanded(
                child: renderTable(
                  defaultColumns,
                  heightNotifier,
                  false,
                  scrollController,
                  rightFixedColumnsWidth == 0,
                  false,
                  false,
                ),
              ),
              SizedBox(
                width: rightFixedColumnsWidth,
              ),
            ],
          ),
          ...renderFixed(
            rightFixedColumns,
            rightFixedColumnsWidth,
            leftFixedColumns,
            leftFixedColumnsWidth,
            heightNotifier,
          ),
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
                    child: SizedBox(
                      width: widget.gridTableController.totalWidth,
                      child: renderTable(
                        defaultColumns,
                        heightNotifier,
                        false,
                        scrollController,
                        rightFixedColumnsWidth == 0,
                        false,
                        false,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: rightFixedColumnsWidth,
              ),
            ],
          ),
          ...renderFixed(
            rightFixedColumns,
            rightFixedColumnsWidth,
            leftFixedColumns,
            leftFixedColumnsWidth,
            heightNotifier,
          ),
        ],
      );
    }
  }
}
