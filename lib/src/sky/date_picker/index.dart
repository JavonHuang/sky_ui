import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../styles/styles.dart';
import '../../utils/utils.dart';
import '../buttons/buttons.dart';
import '../common/sky_hover.dart';
import '../common/sky_inptut_outline_hover.dart';
import '../form/sky_form.dart';
import '../form/sky_form_field_bridge.dart';
import '../input/index.dart';
import 'model/sky_data_picker_utils.dart';

part 'sky_date_picker.dart';
part 'sky_date_picker_range.dart';
part 'widget/sky_date_picker_item.dart';
part 'widget/sky_date_picker_menu.dart';
part 'widget/sky_date_picker_range_menu.dart';

part 'model/sky_picker_options.dart';

class SkyDatePicker<T> extends StatelessWidget {
  const SkyDatePicker({
    super.key,
    this.size = SkySize.small,
    this.disabled = false,
    this.clearable = false,
    this.placeholder,
    this.model,
    this.editable = false,
    this.pickerOptions,
    this.format,
    this.type = SkyDatePickerType.date,
  });
  final SkySize size;
  final bool disabled;
  final bool clearable;
  final String? placeholder;
  final T? model;
  final SkyDatePickerType? type;

  final bool editable;
  final SkyPickerOptions? pickerOptions;
  final String? format;

  @override
  Widget build(BuildContext context) {
    if (type == SkyDatePickerType.year ||
        type == SkyDatePickerType.month ||
        type == SkyDatePickerType.week ||
        type == SkyDatePickerType.date ||
        type == SkyDatePickerType.years ||
        type == SkyDatePickerType.months ||
        type == SkyDatePickerType.dates) {
      return SkyDatePickerSingle(
        size: size,
        disabled: disabled,
        clearable: clearable,
        placeholder: placeholder,
        model: model,
        type: type,
        editable: editable,
        pickerOptions: pickerOptions,
        format: format,
      );
    } else {}
    return SkyDatePickerRange(
      size: size,
      disabled: disabled,
      clearable: clearable,
      placeholder: placeholder,
      model: model,
      type: type,
      editable: editable,
      pickerOptions: pickerOptions,
      format: format,
    );
  }
}
