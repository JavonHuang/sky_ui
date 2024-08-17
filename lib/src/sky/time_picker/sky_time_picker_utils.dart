import 'package:intl/intl.dart';
import 'package:sky_ui/sky_ui.dart';

class SkyTimePickerUtils extends SkyMoment {
  SkyTimePickerUtils();

  List<int> getStrToList(String? str) {
    if (str == null || str.isEmpty) {
      return [];
    } else {
      List<int> arr = str.split(":").map((e) => int.parse(e)).cast<int>().toList();
      return arr;
    }
  }

  String getFormat(String? str) {
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

  DateTime createTimeByTimePicker(String? str, bool end) {
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
    DateTime valueTime = createTimeByTimePicker(value, false);

    return !valueTime.isBefore(minTime) && !valueTime.isAfter(maxTime);
  }
}
