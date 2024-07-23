part of './../sky_table.dart';

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

  ///初始化信息
  void initTable({
    required List<SkyTableColumn<T>> columns,
    required List<SkyMergeColumn> mergeHeaderColumn,
    required List<SkyMergeColumn> mergeFooterColumn,
    required int headerRowNum,
    required int footerRowNum,
    required List<T> data,
    required Function(T e, int index)? rowOnTab,
  }) {
    clearAll();
    _columns = columns;
    _mergeHeaderColumn = mergeHeaderColumn;
    _mergeFooterColumn = mergeFooterColumn;
    _headerRowNum = headerRowNum;
    _footerRowNum = footerRowNum;
    _data = data;
    _rowOnTab = rowOnTab;
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
