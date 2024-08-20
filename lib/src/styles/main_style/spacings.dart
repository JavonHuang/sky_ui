part of '../styles.dart';

class SkySpacings {
  SkySpacings._privateConstructor();

  static final SkySpacings _instance = SkySpacings._privateConstructor();

  factory SkySpacings() => _instance;

  double _scale = 1;

  double get scale => _scale;

  void setScale(double value) => _scale = value;

  /// ----------------------------------------------------------------------------------------------

  double _mainSpacing = 12;
  double _textSpacing = 4;

  double get mainSpacing => _mainSpacing * scale;
  double get textSpacing => _textSpacing * scale;

  void setMainPadding(double value) => _mainSpacing = value;
}
