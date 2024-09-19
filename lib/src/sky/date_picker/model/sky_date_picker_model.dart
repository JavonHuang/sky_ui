import '../index.dart';

class SkyDatePickerModel<T> {
  final SkyDatePickerType type;
  final T? value;

  SkyDatePickerModel(this.type, [this.value]) {
    if (type == SkyDatePickerType.date && value is! T) {
      throw ArgumentError('Expected an integer for single value');
    } else if (type == SkyDatePickerType.week && value is! String) {
      if (value != null) {
        String str = value as String;
        List<int> arr = str.split("-").map((e) => int.parse(e)).cast<int>().toList();
        if (arr.length != 2) {
          throw ArgumentError('Expected an integer for String value');
        }
      }
    } else if (type == SkyDatePickerType.daterange) {
      if (value is! List) {
        throw ArgumentError('Expected a list of 2 integers for array value');
      }
      List a = value as List;
      if (a.isNotEmpty && (a.length != 2 || value is! List<int>)) {
        throw ArgumentError('Expected a list of 2 integers for array value');
      }
    } else if (type == SkyDatePickerType.months) {
      if (value is! List) {
        throw ArgumentError('Expected a list of array value');
      }
      List a = value as List;
      if (a.isNotEmpty && value is! List<int>) {
        throw ArgumentError('Expected a list of 2 integers for array value');
      }
    }
  }
}
