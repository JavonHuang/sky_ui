part of './../sky_table.dart';

class SkyMergeColumn<T> {
  final String key;
  final WidgetTitle title;
  final List<int> start;
  final List<int> end;
  final Function(String orderBy, List<SkyTableColumn<T>> e)? onSort;

  SkyMergeColumn({
    required this.title,
    required this.start,
    required this.end,
    this.onSort,
  }) : key = GenerateUuid.keyV1();
}
