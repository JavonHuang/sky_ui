part of '../index.dart';

class SkyTableColumn {
  final String key;
  final bool flex;
  final double? width;
  final String prop;

  SkyTableColumn({
    this.width,
    this.flex = false,
    required this.prop,
  }) : key = GenerateUuid.keyV1();

  double get getWidth {
    if (flex || width == null) {
      return 0;
    }
    return width ?? 80;
  }
}
