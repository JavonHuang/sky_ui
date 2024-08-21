import '../../../utils/utils.dart';

class SkyDataPickerUtils extends SkyMoment {
  static List<String> headerTitle = ["日", "一", "二", "三", "四", "五", "六"];

  int getDaysInMonth(int year, int month) {
    return DateTime(year, month + 1, 0).day;
  }

  List<DateTime> generateMonthDayItem(int year, int month) {
    int days = getDaysInMonth(year, month);
    return List.generate(days, (e) => DateTime(year, month, e + 1));
  }

  Map<String, List<DateTime>> generateMonthDayShowItem(int year, int month) {
    List<DateTime> prefixList = [];
    List<DateTime> suffixList = [];
    List<DateTime> contentList = generateMonthDayItem(year, month);

    int weekday = DateTime(year, month, 1).weekday;
    int curretMonthDay = getDaysInMonth(year, month);

    List<DateTime> arr = [];
    if (month == 1) {
      arr = generateMonthDayItem(year - 1, 12);
    } else {
      arr = generateMonthDayItem(year, month - 1);
    }
    prefixList = arr.sublist(arr.length - weekday);

    int suffixNumber = 42 - weekday - curretMonthDay;
    if (suffixNumber != 0) {
      List<DateTime> arr = [];
      if (month == 12) {
        arr = generateMonthDayItem(year + 1, 1);
      } else {
        arr = generateMonthDayItem(year, month + 1);
      }
      suffixList = arr.sublist(0, suffixNumber);
    }
    return {"prefixList": prefixList, "contentList": contentList, "suffixList": suffixList};
  }
}
