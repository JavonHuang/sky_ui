part of 'grid_table.dart';

class SkyGridTableDefault<T> extends StatelessWidget {
  const SkyGridTableDefault({
    super.key,
    required this.data,
    required this.loadFinish,
    required this.loading,
    required this.columns,
    this.rowOnTab,
    required this.widthOverflow,
    required this.totalWidth,
    required this.mergeHeaderColumn,
    required this.mergeFooterColumn,
    required this.headerRowNum,
    required this.footerRowNum,
    this.loadMore,
  });
  final List<T> data;
  final bool loadFinish;
  final bool loading;
  final List<SkyGridTableColumn<T>> columns;
  final Function(T e)? rowOnTab;
  final bool widthOverflow;
  final double totalWidth;
  final List<GridMergeHeaderColumn> mergeHeaderColumn;
  final List<GridMergeFooterColumn> mergeFooterColumn;
  final int headerRowNum;
  final int footerRowNum;
  final Function()? loadMore;

  Widget renderTable() {
    return Column(
      children: [
        SkyGridHeader(
          columns: columns,
          headerRowNum: headerRowNum,
          isFixed: false,
          leftFixed: false,
          rightFixed: false,
          mergeHeaderColumn: mergeHeaderColumn,
          headerBoxSizeNotifier: HeaderBoxSizeNotifier(),
        ),
        Expanded(
          child: InfiniteScroll(
              loadFinish: loadFinish,
              loading: loading,
              data: data,
              loadMore: loadMore,
              itemBuilder: (context, index) {
                return SkyGridRow<T>(
                  rowRecord: data[index],
                  columns: columns,
                  rowIndex: index,
                  rowOnTab: rowOnTab,
                  isFixed: false,
                );
              }),
        ),
        SkyGridFoot(
          columns: columns,
          footerRowNum: footerRowNum,
          isFixed: false,
          leftFixed: false,
          rightFixed: false,
          mergeFooterColumn: mergeFooterColumn,
          footBoxSizeNotifier: FootBoxSizeNotifier(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final innerController = ScrollController();

    if (!widthOverflow) {
      return renderTable();
    } else {
      return Stack(
        children: [
          Scrollbar(
            controller: innerController,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: innerController,
              child: SizedBox(width: totalWidth, child: renderTable()),
            ),
          ),
        ],
      );
    }
  }
}
