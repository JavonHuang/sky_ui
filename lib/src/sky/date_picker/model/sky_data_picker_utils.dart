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

  List<int> getYearList(int start) {
    int year = (start / 10).round() * 10;
    return List.generate(10, (e) => e + year);
  }

  List<Map<String, int>> getMontList() {
    return [
      {"一": 1},
      {"二": 2},
      {"三": 3},
      {"四": 4},
      {"五": 5},
      {"六": 6},
      {"七": 7},
      {"八": 8},
      {"九": 9},
      {"十": 10},
      {"十一": 11},
      {"十二": 12},
    ];
  }

  /// 根据year年的第week周，查询本周的开始和截止日期
  List<DateTime> weekToDayRange(int year, int week) {
    DateTime endTime = getDateTimeByWeek(year, week);
    return [endTime.subtract(const Duration(days: 6)), endTime];
  }

  int getWeek(DateTime e) {
    int weekDay = DateTime(year, 1, 1).weekday;
    int days = e.difference(DateTime(e.year, 1, 1)).inDays + 1 + weekDay;
    return (days / 7).ceil();
  }

  DateTime getDateTimeByWeek(int year, int week) {
    DateTime yearFirstDay = DateTime(year, 1, 1);
    int weekDay = DateTime(year, 1, 1).weekday;

    DateTime weekTime = yearFirstDay.add(Duration(days: (week * 7 - 1 - weekDay)));
    if (weekTime.year != year) {
      return DateTime(year - 1, 1, 1).subtract(const Duration(days: 1));
    }
    return weekTime;
  }
}
