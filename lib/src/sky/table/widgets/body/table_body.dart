part of '../../sky_table.dart';

class SkyTableBody<T> extends StatefulWidget {
  const SkyTableBody({
    super.key,
    required this.gridTableController,
    required this.loadFinish,
    required this.loading,
    this.loadMore,
    required this.columns,
    this.scrollController,
    this.showTips = true,
    this.scrollbars = true,
  });
  final TableController<T> gridTableController;
  final bool loadFinish;
  final bool loading;
  final Function()? loadMore;
  final List<SkyTableColumn<T>> columns;
  final ScrollController? scrollController;
  final bool showTips;
  final bool scrollbars;
  @override
  _SkyTableBody<T> createState() => _SkyTableBody<T>();
}

class _SkyTableBody<T> extends State<SkyTableBody<T>> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InfiniteScroll(
        loadFinish: widget.loadFinish,
        loading: widget.loading,
        data: widget.gridTableController.data,
        loadMore: widget.loadMore,
        controller: widget.scrollController,
        showTips: widget.showTips,
        scrollbars: widget.scrollbars,
        itemBuilder: (context, index) {
          Widget a = Directionality(
            textDirection: TextDirection.ltr,
            child: SizedBox(
              width: widget.gridTableController.getRenderWidth(0),
              child: SkyTableRow<T>(
                rowRecord: widget.gridTableController.data[index],
                columns: widget.gridTableController.columns,
                rowIndex: index,
                gridTableController: widget.gridTableController,
              ),
            ),
          );
          final height = MeasureUtil.measureWidget(a).height;
          return SkyTableRow<T>(
            gridTableController: widget.gridTableController,
            rowRecord: widget.gridTableController.data[index],
            rowIndex: index,
            columns: widget.columns,
            height: height,
          );
        },
      ),
    );
  }
}
