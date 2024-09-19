import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../common/generate_uuid.dart';
import '../common/measure_size.dart';
import 'controller/linked_scroll_controller.dart';
import 'core/measure_util.dart';
import 'widgets/icon/sort_icon.dart';

part './controller/table_controller.dart';

part 'models/sky_table_event.dart';
part 'models/Widget_title.dart';
part 'models/merge_column.dart';
part 'models/table_column.dart';

part 'widgets/header/table_header_cell.dart';
part 'widgets/header/table_header_row.dart';
part 'widgets/header/table_header.dart';

part 'widgets/footer/table_footer_cell.dart';
part 'widgets/footer/table_footer_row.dart';
part 'widgets/footer/table_footer.dart';

part 'widgets/body/table_cell.dart';
part 'widgets/body/table_row.dart';
part 'widgets/body/table_body.dart';

part 'table_fixed.dart';
part 'table_default.dart';

part 'styles.dart';

class SkyTable<T> extends StatefulWidget {
  const SkyTable({
    super.key,
    required this.columns,
    required this.data,
    required this.loadFinish,
    required this.loading,
    this.loadMore,
    required this.tableController,
    this.mergeHeaderColumn,
    this.mergeFooterColumn,
    this.rowOnTab,
    this.headerRowNum = 1,
    this.footerRowNum = 0,
    this.border = true,
  });
  final List<T> data;
  final List<SkyTableColumn<T>> columns;
  final bool loadFinish;
  final bool loading;
  final Function()? loadMore;
  final TableController<T> tableController;
  final List<SkyMergeColumn>? mergeHeaderColumn;
  final List<SkyMergeColumn>? mergeFooterColumn;
  final Function(T e, int index)? rowOnTab;
  final int headerRowNum;
  final int footerRowNum;
  final bool border;

  @override
  SkyTableState<T> createState() => SkyTableState<T>();
}

class SkyTableState<T> extends State<SkyTable<T>> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    widget.tableController.initTable(
      columns: widget.columns,
      mergeHeaderColumn: widget.mergeHeaderColumn ?? [],
      mergeFooterColumn: widget.mergeFooterColumn ?? [],
      headerRowNum: widget.headerRowNum,
      footerRowNum: widget.footerRowNum,
      data: widget.data,
      rowOnTab: widget.rowOnTab,
      border: widget.border,
    );
    widget.tableController.skyTableEventStreamController.add(SkyTableEvent(key: GenerateUuid.keyV1(), eventName: SkyTableEventType.sort, value: ""));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: widget.tableController.border
            ? Border.all(
                color: SkyColors().baseBorder,
                width: 1,
              )
            : null,
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        widget.tableController.setViewConstraints(constraints);
        if (widget.tableController.hasFixed) {
          return TableFixed(
            gridTableController: widget.tableController,
            loadFinish: widget.loadFinish,
            loading: widget.loading,
            loadMore: widget.loadMore,
          );
        } else {
          return TableDefault(
            gridTableController: widget.tableController,
            loadFinish: widget.loadFinish,
            loading: widget.loading,
            loadMore: widget.loadMore,
          );
        }
      }),
    );
  }
}
