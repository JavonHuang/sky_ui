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
  LinkedScrollControllerGroup _controllers = LinkedScrollControllerGroup();

  late ScrollController _leftScrollController = _controllers.addAndGet();
  late ScrollController _scrollController = _controllers.addAndGet();
  late ScrollController _rightScrollController = _controllers.addAndGet();

  final innerController = ScrollController();
  List<BoxShadow> leftFixedBoxShadow = [];
  List<BoxShadow> rightFixedBoxShadow = [];
  late String pixels = 'min';

  @override
  void initState() {
    super.initState();
    innerController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (widget.gridTableController.widthOverflow) {
      late String newPixels = '';
      if (innerController.position.pixels == innerController.position.maxScrollExtent) {
        newPixels = 'max';
      } else if (innerController.position.pixels == 0) {
        newPixels = 'min';
      } else {
        newPixels = 'normal';
      }
      if (newPixels != pixels) {
        setState(() {
          pixels = newPixels;
        });
      }
    }
  }

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

  BoxBorder? get rightBorder {
    if (widget.gridTableController.border) {
      return Border(
        left: BorderSide(
          color: rightFixedBoxShadow.isEmpty ? SkyColors().baseBorder : Colors.transparent,
          width: 1,
        ),
      );
    }
    return null;
  }

  BoxBorder? get leftBorder {
    if (widget.gridTableController.border) {
      return Border(
        right: BorderSide(
          color: leftFixedBoxShadow.isEmpty ? SkyColors().baseBorder : Colors.transparent,
          width: 1,
        ),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.gridTableController.widthOverflow) {
      if (pixels == 'normal') {
        leftFixedBoxShadow = [SkyShadows.tbFixedLeft];
        rightFixedBoxShadow = [SkyShadows.tbFixedRight];
      } else if (pixels == 'min') {
        leftFixedBoxShadow = [];
        rightFixedBoxShadow = [SkyShadows.tbFixedRight];
      } else {
        leftFixedBoxShadow = [SkyShadows.tbFixedLeft];
        rightFixedBoxShadow = [];
      }
    } else {
      leftFixedBoxShadow = [];
      rightFixedBoxShadow = [];
    }
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
          width: widget.gridTableController.rightFixedColumnsWidth + 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: rightFixedBoxShadow,
              border: rightBorder,
            ),
            child: Column(
              children: [
                SkyTableHeader(
                  gridTableController: widget.gridTableController,
                  columns: widget.gridTableController.rightFixedColumns,
                  type: 1,
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
                  type: 1,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          bottom: 0,
          width: widget.gridTableController.leftFixedColumnsWidth + 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: leftFixedBoxShadow,
              border: leftBorder,
            ),
            child: Column(
              children: [
                SkyTableHeader(
                  gridTableController: widget.gridTableController,
                  columns: widget.gridTableController.leftFixedColumns,
                  type: -1,
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
                  type: -1,
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
    innerController.removeListener(_scrollListener);
    innerController.dispose();
    super.dispose();
  }
}
