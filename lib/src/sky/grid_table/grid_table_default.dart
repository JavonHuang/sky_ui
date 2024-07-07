part of 'grid_table.dart';

class SkyGridTableDefault<T> extends StatelessWidget {
  const SkyGridTableDefault({
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

  Widget renderTable() {
    return Column(
      children: [
        SkyGridHeader(
          columns: columns,
          rowNum: 1,
          isFixed: false,
        ),
        Expanded(
          child: InfiniteScroll(
              loadFinish: loadFinish,
              data: data,
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
