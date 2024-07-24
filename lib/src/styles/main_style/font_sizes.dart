part of '../styles.dart';

class SkyFontSizes {
  SkyFontSizes._privateConstructor();

  static final SkyFontSizes _instance = SkyFontSizes._privateConstructor();

  factory SkyFontSizes() => _instance;

  double _scale = 1;

  void setScale(double value) => _scale = value;

  double get scale => _scale;

  double get s12 => 12 * _scale;

  double get s13 => 13 * _scale;

  double get s14 => 14 * _scale;

  double get s16 => 16 * _scale;

  double get s18 => 18 * _scale;

  double get s20 => 20 * _scale;
}
