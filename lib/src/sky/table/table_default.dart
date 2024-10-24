part of 'index.dart';

class TableDefault extends StatelessWidget {
  const TableDefault({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SkyTableController controller = SkyTable.maybeOf(context)!.controller;
    final innerController = ScrollController();

    Widget tableBody = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HeaderRow(columns: controller.showColumns),
        SkyTableBodyContent(
          columns: controller.showColumns,
          scrollController: controller._scrollController,
          content: true,
          controller: controller,
        ),
      ],
    );
    if (controller.widthOverflow) {
      tableBody = Scrollbar(
        controller: innerController,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: innerController,
          child: SizedBox(
            width: controller.columnWidth,
            child: tableBody,
          ),
        ),
      );
    }

    if (controller.hasFixed) {
      tableBody = Stack(
        children: [
          tableBody,
          if (controller.fixedRightColumns.isNotEmpty)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: controller.fixedRightColumnsWidth,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HeaderRow(columns: controller.fixedRightColumns),
                    SkyTableBodyContent(
                      columns: controller.fixedRightColumns,
                      scrollController: controller._rightScrollController,
                      controller: controller,
                    ),
                  ],
                ),
              ),
            ),
          if (controller.fixedLeftColumns.isNotEmpty)
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: controller.fixedLeftColumnsWidth,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HeaderRow(columns: controller.fixedLeftColumns),
                    SkyTableBodyContent(
                      columns: controller.fixedLeftColumns,
                      scrollController: controller._leftScrollController,
                      controller: controller,
                      scrollbars: false,
                    ),
                  ],
                ),
              ),
            ),
        ],
      );
    }

    return tableBody;
  }
}
