part of './../sky_table.dart';

/// * headerTitle 表头渲染
/// * itemBuilder 单元格渲染
/// * width 列宽
/// * flex 自适应
/// * rightFixed 右悬浮
/// * leftFixed 左悬浮
/// * cellOnTab 单元格点击
class SkyTableColumn<T> {
  final String key;
  final WidgetTitle headerTitle;
  final WidgetTitle? footerTitle;
  final Widget Function(T value, int index) itemBuilder;
  late double? width;
  final bool flex;
  final bool rightFixed;
  final bool leftFixed;
  final Function(T e, int index)? cellOnTab;
  final double cellWidth;
  final Widget? Function(int index)? itemFooterBuilder;
  final Widget? Function(int index)? itemHeaderBuilder;
  final Function(String orderBy, SkyTableColumn<T> e)? onSort;
  SkyTableColumn({
    required this.headerTitle,
    this.footerTitle,
    required this.itemBuilder,
    this.width,
    this.flex = false,
    this.rightFixed = false,
    this.leftFixed = false,
    this.cellOnTab,
    this.itemFooterBuilder,
    this.itemHeaderBuilder,
    this.onSort,
  })  : assert(!(flex && width != null), 'When flex is true, width does not need to be assigned'),
        cellWidth = !flex && width == null ? 80 : width ?? 80,
        key = GenerateUuid.keyV1();
}
