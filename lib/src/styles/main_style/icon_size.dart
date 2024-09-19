part of '../styles.dart';

class SkyIconSizes {
  SkyIconSizes._privateConstructor();

  static final SkyIconSizes _instance = SkyIconSizes._privateConstructor();

  factory SkyIconSizes() => _instance;

  double _scale = 1;

  void setScale(double value) => _scale = value;

  double get scale => _scale;

  double get smallFont => 12 * _scale;

  double get mediumFont => 14 * _scale;

  double get largeFont => 18 * _scale;
}
