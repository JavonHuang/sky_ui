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
    start = start ?? "00:00:00";
    end = end ?? "23:59:59";
    step = step ?? "00:30:00";
    minTime = minTime ?? "00:00:00";
    maxTime = maxTime ?? "23:59:59";
  }
  final Key? key;
  String? start;
  String? end;
  String? step;
  String? minTime;
  String? maxTime;

  String _getFomart() {
    return "";
  }
}
