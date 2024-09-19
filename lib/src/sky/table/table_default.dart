part of 'sky_table.dart';

class TableDefault<T> extends StatefulWidget {
  const TableDefault({
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
  _TableDefaultState<T> createState() => _TableDefaultState<T>();
}

class _TableDefaultState<T> extends State<TableDefault<T>> {
  final innerController = ScrollController();

  @override
  Widget build(BuildContext context) {
    if (!widget.gridTableController.widthOverflow) {
      return Column(
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
          ),
          SkyTableFooter(
            gridTableController: widget.gridTableController,
            columns: widget.gridTableController.mainColumns,
          ),
        ],
      );
    } else {
      return Scrollbar(
        controller: innerController,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: innerController,
          child: SizedBox(
            width: widget.gridTableController.totalWidth,
            child: Column(
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
                ),
                SkyTableFooter(
                  gridTableController: widget.gridTableController,
                  columns: widget.gridTableController.mainColumns,
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
