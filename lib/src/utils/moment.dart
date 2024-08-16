import 'package:intl/intl.dart';
import 'package:sky_ui/src/sky/time_picker/index.dart';

class SkyMoment {
  static DateTime now() {
    return DateTime.now();
  }

  static int get year {
    return DateTime.now().year;
  }

  static int get month {
    return DateTime.now().month;
  }

  static int get day {
    return DateTime.now().day;
  }

  static int get hour {
    return DateTime.now().hour;
  }

  static int get minute {
    return DateTime.now().minute;
  }

  static int get second {
    return DateTime.now().second;
  }

  static getFormat(String? str) {
    String format = "HH:mm";
    if (str == null) {
      return format = "HH:mm";
    } else {
      List<int> arr = str.split(":").map((e) => int.parse(e)).cast<int>().toList();
      if (arr.length == 2) {
        format = "HH:mm";
      } else if (arr.length == 3) {
        format = "HH:mm:ss";
      }
    }
    return format;
  }

  static DateTime createTimeByTimePicker(String? str, bool end) {
    if (str == null) {
      if (end) {
        return DateTime(year, month, day, 23, 59, 59);
      } else {
        return DateTime(year, month, day, 0, 0, 0);
      }
    } else {
      List<int> arr = str.split(":").map((e) => int.parse(e)).cast<int>().toList();
      if (arr.length == 2) {
        return DateTime(year, month, day, arr[0], arr[1]);
      }
      if (arr.length == 3) {
        return DateTime(year, month, day, arr[0], arr[1], arr[2]);
      }
      if (end) {
        return DateTime(year, month, day, 23, 59, 59);
      } else {
        return DateTime(year, month, day, 0, 0, 0);
      }
    }
  }

  List<String> createTimePickerOption(SkyPickerPptions config) {
    String format = getFormat(config.start);
    List<String> result = [];
    DateTime zeroTime = createTimeByTimePicker(null, false);
    DateTime stepTime = createTimeByTimePicker(config.step, false);

    DateTime startTime = createTimeByTimePicker(config.start, false);
    DateTime endTime = createTimeByTimePicker(config.end, true);
    while (startTime.isBefore(endTime)) {
      result.add(DateFormat(format).format(startTime));
      startTime = startTime.add(stepTime.difference(zeroTime));
    }
    if (!endTime.isAtSameMomentAs(startTime)) {
      result.add(DateFormat(format).format(endTime));
    }

    return result;
  }

  bool compareTimePickerOption(String? minTimeStr, String? maxTimeStr, String value) {
    DateTime minTime = createTimeByTimePicker(minTimeStr, false);
    DateTime maxTime = createTimeByTimePicker(maxTimeStr, true);
    DateTime valueTime = createTimeByTimePicker(value, true);

    return !valueTime.isBefore(minTime) && !valueTime.isAfter(maxTime);
  }
}
