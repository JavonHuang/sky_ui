import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../sky_ui.dart';

class GridTableController<T> extends ChangeNotifier {
  late List<SkyGridTableColumn<T>> _columns = [];
  late List<GridMergeHeaderColumn> _mergeHeaderColumn = [];
  List<GridMergeHeaderColumn> get mergeHeaderColumn => _mergeHeaderColumn;
  late List<GridMergeFooterColumn> _mergeFooterColumn = [];
  List<GridMergeFooterColumn> get mergeFooterColumn => _mergeFooterColumn;
  late int _headerRowNum = 1;
  int get headerRowNum => _headerRowNum;
  late int _footerRowNum = 1;
  int get footerRowNum => _footerRowNum;

  late BoxConstraints constraints = const BoxConstraints();

  late List<SkyGridTableColumn<T>> _rightFixedColumns = [];
  late double _rightFixedColumnsWidth = 0;
  late List<SkyGridTableColumn<T>> _leftFixedColumns = [];
  late double _leftFixedColumnsWidth = 0;
  late Map<int, double> _rowHeightMap = {};

  final reloadFixedColumnStreamController = StreamController<bool>.broadcast();

  //设置栏信息
  void initTable({
    required List<SkyGridTableColumn<T>> columns,
    required List<GridMergeHeaderColumn> mergeHeaderColumn,
    required List<GridMergeFooterColumn> mergeFooterColumn,
    required int headerRowNum,
    required int footerRowNum,
  }) {
    _columns = columns;
    _mergeHeaderColumn = mergeHeaderColumn;
    _mergeFooterColumn = mergeFooterColumn;
    _headerRowNum = headerRowNum;
    _footerRowNum = footerRowNum;
    notifyListeners();
  }

  void setViewConstraints(BoxConstraints e) {
    constraints = e;
  }

  //是否存在右悬浮
  bool get hasRightFixed {
    return _columns.any((e) {
      return e.rightFixed;
    });
  }

  //是否存在左悬浮
  bool get hasLeftFixed {
    return _columns.any((e) {
      return e.leftFixed;
    });
  }

  //总宽度
  double get totalWidth {
    double result = 0;
    for (SkyGridTableColumn<T> item in _columns) {
      result = result + (item.cellWidth ?? 0);
    }
    return result;
  }

  //宽度超出视窗宽度
  bool get widthOverflow {
    return constraints.maxWidth < totalWidth;
  }

  List<SkyGridTableColumn<T>> get rightFixedColumns {
    for (SkyGridTableColumn<T> e in _columns) {
      if (e.rightFixed) {
        _rightFixedColumnsWidth += e.cellWidth!;
        _rightFixedColumns.add(e);
      }
    }
    return _rightFixedColumns;
  }

  double get rightFixedColumnsWidth {
    for (SkyGridTableColumn<T> e in _columns) {
      if (e.rightFixed) {
        _rightFixedColumnsWidth += e.cellWidth!;
      }
    }
    return _rightFixedColumnsWidth;
  }

  List<SkyGridTableColumn<T>> get leftFixedColumns {
    for (SkyGridTableColumn<T> e in _columns) {
      if (e.leftFixed) {
        _leftFixedColumns.add(e);
      }
    }
    return _leftFixedColumns;
  }

  double get leftFixedColumnsWidth {
    for (SkyGridTableColumn<T> e in _columns) {
      if (e.rightFixed) {
        _leftFixedColumnsWidth += e.cellWidth!;
      }
    }
    return _leftFixedColumnsWidth;
  }

  void setRowHeihtMap(int rowIndex, double height) {
    if (_rowHeightMap[rowIndex] == null) {
      _rowHeightMap[rowIndex] = height;
    } else {
      _rowHeightMap[rowIndex] = _rowHeightMap[rowIndex]! < height ? height : _rowHeightMap[rowIndex]!;
    }

    // notifyListeners();
  }

  void reloadHeightFixedContent() => reloadFixedColumnStreamController.add(true);

  double? getRowHeiht(int rowIndex) {
    if (_rowHeightMap[rowIndex] == null) {
      return null;
    }
    return _rowHeightMap[rowIndex]!;
  }
}
