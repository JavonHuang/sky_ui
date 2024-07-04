part of '../grid_table.dart';

/// * text 文本渲染
/// * widgetTitle 自定义组件渲染
class HeaderTitle {
  final String? text;
  final Widget? widgetTitle;
  HeaderTitle({
    this.text,
    this.widgetTitle,
  });
}

/// * headerTitle 表头渲染
/// * itemBuilder 单元格渲染
/// * width 列宽
/// * flex 自适应
/// * rightFixed 右悬浮
/// * leftFixed 左悬浮
/// * cellOnTab 单元格点击
class SkyGridTableColumn<T> {
  final HeaderTitle headerTitle;
  final Widget Function(T value, int index) itemBuilder;
  final double? width;
  final bool flex;
  final bool rightFixed;
  final bool leftFixed;
  final Function(T e)? cellOnTab;
  SkyGridTableColumn({
    required this.headerTitle,
    required this.itemBuilder,
    this.width,
    this.flex = false,
    this.rightFixed = false,
    this.leftFixed = false,
    this.cellOnTab,
  });
}
