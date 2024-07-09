import 'package:flutter/material.dart';

class GirdHeaderCellBoxSize {
  final int rowIndex;
  final int cellIndex;
  final double width;
  final double height;
  GirdHeaderCellBoxSize({
    required this.rowIndex,
    required this.cellIndex,
    required this.width,
    required this.height,
  });
}

class HeaderBoxSizeNotifier extends ChangeNotifier {
  late Map<String, GirdHeaderCellBoxSize> cellBoxSize = {};
  late Map<String, GirdHeaderCellBoxSize> cellBoxSizeLeftFixed = {};
  late Map<String, GirdHeaderCellBoxSize> cellBoxSizeRightFixed = {};

  void setHeaderCellBoxSizeMap(int rowIndex, int cellIndex, double width, double height, int type) {
    if (type == 0) {
      if (cellBoxSize['$rowIndex,$cellIndex'] == null) {
        cellBoxSize['$rowIndex,$cellIndex'] = GirdHeaderCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height);
      } else {
        double old = cellBoxSize['$rowIndex,$cellIndex']!.height * cellBoxSize['$rowIndex,$cellIndex']!.width;
        cellBoxSize['$rowIndex,$cellIndex'] =
            old < height * width ? GirdHeaderCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height) : cellBoxSize['$rowIndex,$cellIndex']!;
      }
    }
    if (type == -1) {
      if (cellBoxSizeLeftFixed['$rowIndex,$cellIndex'] == null) {
        cellBoxSizeLeftFixed['$rowIndex,$cellIndex'] = GirdHeaderCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height);
      } else {
        double old = cellBoxSizeLeftFixed['$rowIndex,$cellIndex']!.height * cellBoxSize['$rowIndex,$cellIndex']!.width;
        cellBoxSize['$rowIndex,$cellIndex'] =
            old < height * width ? GirdHeaderCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height) : cellBoxSizeLeftFixed['$rowIndex,$cellIndex']!;
      }
    }
    if (type == 1) {
      if (cellBoxSizeRightFixed['$rowIndex,$cellIndex'] == null) {
        cellBoxSizeRightFixed['$rowIndex,$cellIndex'] = GirdHeaderCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height);
      } else {
        double old = cellBoxSizeRightFixed['$rowIndex,$cellIndex']!.height * cellBoxSize['$rowIndex,$cellIndex']!.width;
        cellBoxSize['$rowIndex,$cellIndex'] =
            old < height * width ? GirdHeaderCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height) : cellBoxSizeRightFixed['$rowIndex,$cellIndex']!;
      }
    }
    notifyListeners();
  }

  GirdHeaderCellBoxSize getHeaderCellBoxSize(int rowIndex, int cellIndex, int type) {
    if (type == 0) {
      if (cellBoxSize['$rowIndex,$cellIndex'] == null) {
        return GirdHeaderCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: 0, height: 0);
      } else {
        return cellBoxSize['$rowIndex,$cellIndex']!;
      }
    } else if (type == -1) {
      if (cellBoxSizeLeftFixed['$rowIndex,$cellIndex'] == null) {
        return GirdHeaderCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: 0, height: 0);
      } else {
        return cellBoxSizeLeftFixed['$rowIndex,$cellIndex']!;
      }
    } else if (type == 1) {
      if (cellBoxSizeRightFixed['$rowIndex,$cellIndex'] == null) {
        return GirdHeaderCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: 0, height: 0);
      } else {
        return cellBoxSizeRightFixed['$rowIndex,$cellIndex']!;
      }
    }
    return GirdHeaderCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: 0, height: 0);
  }
}
