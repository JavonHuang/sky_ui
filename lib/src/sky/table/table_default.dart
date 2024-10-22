part of 'index.dart';

class TableDefault extends StatelessWidget {
  const TableDefault({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SkyTableController controller = SkyTable.maybeOf(context)!.controller;
    final innerController = ScrollController();

    if (controller.widthOverflow) {
      return Scrollbar(
        controller: innerController,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: innerController,
          child: SizedBox(
            width: controller.columnWidth,
            child: Column(
              children: [
                HeaderRow(),
                SkyTableBodyRow(),
              ],
            ),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HeaderRow(),
        SkyTableBodyRow(),
      ],
    );
  }
}
