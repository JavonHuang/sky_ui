part of '../grid_table.dart';

class GridTableFixedLeft<T> extends StatefulWidget {
  const GridTableFixedLeft({
    super.key,
    required this.gridTableController,
    required this.loadFinish,
    required this.loading,
    required this.scrollController,
  });
  final GridTableController<T> gridTableController;
  final bool loadFinish;
  final bool loading;
  final ScrollController scrollController;
  @override
  _GridTableFixedLeftState<T> createState() => _GridTableFixedLeftState<T>();
}

class _GridTableFixedLeftState<T> extends State<GridTableFixedLeft<T>> {
  @override
  Widget build(BuildContext context) {
    if (widget.gridTableController.leftFixedColumnsWidth > 0) {
      return Column(
        children: [
          SkyGridHeader(
            columns: widget.gridTableController.leftFixedColumns,
            headerRowNum: widget.gridTableController.headerRowNum,
            isFixed: true,
            leftFixed: true,
            rightFixed: false,
            mergeHeaderColumn: widget.gridTableController.mergeHeaderColumn,
          ),
          Expanded(
            child: InfiniteScroll(
                loadFinish: widget.loadFinish,
                loading: widget.loading,
                data: widget.gridTableController.data,
                controller: widget.scrollController,
                scrollbars: false,
                loadMore: null,
                showTips: false,
                itemBuilder: (context, index) {
                  Widget a = Directionality(
                    textDirection: TextDirection.ltr,
                    child: SkyGridRow<T>(
                      rowRecord: widget.gridTableController.data[index],
                      columns: widget.gridTableController.leftFixedColumns,
                      rowIndex: index,
                      rowOnTab: widget.gridTableController.rowOnTab,
                      isFixed: true,
                      gridTableController: widget.gridTableController,
                    ),
                  );

                  final measureHeight = MeasureUtil.measureWidget(a).height;
                  // print(measureHeight);
                  widget.gridTableController.setRowHeihtMap(index, measureHeight);

                  return SkyGridRow<T>(
                    height: widget.gridTableController.getRowHeiht(index),
                    rowRecord: widget.gridTableController.data[index],
                    columns: widget.gridTableController.leftFixedColumns,
                    rowIndex: index,
                    rowOnTab: widget.gridTableController.rowOnTab,
                    isFixed: true,
                    gridTableController: widget.gridTableController,
                  );
                }),
          ),
          SkyGridFoot(
            columns: widget.gridTableController.leftFixedColumns,
            footerRowNum: widget.gridTableController.footerRowNum,
            isFixed: true,
            leftFixed: true,
            rightFixed: false,
            mergeFooterColumn: widget.gridTableController.mergeFooterColumn,
            footBoxSizeNotifier: FootBoxSizeNotifier(),
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
