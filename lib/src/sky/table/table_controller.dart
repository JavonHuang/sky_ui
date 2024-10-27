part of 'index.dart';

class SkyTableController {
  _SkyTableState? _state;

  ///数据源
  List<Map<dynamic, dynamic>> data = [];
  List<SkyTableColumn> columns = [];
  //渲染最后一行后回调
  Function(SkyTableController ctr)? loadFinish;
  //显示边框
  bool border = false;
  //带斑马纹
  bool stripe = false;
  //行样式设置
  SkyRowStyle? Function(dynamic rowDate, int rowIndex)? rowStyle;
//表头行数
  int headerRowCount = 1;

  ///视窗宽度
  double viewWidth = 0;

  List<SkyTableColumn> get fixedRightColumns => columns.where((e) => e.fixed == SkyFixed.right).toList();
  double get fixedRightColumnsWidth {
    double t = 0;
    for (SkyTableColumn item in fixedRightColumns) {
      t = t + item.getWidth;
    }
    return t;
  }

  List<SkyTableColumn> get fixedLeftColumns => columns.where((e) => e.fixed == SkyFixed.left).toList();
  double get fixedLeftColumnsWidth {
    double t = 0;
    for (SkyTableColumn item in fixedLeftColumns) {
      t = t + item.getWidth;
    }
    return t;
  }

  List<SkyTableColumn> scrollColumns = [
    SkyTableColumn(
      prop: "",
      label: "",
      rowCellBuilder: (rowIndex, cellIndex) => const Text(""),
      headerCellBuilder: (headerRowIndex, headerCellIndex) => const Text(""),
      width: 10,
    ),
  ];
  double get scrollColumnsWidth {
    double t = 0;
    for (SkyTableColumn item in scrollColumns) {
      t = t + item.getWidth;
    }
    return t;
  }

  List<SkyTableColumn> get flexColumns => columns.where((e) => e.flex).toList();

  List<SkyTableColumn> get showColumns {
    return [
      ...fixedLeftColumns,
      ...columns.where((e) => e.fixed == null),
      ...fixedRightColumns,
    ];
  }

  //存在浮动列
  bool get hasFixed => fixedRightColumns.isNotEmpty || fixedLeftColumns.isNotEmpty;
  //列宽加总
  double get columnWidth {
    double t = 0;
    for (SkyTableColumn item in columns) {
      t = t + item.getWidth;
    }

    ///横向滚动的，自适应列给默认宽度值
    if (t > viewWidth) {
      double r = 0;
      for (SkyTableColumn item in columns) {
        r = r + item.getMinWidth;
      }
      return r;
    } else {
      return t;
    }
  }

  ///没有横向滚动条的，给自适应列模拟分摊个宽度
  double flexWidth(SkyTableColumn column) {
    if (!widthOverflow && flexColumns.isNotEmpty) {
      return (viewWidth - columnWidth) / flexColumns.length;
    }
    return column.getWidth;
  }

  //宽度超出视窗宽度
  bool get widthOverflow => columnWidth > viewWidth;

  ///悬浮列滚动条同步
  LinkedScrollControllerGroup _controllers = LinkedScrollControllerGroup();

  ScrollController get createLinkedScrollController => _controllers.addAndGet();
  // late ScrollController _leftScrollController = _controllers.addAndGet();
  // late ScrollController _scrollController = _controllers.addAndGet();
  // late ScrollController _rightScrollController = _controllers.addAndGet();
  // late ScrollController _extScrollController = _controllers.addAndGet();

  ///表格内事件广播
  final skyTableEventStreamController = StreamController<SkyTableEvent>.broadcast();

  late Map<int, double> _rowHeight = {};

  void setRowHeight(int rowIndex, double height) {
    _rowHeight[rowIndex] = height;
  }

  double? getRowHeight(int rowIndex) {
    return _rowHeight[rowIndex];
  }

  late Map<int, double> _headerRowHeight = {};

  void setHeaderRowHeight(int rowIndex, double height) {
    _headerRowHeight[rowIndex] = height;
  }

  double? getHeaderRowHeight(int rowIndex) {
    return _headerRowHeight[rowIndex];
  }

  void _attach(_SkyTableState state) {
    _state = state;
  }

  void _detach(_SkyTableState state) {
    if (_state == state) {
      _state = null;
    }
  }
}
