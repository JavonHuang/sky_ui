part of '../index.dart';

class SkyTableColumn {
  final String key;
  final bool flex;
  final double? width;
  final String prop;
  final String label;

  SkyTableColumn({
    this.width,
    this.flex = false,
    required this.prop,
    required this.label,
  }) : key = GenerateUuid.keyV1();

  double get getWidth {
    if (flex) {
      return 0;
    }
    return width ?? 80;
  }

  bool get getFlex => flex;
}
