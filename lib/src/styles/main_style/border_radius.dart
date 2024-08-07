part of '../styles.dart';

class SkyBorderRadius {
  SkyBorderRadius._privateConstructor();

  static final SkyBorderRadius _instance = SkyBorderRadius._privateConstructor();

  factory SkyBorderRadius() => _instance;

  double _scale = 1;

  void setScale(double value) => _scale = value;

  double get scale => _scale;

  double get _none => 0 * _scale;
  double get _small => 2 * _scale;
  double get _normal => 4 * _scale;
  double get _big => 30 * _scale;

  BorderRadius get noneBorderRadius => BorderRadius.circular(_none);
  BorderRadius get smallBorderRadius => BorderRadius.circular(_small);
  BorderRadius get normalBorderRadius => BorderRadius.circular(_normal);
  BorderRadius get bigBorderRadius => BorderRadius.circular(_big);

  Radius get noneCircular => Radius.circular(_none);
  Radius get normalCircular => Radius.circular(_normal);
  Radius get bigCircular => Radius.circular(_big);
}
