part of '../grid_table.dart';

class GridMergeHeaderColumn {
  final HeaderTitle headerTitle;
  final List<int> start;
  final List<int> end;
  GridMergeHeaderColumn({
    required this.headerTitle,
    required this.start,
    required this.end,
  });
}
