part of 'index.dart';

class SkyPickerPptions {
  SkyPickerPptions({
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
    return SkyPickerPptions(
      start: start,
      end: end,
      step: step,
      minTime: minTime,
      maxTime: maxTime,
    );
  }

  // String getFomartArrowControl() {
  //   if (minTime != null) {
  //     return SkyTimePickerUtils().getFormat(minTime);
  //   }
  //   if (maxTime != null) {
  //     return SkyTimePickerUtils().getFormat(maxTime);
  //   }
  //   return "HH:mm:ss";
  // }

  // String getFomart() {
  //   if (step != null) {
  //     return SkyTimePickerUtils().getFormat(step);
  //   }
  //   if (start != null) {
  //     return SkyTimePickerUtils().getFormat(start);
  //   }
  //   if (end != null) {
  //     return SkyTimePickerUtils().getFormat(end);
  //   }
  //   return "HH:mm:ss";
  // }
}
