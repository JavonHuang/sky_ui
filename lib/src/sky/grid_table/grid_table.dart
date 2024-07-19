library sky_grid_table;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import '../../styles/styles.dart';
import '../infinite_scroll/infinite_scroll.dart';
import 'controller/grid_table_controller.dart';
import 'controller/scroll_controller.dart';
import 'core/measure_util.dart';
import 'notifier/foot_box_size_notifier.dart';
import 'notifier/height_notifier.dart';
import 'notifier/footer_height_notifier.dart';
import 'notifier/header_height_notifier.dart';
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
part './widgets/measure_size.dart';

class SkyInfiniteGridTable<T> extends StatefulWidget {
  const SkyInfiniteGridTable({
    super.key,
    required this.data,
    required this.loadFinish,
    required this.loading,
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
  final bool loading;
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
  GridTableController<T> _gridTableController = GridTableController<T>();

  @override
  void initState() {
    _gridTableController.initTable(
      columns: widget.columns,
      mergeHeaderColumn: widget.mergeHeaderColumn ?? [],
      mergeFooterColumn: widget.mergeFooterColumn ?? [],
      headerRowNum: widget.headerRowNum,
      footerRowNum: widget.footerRowNum,
    );
    _gridTableController.addListener(() {
      setState(() {});
    });
    super.initState();
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
        _gridTableController.setViewConstraints(constraints);
        if (_gridTableController.hasLeftFixed || _gridTableController.hasRightFixed) {
          return SkyTableFixed<T>(
            data: widget.data,
            gridTableController: _gridTableController,
            loadFinish: widget.loadFinish,
            loading: widget.loading,
            loadMore: widget.loadMore,
            columns: widget.columns,
            rowOnTab: widget.rowOnTab,
          );
        }
        return SkyGridTableDefault<T>(
          data: widget.data,
          loadFinish: widget.loadFinish,
          loading: widget.loading,
          loadMore: widget.loadMore,
          columns: widget.columns,
          rowOnTab: widget.rowOnTab,
          widthOverflow: _gridTableController.widthOverflow,
          totalWidth: _gridTableController.totalWidth,
          mergeHeaderColumn: widget.mergeHeaderColumn ?? [],
          mergeFooterColumn: widget.mergeFooterColumn ?? [],
          headerRowNum: widget.headerRowNum,
          footerRowNum: widget.footerRowNum,
          gridTableController: _gridTableController,
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
