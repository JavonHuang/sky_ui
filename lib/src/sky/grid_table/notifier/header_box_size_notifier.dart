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

  void setHeaderCellBoxSizeMap(int rowIndex, int cellIndex, double width, double height) {
    if (cellBoxSize['$rowIndex,$cellIndex'] == null) {
      cellBoxSize['$rowIndex,$cellIndex'] = GirdHeaderCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height);
    } else {
      double old = cellBoxSize['$rowIndex,$cellIndex']!.height * cellBoxSize['$rowIndex,$cellIndex']!.width;
      cellBoxSize['$rowIndex,$cellIndex'] = old < height * width ? GirdHeaderCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: width, height: height) : cellBoxSize['$rowIndex,$cellIndex']!;
    }
    notifyListeners();
  }

  GirdHeaderCellBoxSize getHeaderCellBoxSize(int rowIndex, int cellIndex) {
    if (cellBoxSize['$rowIndex,$cellIndex'] == null) {
      return GirdHeaderCellBoxSize(rowIndex: rowIndex, cellIndex: cellIndex, width: 0, height: 0);
    } else {
      return cellBoxSize['$rowIndex,$cellIndex']!;
    }
  }
}
