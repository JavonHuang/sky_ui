import 'package:flutter/material.dart';

class HeightNotifier extends ChangeNotifier {
  late Map<int, double> rowHeightMap = {};

  void setRowHeihtMap(int rowIndex, double height) {
    if (rowHeightMap[rowIndex] == null) {
      rowHeightMap[rowIndex] = height;
    } else {
      rowHeightMap[rowIndex] = rowHeightMap[rowIndex]! < height ? height : rowHeightMap[rowIndex]!;
    }
    notifyListeners();
  }
}
