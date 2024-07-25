part of 'styles.dart';

class SkyColors {
  SkyColors._privateConstructor();

  static final SkyColors _instance = SkyColors._privateConstructor();

  factory SkyColors() => _instance;

  ///主要颜色
  static const Color _primary = Color(0xFF409EFF);
  static const Color _success = Color(0xFF67C23A);
  static const Color _warning = Color(0xFFE6A23C);
  static const Color _danger = Color(0xFFF56C6C);
  static const Color _info = Color(0xFF909399);
  static const Color _white = Color(0xFFFFFFFF);
  static const Color _transparent = Colors.transparent;

  Color get primary => _primary;
  Color get success => _success;
  Color get warning => _warning;
  Color get danger => _danger;
  Color get info => _info;
  Color get white => _white;
  Color get transparent => _transparent;

  ///文字颜色
  static const Color _primaryText = Color(0xFF303133);
  static const Color _regularText = Color(0xFF606266);
  static const Color _secondaryText = Color(0xFF909399);
  static const Color _placeholderText = Color(0xFFC0C4CC);

  Color get primaryText => _primaryText;
  Color get regularText => _regularText;
  Color get secondaryText => _secondaryText;
  Color get placeholderText => _placeholderText;

  ///边框颜色
  static const Color _baseBorder = Color(0xFFDCDFE6);
  static const Color _lightBorder = Color(0xFFE4E7ED);
  static const Color _lighterBorder = Color(0xFFEBEEF5);
  static const Color _extralightBorder = Color(0xFFF2F6FC);

  Color get baseBorder => _baseBorder;
  Color get lightBorder => _lightBorder;
  Color get lighterBorder => _lighterBorder;
  Color get extralightBorder => _extralightBorder;

  ///底色
  static const Color _defaultBg = Color(0xFFf5f7fa);
  static const Color _tableDefaultRowBg = Color(0xFFffffff);
  static const Color _tableRowBg = Color(0xFFfafafa);
  static const Color _tableRowBgHover = Color(0xFFf5f7fa);
  static const Color _tableSortBgActive = Color(0xFF409eff);
  static const Color _tableSortBg = Color(0xFFc0c4cc);

  Color get defaultBg => _defaultBg;
  Color get tableDefaultRowBg => _tableDefaultRowBg;
  Color get tableRowBg => _tableRowBg;
  Color get tableRowBgHover => _tableRowBgHover;
  Color get tableSortBgActive => _tableSortBgActive;
  Color get tableSortBg => _tableSortBg;
}
