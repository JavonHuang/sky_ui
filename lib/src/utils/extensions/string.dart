import 'package:sky_ui/src/utils/extensions/num.dart';

extension SkyStringEx on String {
  bool get doubleTryParse {
    if (double.tryParse(this) == null || double.tryParse(this)!.isNaN || double.tryParse(this) == double.infinity) {
      return false;
    }
    return true;
  }

  String toDoubleText({int? maxDigits}) {
    if (doubleTryParse) {
      return double.parse(this).getMaxPrecision(maxDigits: maxDigits).toString();
    } else {
      return '';
    }
  }
}
