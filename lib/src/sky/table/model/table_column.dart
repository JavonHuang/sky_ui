part of '../index.dart';

class SkyTableColumn {
  final String key;
  final bool flex;
  final double? width;
  final String prop;
  final String label;
  final SkyFixed? fixed;
  SkyTableColumn({
    this.width,
    this.flex = false,
    required this.prop,
    required this.label,
    this.fixed,
  })  : assert(!(fixed != null && width == null), 'When flex is true, width does not need to be assigned'),
        key = GenerateUuid.keyV1();

  double get getWidth {
    if (flex) {
      return 0;
    }
    return width ?? 80;
  }

  bool get getFlex => flex;
}

enum SkyFixed {
  right,
  left;
}
