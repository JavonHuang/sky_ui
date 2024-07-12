import 'package:flutter/material.dart';

class GirdFooterCellBoxSize {
  final int rowIndex;
  final int cellIndex;
  final double width;
  final double height;
  GirdFooterCellBoxSize({
    required this.rowIndex,
    required this.cellIndex,
    required this.width,
    required this.height,
  });
}

class FootBoxSizeNotifier extends ChangeNotifier {
  late Map<String, GirdFooterCellBoxSize> cellBoxSize = {};
  late Map<String, GirdFooterCellBoxSize> cellBoxSizeLeftFixed = {};
  late Map<String, GirdFooterCellBoxSize> cellBoxSizeRightFixed = {};

  void setfooterCellBoxSizeMap(int rowIndex, int cellIndex, double width, double height, int type) {
    if (type == 0) {
      if (cellBoxSize['$rowIndex,$cellIndex'] == null) {
        cellBoxSize['$rowIndex,$cellIndex'] = GirdFooterCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height);
      } else {
        double old = cellBoxSize['$rowIndex,$cellIndex']!.height * cellBoxSize['$rowIndex,$cellIndex']!.width;
        cellBoxSize['$rowIndex,$cellIndex'] =
            old < height * width ? GirdFooterCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height) : cellBoxSize['$rowIndex,$cellIndex']!;
      }
    }
    if (type == -1) {
      if (cellBoxSizeLeftFixed['$rowIndex,$cellIndex'] == null) {
        cellBoxSizeLeftFixed['$rowIndex,$cellIndex'] = GirdFooterCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height);
      } else {
        double old = cellBoxSizeLeftFixed['$rowIndex,$cellIndex']!.height * cellBoxSize['$rowIndex,$cellIndex']!.width;
        cellBoxSize['$rowIndex,$cellIndex'] =
            old < height * width ? GirdFooterCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height) : cellBoxSizeLeftFixed['$rowIndex,$cellIndex']!;
      }
    }
    if (type == 1) {
      if (cellBoxSizeRightFixed['$rowIndex,$cellIndex'] == null) {
        cellBoxSizeRightFixed['$rowIndex,$cellIndex'] = GirdFooterCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height);
      } else {
        double old = cellBoxSizeRightFixed['$rowIndex,$cellIndex']!.height * cellBoxSize['$rowIndex,$cellIndex']!.width;
        cellBoxSize['$rowIndex,$cellIndex'] =
            old < height * width ? GirdFooterCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height) : cellBoxSizeRightFixed['$rowIndex,$cellIndex']!;
      }
    }
    notifyListeners();
  }

  GirdFooterCellBoxSize getfootCellBoxSize(int rowIndex, int cellIndex, int type) {
    if (type == 0) {
      if (cellBoxSize['$rowIndex,$cellIndex'] == null) {
        return GirdFooterCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: 0, height: 0);
      } else {
        return cellBoxSize['$rowIndex,$cellIndex']!;
      }
    } else if (type == -1) {
      if (cellBoxSizeLeftFixed['$rowIndex,$cellIndex'] == null) {
        return GirdFooterCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: 0, height: 0);
      } else {
        return cellBoxSizeLeftFixed['$rowIndex,$cellIndex']!;
      }
    } else if (type == 1) {
      if (cellBoxSizeRightFixed['$rowIndex,$cellIndex'] == null) {
        return GirdFooterCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: 0, height: 0);
      } else {
        return cellBoxSizeRightFixed['$rowIndex,$cellIndex']!;
      }
    }
    return GirdFooterCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: 0, height: 0);
  }
}
