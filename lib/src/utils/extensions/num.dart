import '../../styles/styles.dart';

extension SkyNumEx on num {
  double get scaleFontSize => this * SkyFontSizes().scale;

  double get scaleIconSize => this * SkySpacings().scale;

  double get scaleSpacing => this * SkySpacings().scale;

  /// Example:
  /// 1.0 -> 1
  /// 2.0000 -> 2
  /// 3.01 -> 3.01
  num getMaxPrecision({int? maxDigits}) {
    if (round() == this) return round().toInt();
    if (maxDigits == null) return num.parse(toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), ""));
    return num.parse(
      toStringAsFixed(maxDigits).replaceAll(
        RegExp(r'([.]*0)(?!.*\d)'),
        "",
      ),
    );
  }
}
