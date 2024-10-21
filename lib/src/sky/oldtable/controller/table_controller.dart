part of '../sky_table.dart';

class TableController<T> extends ChangeNotifier {
  ///数据源
  late List<T> _data = [];
  List<T> get data => _data;

  ///列原始信息
  late List<SkyTableColumn<T>> _columns = [];
  List<SkyTableColumn<T>> get columns => _columns;

  ///表头合并信息
  late List<SkyMergeColumn> _mergeHeaderColumn = [];
  List<SkyMergeColumn> get mergeHeaderColumn => _mergeHeaderColumn;

  ///表尾合并信息
  late List<SkyMergeColumn> _mergeFooterColumn = [];
  List<SkyMergeColumn> get mergeFooterColumn => _mergeFooterColumn;

  ///表头行数
  late int _headerRowNum = 1;
  int get headerRowNum => _headerRowNum;

  ///表尾行数
  late int _footerRowNum = 1;
  int get footerRowNum => _footerRowNum;

  ///表格视窗大小
  late BoxConstraints _constraints = const BoxConstraints();
  BoxConstraints get constraints => _constraints;

  ///主表格列信息
  late List<SkyTableColumn<T>> _mainColumns = [];
  List<SkyTableColumn<T>> get mainColumns => _mainColumns;

  ///主表格列宽度
  late double _mainColumnsWidth = 0;
  double get mainColumnsWidth => _mainColumnsWidth;

  ///右冻结信息
  late List<SkyTableColumn<T>> _rightFixedColumns = [];
  List<SkyTableColumn<T>> get rightFixedColumns => _rightFixedColumns;

  ///右冻结宽度
  late double _rightFixedColumnsWidth = 0;
  double get rightFixedColumnsWidth => _rightFixedColumnsWidth;

  ///做冻结列信息
  late List<SkyTableColumn<T>> _leftFixedColumns = [];
  List<SkyTableColumn<T>> get leftFixedColumns => _leftFixedColumns;

  ///左冻结宽度
  late double _leftFixedColumnsWidth = 0;
  double get leftFixedColumnsWidth => _leftFixedColumnsWidth;

  ///总宽度
  late double _totalWidth = 0;
  double get totalWidth => _totalWidth;

  ///宽度超出视窗宽度
  bool get widthOverflow => _constraints.maxWidth < _totalWidth;

  ///获取模拟渲染宽度 -1-left；0-main；1-right
  double getRenderWidth(int type) {
    if (type == -1) {
      return _leftFixedColumnsWidth;
    } else if (type == 0) {
      return _mainColumnsWidth;
    } else {
      return _rightFixedColumnsWidth;
    }
  }

  ///是否存在冻结列
  late bool _hasFixed = false;
  bool get hasFixed => _hasFixed;

  ///表头单元格大小Map集合
  late Map<String, Size> _headerCellSizeMap = {};
  Map<String, Size> get headerCellSizeMap => _headerCellSizeMap;

  ///表尾单元格Map集合
  late Map<String, Size> _footerCellSizeMap = {};
  Map<String, Size> get footerCellSizeMap => _footerCellSizeMap;

  ///表格内事件广播
  final skyTableEventStreamController = StreamController<SkyTableEvent>.broadcast();

  ///行点击事件
  Function(T e, int index)? _rowOnTab;
  Function(T e, int index)? get rowOnTab => _rowOnTab;

  ///排序信息
  late Map<String, String> _sortMap = {};
  Map<String, String> get sortMap => _sortMap;

  ///列边框
  late bool _border = true;
  bool get border => _border;

  ///初始化信息
  void initTable({
    required List<SkyTableColumn<T>> columns,
    required List<SkyMergeColumn> mergeHeaderColumn,
    required List<SkyMergeColumn> mergeFooterColumn,
    required int headerRowNum,
    required int footerRowNum,
    required List<T> data,
    required Function(T e, int index)? rowOnTab,
    required bool border,
  }) {
    clearAll();
    _columns = columns;
    _mergeHeaderColumn = mergeHeaderColumn;
    _mergeFooterColumn = mergeFooterColumn;
    _headerRowNum = headerRowNum;
    _footerRowNum = footerRowNum;
    _data = data;
    _rowOnTab = rowOnTab;
    _border = border;
    for (SkyTableColumn<T> item in _columns) {
      _totalWidth += item.cellWidth;
      if (item.leftFixed) {
        _hasFixed = true;
        _leftFixedColumns.add(item);
        _leftFixedColumnsWidth += item.cellWidth;
      } else if (item.rightFixed) {
        _hasFixed = true;
        _rightFixedColumns.add(item);
        _rightFixedColumnsWidth += item.cellWidth;
      } else {
        _mainColumns.add(item);
        _mainColumnsWidth += item.cellWidth;
      }
    }
    notifyListeners();
  }

  ///清空所有信息
  void clearAll() {
    _columns = [];
    _mergeHeaderColumn = [];
    _mergeFooterColumn = [];
    _headerRowNum = 0;
    _footerRowNum = 0;
    _data = [];
    _rowOnTab = null;
    _totalWidth = 0;
    _hasFixed = false;
    _leftFixedColumns = [];
    _leftFixedColumnsWidth = 0;
    _rightFixedColumns = [];
    _rightFixedColumnsWidth = 0;
    _mainColumns = [];
    _mainColumnsWidth = 0;
    _headerCellSizeMap = {};
    _sortMap = {};
    _border = true;
  }

  ///设置数据源
  void setData(List<T> e) {
    _data = e;
    notifyListeners();
  }

  ///设置视窗盒子信息
  void setViewConstraints(BoxConstraints e) {
    _constraints = e;
  }

  ///更新表头单元格盒子大小
  void updateHeaderCellSize(String columnkey, int rowIndex, Size s) {
    _headerCellSizeMap['$columnkey-($rowIndex)'] = s;
  }

  ///获取表头单元格盒子大小
  Size getHeaderCellSize(String columnkey, int rowIndex) {
    return _headerCellSizeMap['$columnkey-($rowIndex)'] ?? const Size(0, 0);
  }

  ///更新表尾单元格盒子大小
  void updateFooterCellSize(String columnkey, int rowIndex, Size s) {
    _footerCellSizeMap['$columnkey-($rowIndex)'] = s;
  }

  ///获取表尾单元格盒子大小
  Size getFooterCellSize(String columnkey, int rowIndex) {
    return _footerCellSizeMap['$columnkey-($rowIndex)'] ?? const Size(0, 0);
  }

  ///更新排序信息
  void updateSortMap(String columnkey, String orderBy) {
    _sortMap[columnkey] = orderBy;
  }

  ///获取排序信息
  String getSortMap(String columnkey) {
    return _sortMap[columnkey] ?? '';
  }

  ///清空排序信息
  void clearSort() {
    skyTableEventStreamController.add(SkyTableEvent(key: GenerateUuid.keyV1(), eventName: SkyTableEventType.sort, value: ""));
  }
}
