library sky_grid_table;

import 'package:flutter/material.dart';
import 'package:sky_ui/src/sky/infinite_scroll/infinite_scroll.dart';
import 'package:sky_ui/src/styles/styles.dart';

import 'controller/scroll_controller.dart';
import 'notifier/foot_box_size_notifier.dart';
import 'notifier/height_notifier.dart';
import 'notifier/header_box_size_notifier.dart';

part 'models/grid_table_column.dart';
part 'models/grid_merge_header_column.dart';
part 'models/grid_merge_footer_column.dart';

part 'styles.dart';
part 'grid_table_default.dart';
part 'grid_table_fixed.dart';
part './widgets/grid_row.dart';
part './widgets/grid_cell.dart';
part './widgets/grid_header_row.dart';
part './widgets/grid_header_cell.dart';
part './widgets/grid_header.dart';
part './widgets/hover_row.dart';
part './widgets/grid_foot.dart';
part './widgets/grid_foot_row.dart';
part './widgets/grid_foot_cell.dart';

class SkyInfiniteGridTable<T> extends StatefulWidget {
  const SkyInfiniteGridTable({
    super.key,
    required this.data,
    required this.loadFinish,
    required this.columns,
    this.rowOnTab,
    this.mergeHeaderColumn,
    this.mergeFooterColumn,
    this.headerRowNum = 1,
    this.footerRowNum = 0,
    this.loadMore,
  });

  final List<T> data;
  final bool loadFinish;
  final List<SkyGridTableColumn<T>> columns;
  final Function(T e)? rowOnTab;
  final List<GridMergeHeaderColumn>? mergeHeaderColumn;
  final List<GridMergeFooterColumn>? mergeFooterColumn;
  final int headerRowNum;
  final int footerRowNum;
  final Function()? loadMore;

  @override
  SkyInfiniteGridTableState<T> createState() => SkyInfiniteGridTableState<T>();
}

class SkyInfiniteGridTableState<T> extends State<SkyInfiniteGridTable<T>> {
  double get totalWidth {
    double result = 0;
    for (SkyGridTableColumn<T> item in widget.columns) {
      result = result + (item.cellWidth ?? 0);
    }
    return result;
  }

  bool get hasRightFixed {
    return widget.columns.any((e) {
      return e.rightFixed;
    });
  }

  bool get hasLeftFixed {
    return widget.columns.any((e) {
      return e.leftFixed;
    });
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
        if (hasLeftFixed || hasRightFixed) {
          return SkyTableFixed<T>(
            data: widget.data,
            loadFinish: widget.loadFinish,
            loadMore: widget.loadMore,
            columns: widget.columns,
            rowOnTab: widget.rowOnTab,
            widthOverflow: constraints.maxWidth < totalWidth,
            totalWidth: totalWidth,
            mergeHeaderColumn: widget.mergeHeaderColumn ?? [],
            mergeFooterColumn: widget.mergeFooterColumn ?? [],
            headerRowNum: widget.headerRowNum,
            footerRowNum: widget.footerRowNum,
          );
        }
        return SkyGridTableDefault<T>(
          data: widget.data,
          loadFinish: widget.loadFinish,
          loadMore: widget.loadMore,
          columns: widget.columns,
          rowOnTab: widget.rowOnTab,
          widthOverflow: constraints.maxWidth < totalWidth,
          totalWidth: totalWidth,
          mergeHeaderColumn: widget.mergeHeaderColumn ?? [],
          mergeFooterColumn: widget.mergeFooterColumn ?? [],
          headerRowNum: widget.headerRowNum,
          footerRowNum: widget.footerRowNum,
        );
      }),
    );
  }

  @override
  void dispose() {
    GridListViewScrollController().dispose();
    super.dispose();
  }
}
