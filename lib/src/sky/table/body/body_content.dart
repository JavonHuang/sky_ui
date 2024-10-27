import 'dart:async';
import 'package:flutter/material.dart';
import '../../common/generate_uuid.dart';
import '../core/measure_util.dart';
import '../index.dart';
import '../model/sky_table_event.dart';
import 'body_row.dart';

class SkyTableBodyContent extends StatefulWidget {
  final List<SkyTableColumn> columns;
  final ScrollController? scrollController;
  final bool content;

  final SkyTableController controller;
  final bool scrollbars;
  const SkyTableBodyContent({
    super.key,
    required this.columns,
    this.scrollController,
    this.content = false,
    required this.controller,
    this.scrollbars = true,
  });
  @override
  State<SkyTableBodyContent> createState() => _SkyTableBodyContentState();
}

class _SkyTableBodyContentState extends State<SkyTableBodyContent> {
  final String keyId = GenerateUuid.keyV1();
  late final StreamSubscription<SkyTableEvent> _listener;
  late bool trackVisibility = false;
  @override
  void initState() {
    super.initState();
    if (widget.scrollbars) {
      _listener = widget.controller.skyTableEventStreamController.stream.listen((_) {
        if (_.eventName == SkyTableEventType.contentHover && _.key != keyId) {
          if (_.value && !trackVisibility) {
            setState(() {
              trackVisibility = _.value;
            });
          }
          if (!_.value && trackVisibility) {
            setState(() {
              trackVisibility = false;
            });
          }
        }
      });
    }
  }

  @override
  void dispose() {
    if (widget.scrollbars) {
      _listener.pause();
      _listener.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget body = ListView.builder(
      shrinkWrap: true,
      primary: false,
      controller: widget.scrollController,
      itemCount: widget.controller.data.length,
      itemBuilder: (context, index) {
        if (index == widget.controller.data.length - 1 && widget.controller.loadFinish != null && widget.content) {
          scheduleMicrotask(() {
            widget.controller.loadFinish?.call(widget.controller);
          });
        }
        double? height = 0;
        Widget rowWidget = SkyTableBodyRow(
          rowIndex: index,
          columns: widget.controller.showColumns,
          controller: widget.controller,
          compute: true,
        );
        // if (widget.content) {
        height = MeasureUtil.measureWidget(Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(width: widget.controller.columnWidth, child: rowWidget),
        )).height;
        widget.controller.setRowHeight(index, height);
        // } else {
        //   height = widget.controller.getRowHeight(index);
        // }

        return SizedBox(
          height: height,
          child: SkyTableBodyRow(
            rowIndex: index,
            columns: widget.columns,
            controller: widget.controller,
          ),
        );
      },
    );
    if (widget.scrollbars) {
      body = Scrollbar(
        interactive: false,
        // trackVisibility: trackVisibility,
        thumbVisibility: trackVisibility,
        controller: widget.scrollController,
        child: body,
      );
    } else {
      body = ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: widget.scrollbars),
        child: body,
      );
    }
    return Expanded(
      child: MouseRegion(
        onEnter: (e) {
          widget.controller.skyTableEventStreamController.add(SkyTableEvent(key: keyId, eventName: SkyTableEventType.contentHover, value: true));
        },
        onExit: (e) {
          widget.controller.skyTableEventStreamController.add(SkyTableEvent(key: keyId, eventName: SkyTableEventType.contentHover, value: false));
        },
        child: body,
      ),
    );
  }
}
