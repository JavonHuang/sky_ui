part of 'index.dart';

class SkyTableController {
  _SkyTableState? _state;

  ///数据源
  List<Map<dynamic, dynamic>> data = [];
  List<SkyTableColumn> columns = [];

  ///渲染最后一行后回调
  Function(SkyTableController ctr)? loadFinish;

  ///显示边框
  bool border = false;

  ///视窗宽度
  double viewWidth = 0;

  ///列宽加总
  double get columnWidth {
    double t = 0;
    for (SkyTableColumn item in columns) {
      t = t + item.getWidth;
    }
    return t;
  }

  ///宽度超出视窗宽度
  bool get widthOverflow => viewWidth < columnWidth;

  void _attach(_SkyTableState state) {
    _state = state;
  }

  void _detach(_SkyTableState state) {
    if (_state == state) {
      _state = null;
    }
  }
}
