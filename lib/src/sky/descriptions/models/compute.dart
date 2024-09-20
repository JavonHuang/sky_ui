import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import '../../table/core/measure_util.dart';

class Compute {
  final List<DescriptionsItem> children;
  final int column;
  final SkySize size;
  Compute({
    required this.children,
    required this.column,
    required this.size,
  });

  late Axis axis = Axis.horizontal;

  Widget createLable(double? width, dynamic w, bool border, DescriptionsItem item) {
    Color borderColor = border ? SkyColors().lighterBorder : SkyColors().transparent;

    Widget lable;
    if (w.runtimeType == String) {
      lable = Text(
        w ?? '',
        style: TextStyle(
          color: SkyColors().secondaryText,
        ),
      );
    } else {
      lable = w;
    }
    return Container(
      width: border ? (width != null ? width + 4 : width) : null,
      decoration: BoxDecoration(
        color: border ? (item.bgLabelColor ?? SkyColors().tableRowBg) : null,
        border: Border(
          right: axis == Axis.horizontal ? BorderSide(width: 1, color: borderColor) : BorderSide.none,
          bottom: axis == Axis.horizontal ? BorderSide.none : BorderSide(width: 1, color: borderColor),
        ),
      ),
      padding: size.descriptionsPadding(border: border),
      child: lable,
    );
  }

  Map<int, double> labelMapWidth = {};

  double columnLabelWidth(int index) {
    return labelMapWidth[index]!;
  }

  void columnLabelMaxWidth(int index, double width) {
    if (labelMapWidth[index] == null) {
      labelMapWidth[index] = width;
    }
    if (width > labelMapWidth[index]!) {
      labelMapWidth[index] = width;
    }
  }

  List<List<DescriptionsItem>> get renderRow {
    int flex = 0;
    List<List<DescriptionsItem>> result = [];
    List<DescriptionsItem> row = [];
    for (DescriptionsItem item in children) {
      double itemLabelWidth = item.width ?? _measureWidth(item.label ?? item.labelWidget, item);
      if ((flex + item.span) <= column) {
        columnLabelMaxWidth(row.length, itemLabelWidth);
        row.add(item);
        flex += item.span;
      } else {
        columnLabelMaxWidth(row.length, itemLabelWidth);
        DescriptionsItem newItem = item.copy();
        newItem.span = 1;
        row.add(newItem);
        flex += 1;
      }
      if (flex == column) {
        flex = 0;
        result.add(row);
        row = [];
      }
      if (item == children.last) {
        if (flex != column && row.isNotEmpty) {
          DescriptionsItem nlast = row.last.copy();
          nlast.span = nlast.span + (column - flex);
          row.removeLast();
          row.add(nlast);
        }
        result.add(row);
        row = [];
      }
    }
    return result;
  }

  double _measureWidth(dynamic w, DescriptionsItem item) {
    if (w.runtimeType == String) {
      Widget cc = Directionality(
        textDirection: TextDirection.ltr,
        child: createLable(null, w, true, item),
      );
      return MeasureUtil.measureWidget(cc).width;
    } else {
      Widget cc = Directionality(
        textDirection: TextDirection.ltr,
        child: createLable(null, w, true, item),
      );
      return MeasureUtil.measureWidget(cc).width;
    }
  }
}
