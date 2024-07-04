library sky_grid_table;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sky_ui/src/sky/infinite_scroll/infinite_scroll.dart';
import 'package:sky_ui/src/styles/styles.dart';

part 'models/grid_table_column.dart';
part 'grid_table_default.dart';

part './widgets/grid_row.dart';
part './widgets/grid_cell.dart';
part './widgets/grid_header_row.dart';
part './widgets/grid_header_cell.dart';
part './widgets/grid_header.dart';

class SkyInfiniteGridTable<T> extends StatefulWidget {
  const SkyInfiniteGridTable({
    super.key,
    required this.data,
    required this.loadFinish,
    required this.columns,
    this.rowOnTab,
  });

  final List<T> data;
  final bool loadFinish;
  final List<SkyGridTableColumn<T>> columns;
  final Function(T e)? rowOnTab;

  @override
  SkyInfiniteGridTableState<T> createState() => SkyInfiniteGridTableState<T>();
}

class SkyInfiniteGridTableState<T> extends State<SkyInfiniteGridTable<T>> {
  double get totalWidth {
    double result = 0;
    for (SkyGridTableColumn<T> item in widget.columns) {
      result = result + (item.width ?? 0);
    }
    return result;
  }

  final innerController = ScrollController();

  Widget renderTable() {
    return Column(
      children: [
        SkyGridHeader(
          columns: widget.columns,
          rowNum: 1,
        ),
        Expanded(
          child: InfiniteScroll(
              loadFinish: widget.loadFinish,
              data: widget.data,
              itemBuilder: (context, index) {
                return SkyGridRow<T>(
                  rowRecord: widget.data[index],
                  columns: widget.columns,
                  rowIndex: index,
                );
              }),
        ),
      ],
    );
  }

  Widget renderTable2() {
    List<SkyGridTableColumn<T>> o = [];
    for (SkyGridTableColumn<T> item in widget.columns) {
      o.add(SkyGridTableColumn<T>(
        headerTitle: item.headerTitle,
        width: 50,
        itemBuilder: item.itemBuilder,
      ));
    }
    return Column(
      children: [
        SkyGridHeader(
          columns: o,
          rowNum: 1,
        ),
        Expanded(
          child: InfiniteScroll(
              loadFinish: widget.loadFinish,
              data: widget.data,
              itemBuilder: (context, index) {
                return SkyGridRow<T>(
                  rowRecord: widget.data[index],
                  columns: o,
                  rowIndex: index,
                );
              }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: SkyColors().baseBorder,
          width: 1,
        ),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return SkyGridTableDefault<T>(
          data: widget.data,
          loadFinish: widget.loadFinish,
          columns: widget.columns,
          rowOnTab: widget.rowOnTab,
          widthOverflow: constraints.maxWidth < totalWidth,
          totalWidth: totalWidth,
        );
        // if (constraints.maxWidth > totalWidth) {
        //   return renderTable();
        // } else {
        //   return Stack(
        //     children: [
        //       Scrollbar(
        //         controller: innerController,
        //         child: SingleChildScrollView(
        //           scrollDirection: Axis.horizontal,
        //           controller: innerController,
        //           child: SizedBox(width: totalWidth * 1.2, child: renderTable()),
        //         ),
        //       ),
        //       Positioned(
        //         top: 0,
        //         bottom: 0,
        //         right: 0,
        //         width: 200,
        //         child: Scrollbar(
        //           child: SingleChildScrollView(
        //             scrollDirection: Axis.horizontal,
        //             child: SizedBox(width: totalWidth * 1, child: renderTable2()),
        //           ),
        //         ),
        //       ),
        //     ],
        //   );
        // }
      }),
    );
  }
}
