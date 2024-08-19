import '../../../utils/utils.dart';

class SkyDataPickerUtils extends SkyMoment {
  int getDaysInFebruary(int year) {
    return DateTime(year, 2, 29).difference(DateTime(year, 2, 28)).inDays;
  }
}
