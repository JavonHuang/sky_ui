part of '../index.dart';

class SkyTableColumn {
  final String key;
  final bool flex;
  final double? width;
  final String? prop;
  final String label;
  final SkyFixed? fixed;
  final bool action;
  final Widget? Function(dynamic rowData, int rowIndex)? actionBuilder;
  final Widget? Function(int headerRowIndex, int headerCellIndex)? headerCellBuilder;
  final Widget? Function(int rowIndex, int cellIndex)? rowCellBuilder;

  SkyTableColumn({
    this.width,
    this.flex = false,
    this.prop,
    required this.label,
    this.fixed,
    this.action = false,
    this.actionBuilder,
    this.headerCellBuilder,
    this.rowCellBuilder,
  })  : assert(!(fixed != null && width == null), 'When fixed is true, width does not need to be assigned'),
        assert(!(!flex && width == null), 'When flex is false, width does not need to be assigned'),
        assert(!(!action && prop == null), 'When action is false, prop does not need to be assigned'),
        key = GenerateUuid.keyV1();

  double get getWidth {
    if (flex) {
      return 0;
    }
    return width!;
  }

  double get getMinWidth {
    if (flex) {
      return 80;
    }
    return width!;
  }

  bool get getFlex => flex;
}

enum SkyFixed {
  right,
  left;
}
