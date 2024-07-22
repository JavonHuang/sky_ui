part of './../sky_table.dart';

class TableController<T> extends ChangeNotifier {
  late List<T> _data = [];
  List<T> get data => _data;

  late List<SkyTableColumn<T>> _columns = [];
  List<SkyTableColumn<T>> get columns => _columns;

  late List<SkyMergeColumn> _mergeHeaderColumn = [];
  List<SkyMergeColumn> get mergeHeaderColumn => _mergeHeaderColumn;

  late List<SkyMergeColumn> _mergeFooterColumn = [];
  List<SkyMergeColumn> get mergeFooterColumn => _mergeFooterColumn;

  late int _headerRowNum = 1;
  int get headerRowNum => _headerRowNum;

  late int _footerRowNum = 1;
  int get footerRowNum => _footerRowNum;

  late BoxConstraints _constraints = const BoxConstraints();
  BoxConstraints get constraints => _constraints;

  late List<SkyTableColumn<T>> _mainColumns = [];
  List<SkyTableColumn<T>> get mainColumns => _mainColumns;

  late double _mainColumnsWidth = 0;
  double get mainColumnsWidth => _mainColumnsWidth;

  late List<SkyTableColumn<T>> _rightFixedColumns = [];
  List<SkyTableColumn<T>> get rightFixedColumns => _rightFixedColumns;

  late double _rightFixedColumnsWidth = 0;
  double get rightFixedColumnsWidth => _rightFixedColumnsWidth;

  late List<SkyTableColumn<T>> _leftFixedColumns = [];
  List<SkyTableColumn<T>> get leftFixedColumns => _leftFixedColumns;

  late double _leftFixedColumnsWidth = 0;
  double get leftFixedColumnsWidth => _leftFixedColumnsWidth;

  late double _totalWidth = 0;
  double get totalWidth => _totalWidth;
  //宽度超出视窗宽度
  bool get widthOverflow => _constraints.maxWidth < _totalWidth;

  late bool _hasFixed = false;
  bool get hasFixed => _hasFixed;

  late Map<String, Size> _headerCellSizeMap = {};
  Map<String, Size> get headerCellSizeMap => _headerCellSizeMap;

  late Map<String, Size> _footerCellSizeMap = {};
  Map<String, Size> get footerCellSizeMap => _footerCellSizeMap;

  //初始化信息
  void initTable({
    required List<SkyTableColumn<T>> columns,
    required List<SkyMergeColumn> mergeHeaderColumn,
    required List<SkyMergeColumn> mergeFooterColumn,
    required int headerRowNum,
    required int footerRowNum,
    required List<T> data,
  }) {
    _columns = columns;
    _mergeHeaderColumn = mergeHeaderColumn;
    _mergeFooterColumn = mergeFooterColumn;
    _headerRowNum = headerRowNum;
    _footerRowNum = footerRowNum;
    _data = data;
    clearAll();
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

  void clearAll() {
    _totalWidth = 0;
    _hasFixed = false;
    _leftFixedColumns = [];
    _leftFixedColumnsWidth = 0;
    _rightFixedColumns = [];
    _rightFixedColumnsWidth = 0;
    _mainColumns = [];
    _mainColumnsWidth = 0;
    _headerCellSizeMap = {};
  }

  void setData(List<T> e) {
    _data = e;
    notifyListeners();
  }

  void setViewConstraints(BoxConstraints e) {
    _constraints = e;
  }

  void updateHeaderCellSize(String columnkey, int rowIndex, Size s) {
    _headerCellSizeMap['$columnkey-($rowIndex)'] = s;
  }

  Size getHeaderCellSize(String columnkey, int rowIndex) {
    return _headerCellSizeMap['$columnkey-($rowIndex)'] ?? const Size(0, 0);
  }

  void updateFooterCellSize(String columnkey, int rowIndex, Size s) {
    _footerCellSizeMap['$columnkey-($rowIndex)'] = s;
  }

  Size getFooterCellSize(String columnkey, int rowIndex) {
    return _footerCellSizeMap['$columnkey-($rowIndex)'] ?? const Size(0, 0);
  }
}
