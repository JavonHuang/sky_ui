part of '../index.dart';

class SkyPickerOptions {
  SkyPickerOptions({
    this.key,
    this.start,
    this.end,
    this.step,
    this.minTime,
    this.maxTime,
  });
  final Key? key;
  String? start;
  String? end;
  String? step;
  String? minTime;
  String? maxTime;

  copyWith() {
    return SkyPickerOptions(
      start: start,
      end: end,
      step: step,
      minTime: minTime,
      maxTime: maxTime,
    );
  }
}

class SkyPickerRangeOptions {
  SkyPickerRangeOptions({
    this.key,
    this.minTime,
    this.maxTime,
  });
  final Key? key;
  String? minTime;
  String? maxTime;

  copyWith() {
    return SkyPickerRangeOptions(
      minTime: minTime,
      maxTime: maxTime,
    );
  }
}
