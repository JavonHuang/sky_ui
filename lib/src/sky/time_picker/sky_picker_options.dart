part of 'index.dart';

class SkyPickerPptions {
  SkyPickerPptions({
    this.key,
    this.start,
    this.end,
    this.step,
    this.minTime,
    this.maxTime,
  }) {
    step = "00:30";
  }
  final Key? key;
  final String? start;
  final String? end;
  String? step;
  final String? minTime;
  final String? maxTime;
}
