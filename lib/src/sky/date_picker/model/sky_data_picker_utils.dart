import '../../../utils/utils.dart';

class SkyDataPickerUtils extends SkyMoment {
  static List<String> headerTitle = ["日", "一", "二", "三", "四", "五", "六"];
  int getDaysInFebruary(int year) {
    return DateTime(year, 2, 29).difference(DateTime(year, 2, 28)).inDays;
  }
}
