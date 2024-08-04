part of 'sky_form.dart';

class SkyFormField extends StatefulWidget {
  const SkyFormField({
    super.key,
    required this.child,
    required this.label,
    this.required = false,
    required this.prop,
    this.rule,
    this.labelWidth,
    this.restorationId,
  });
  final Widget child;
  final String label;
  final bool required;
  final String prop;
  final Rules? rule;
  final double? labelWidth;
  final String? restorationId;

  static SkyFormFieldState? maybeOf(BuildContext context) {
    final _SkyFormFieldScope? scope = context.dependOnInheritedWidgetOfExactType<_SkyFormFieldScope>();
    return scope?._skyFormFieldState;
  }

  @override
  State<SkyFormField> createState() => SkyFormFieldState();
}

class SkyFormFieldState extends State<SkyFormField> {
  late int count = 0;
  late SkyFormType? itemType;
  late ValidatorResult _validatorResult = ValidatorResult(result: true, message: '');

  late SkyInput _skyInput;
  late SkyInputNumber _skyInputNumber;
  late SkyRadio _skyRadio;
  late SkyGroupRadio _skyGroupRadio;

  SkyForm? get skyForm => SkyForm.maybeOfSkyForm(context);

  double? get _labelWidth => widget.labelWidth ?? skyForm?.labelWidth;

  late void Function(dynamic e) _setValue;
  late dynamic Function() _getValue;

  dynamic getInitialValue(String prop) {
    if (skyForm?.model != null && skyForm?.model![prop] != null) {
      return skyForm?.model![prop];
    }
    return "";
  }

  void register(e, SkyFormType type, setValue, getValue) {
    _setValue = setValue;
    _getValue = getValue;
    itemType = type;
    switch (itemType) {
      case SkyFormType.skyInput:
        _skyInput = e;
        dynamic initialValue = getInitialValue(widget.prop);
        if (initialValue.toString().isNotEmpty || _skyInput.model != null) {
          String val = _skyInput.model!.isNotEmpty ? _skyInput.model! : initialValue.toString();
          setValue!.call(val);
        }
        break;
      case SkyFormType.skyInputNumber:
        _skyInputNumber = e;
        dynamic initialValue = getInitialValue(widget.prop);
        if (initialValue.toString().isNotEmpty || (_skyInputNumber.model != null && _skyInputNumber.model.toString().isNotEmpty)) {
          String val = _skyInputNumber.model != null ? _skyInputNumber.model.toString() : initialValue.toString();
          setValue!.call(val.toDoubleText());
        }
        break;
      case SkyFormType.skyRadio:
        _skyRadio = e;
        dynamic initialValue = getInitialValue(widget.prop) != "";
        setValue!.call(initialValue);
        break;
      case SkyFormType.skyGroupRadio:
        break;
      case null:
      // TODO: Handle this case.
    }
    SkyForm.maybeOf(context)?._register(this);
  }

  void clearValidate() {
    _validatorResult = ValidatorResult(result: true, message: '');
    setState(() {});
  }

  void resetField() {
    switch (itemType) {
      case SkyFormType.skyInput:
        dynamic initialValue = getInitialValue(widget.prop);
        if (initialValue.isNotEmpty && initialValue.toString().isNotEmpty) {
          _setValue(initialValue.toString());
        } else {
          _setValue('');
        }
        break;
      case SkyFormType.skyInputNumber:
        dynamic initialValue = getInitialValue(widget.prop);

        if (initialValue.isNotEmpty && initialValue.toString().isNotEmpty) {
          String val = initialValue.toString();
          _setValue(double.parse(val).getMaxPrecision(maxDigits: _skyInputNumber.precision).toString());
        } else {
          _setValue('');
        }
        break;
      case SkyFormType.skyRadio:
        dynamic initialValue = getInitialValue(widget.prop);
        if (initialValue != '') {
          _setValue(true);
        } else {
          _setValue(false);
        }
        break;
      case SkyFormType.skyGroupRadio:
        break;
      case null:
      // TODO: Handle this case.
    }
    _validatorResult = ValidatorResult(result: true, message: '');
    setState(() {});
  }

  void setField(dynamic val) {
    switch (itemType) {
      case SkyFormType.skyInput:
        if (val != null) {
          _setValue(val);
        } else {
          _setValue("");
        }
        break;
      case SkyFormType.skyInputNumber:
        if (double.tryParse(val) != null) {
          _setValue(double.tryParse(val).toString());
        } else {
          _setValue("");
        }
        break;
      case SkyFormType.skyRadio:
        if (checkType(val)) {
          _setValue(val);
        } else {
          _setValue(false);
        }
        break;
      case SkyFormType.skyGroupRadio:
        break;
      case null:
      // TODO: Handle this case.
    }
    _validatorResult = ValidatorResult(result: true, message: '');
    setState(() {});
  }

  bool checkType(dynamic e) {
    if (e is String && e.isEmpty) {
      return false;
    }
    if (e is List && e.isEmpty) {
      return false;
    }
    if (e is num && e.toString().isEmpty) {
      return false;
    }
    if (e is bool && e.toString().isEmpty) {
      return false;
    }
    return true;
  }

  Future<dynamic> validate() async {
    _validatorResult = ValidatorResult(result: true, message: '');
    dynamic val = _getValue();
    if (_required && !checkType(val)) {
      _validatorResult = ValidatorResult(result: false, message: '请输入${widget.label}');
      setState(() {});
      return Future.value({"prop": widget.prop, "result": _validatorResult.result, "value": null});
    }
    _validatorResult = await _validator(val);
    setState(() {});
    dynamic value;
    switch (itemType) {
      case SkyFormType.skyInput:
        value = val;
        break;
      case SkyFormType.skyInputNumber:
        if (val.isNotEmpty) {
          value = double.parse(val);
        }
        break;
      case SkyFormType.skyRadio:
        if (val.isNotEmpty) {
          value = bool.parse(val);
        }
        break;
      case SkyFormType.skyGroupRadio:
        break;
      case null:
      // TODO: Handle this case.
    }
    return Future.value({"prop": widget.prop, "result": _validatorResult.result, "value": value});
  }

  bool get hasModelRules => skyForm != null && skyForm!.rules != null && skyForm!.rules![widget.prop] != null;
  bool get _required {
    return widget.required || (widget.rule != null && widget.rule!.required) || (hasModelRules && skyForm!.rules![widget.prop]!.required);
  }

  Future<ValidatorResult> Function(dynamic e) get _validator {
    if (widget.rule != null) {
      return widget.rule!.validator;
    } else if (hasModelRules) {
      return skyForm!.rules![widget.prop]!.validator;
    } else {
      return (e) {
        return Future.value(ValidatorResult(result: true, message: ''));
      };
    }
  }

  String get _message {
    return _validatorResult.result ? '' : _validatorResult.message;
  }

  String? get restorationId => widget.restorationId;
  @override
  Widget build(BuildContext context) {
    return _SkyFormFieldScope(
      count: count,
      skyFormFieldState: this,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: _labelWidth,
                    // color: Colors.red,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: "*", style: TextStyle(color: _required ? SkyColors().danger : SkyColors().transparent)),
                          TextSpan(text: "${widget.label}："),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  '',
                  style: TextStyle(
                    fontSize: SkyFontSizes().s12,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.child,
                  Text(
                    _message,
                    overflow: TextOverflow.ellipsis, // 设置超出部分显示省略号
                    maxLines: 1,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: SkyFontSizes().s12,
                      color: SkyColors().danger,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SkyFormFieldScope extends InheritedWidget {
  const _SkyFormFieldScope({
    required super.child,
    required SkyFormFieldState skyFormFieldState,
    required int count,
  })  : _count = count,
        _skyFormFieldState = skyFormFieldState;

  final SkyFormFieldState _skyFormFieldState;
  final int? _count;
  SkyFormField get skyFormField => _skyFormFieldState.widget;

  @override
  bool updateShouldNotify(_SkyFormFieldScope old) => _count != old._count;
}

class Rules {
  late bool required;
  late String message;
  late String blur;
  final Future<ValidatorResult> Function(dynamic e) validator;
  Rules({
    this.required = false,
    this.message = '',
    this.blur = 'change',
    required this.validator,
  });
}

class ValidatorResult {
  late String message;
  late bool result;

  ValidatorResult({
    required this.result,
    this.message = '',
  });
}
