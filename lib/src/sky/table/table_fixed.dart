part of 'sky_table.dart';

class TableFixed<T> extends StatefulWidget {
  const TableFixed({
    super.key,
    required this.gridTableController,
    required this.loadFinish,
    required this.loading,
    this.loadMore,
  });
  final TableController<T> gridTableController;
  final bool loadFinish;
  final bool loading;
  final Function()? loadMore;

  @override
  _TableFixedState<T> createState() => _TableFixedState<T>();
}

class _TableFixedState<T> extends State<TableFixed<T>> {
  final GridListViewScrollController _gridListViewScrollController = GridListViewScrollController();
  late ScrollController _leftScrollController = _gridListViewScrollController.createScrollController();
  late ScrollController _scrollController = _gridListViewScrollController.createScrollController();
  late ScrollController _rightScrollController = _gridListViewScrollController.createScrollController();
  final innerController = ScrollController();

  Widget renderMain() {
    Widget w = Column(
      children: [
        SkyTableHeader(
          gridTableController: widget.gridTableController,
          columns: widget.gridTableController.mainColumns,
        ),
        SkyTableBody(
          gridTableController: widget.gridTableController,
          loadFinish: widget.loadFinish,
          loading: widget.loading,
          loadMore: widget.loadMore,
          columns: widget.gridTableController.mainColumns,
          scrollController: _scrollController,
          scrollbars: widget.gridTableController.rightFixedColumnsWidth == 0,
        ),
        SkyTableFooter(
          gridTableController: widget.gridTableController,
          columns: widget.gridTableController.mainColumns,
        ),
      ],
    );
    if (!widget.gridTableController.widthOverflow) {
      return Expanded(child: w);
    } else {
      return Expanded(
        child: Scrollbar(
          controller: innerController,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: innerController,
            child: SizedBox(
              width: widget.gridTableController.mainColumnsWidth,
              child: w,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: widget.gridTableController.leftFixedColumnsWidth,
            ),
            renderMain(),
            SizedBox(
              width: widget.gridTableController.rightFixedColumnsWidth,
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: 0,
          bottom: 0,
          width: widget.gridTableController.rightFixedColumnsWidth,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [SkyShadows.tbFixedRight],
            ),
            child: Column(
              children: [
                SkyTableHeader(
                  gridTableController: widget.gridTableController,
                  columns: widget.gridTableController.rightFixedColumns,
                ),
                SkyTableBody(
                  gridTableController: widget.gridTableController,
                  loadFinish: widget.loadFinish,
                  loading: widget.loading,
                  loadMore: widget.loadMore,
                  columns: widget.gridTableController.rightFixedColumns,
                  scrollController: _rightScrollController,
                  showTips: false,
                  scrollbars: true,
                ),
                SkyTableFooter(
                  gridTableController: widget.gridTableController,
                  columns: widget.gridTableController.rightFixedColumns,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          width: widget.gridTableController.leftFixedColumnsWidth,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [SkyShadows.tbFixedLeft],
            ),
            child: Column(
              children: [
                SkyTableHeader(
                  gridTableController: widget.gridTableController,
                  columns: widget.gridTableController.leftFixedColumns,
                ),
                SkyTableBody(
                  gridTableController: widget.gridTableController,
                  loadFinish: widget.loadFinish,
                  loading: widget.loading,
                  loadMore: null,
                  columns: widget.gridTableController.leftFixedColumns,
                  scrollController: _leftScrollController,
                  showTips: false,
                  scrollbars: false,
                ),
                SkyTableFooter(
                  gridTableController: widget.gridTableController,
                  columns: widget.gridTableController.leftFixedColumns,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _gridListViewScrollController.dispose();
    super.dispose();
  }
}
