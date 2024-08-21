part of '../index.dart';

class SkyPickerOptions {
  final bool Function(DateTime e)? disabledDate;
  final bool Function(DateTime e)? onPick;

  SkyPickerOptions({
    this.disabledDate,
    this.onPick,
  });
}
