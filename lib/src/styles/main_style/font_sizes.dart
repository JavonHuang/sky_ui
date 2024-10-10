part of '../styles.dart';

class SkyFontSizes {
  SkyFontSizes._privateConstructor();

  static final SkyFontSizes _instance = SkyFontSizes._privateConstructor();

  factory SkyFontSizes() => _instance;

  double _scale = 1;

  void setScale(double value) => _scale = value;

  double get scale => _scale;

  double get auxiliaryFont => 12 * _scale;

  double get textSmallFont => 13 * _scale;

  double get textFont => 14 * _scale;

  double get titleSmallFont => 16 * _scale;

  double get titleFont => 18 * _scale;

  double get titleMainFont => 20 * _scale;

  double get titleBigFont => 28 * _scale;
}
