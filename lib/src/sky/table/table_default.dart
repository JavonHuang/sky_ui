part of 'index.dart';

class TableDefault extends StatelessWidget {
  final SkyTableController controller;

  const TableDefault({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final innerController = ScrollController();

    return Column(children: [
      Expanded(
        child: ListView(
          children: controller.data
              .map((e) => SkyTableBodyRow(
                    rowData: e,
                    columns: controller.columns,
                  ))
              .toList(),
        ),
      )
    ]);
  }
}
