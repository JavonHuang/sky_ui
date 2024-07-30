part of 'sky_form.dart';

class SkyFormField extends StatefulWidget {
  const SkyFormField({
    super.key,
    required this.child,
    required this.label,
    this.required = false,
    required this.prop,
    this.rules,
    this.initialValue,
    this.labelWidth,
    this.restorationId,
  });
  final Widget child;
  final String label;
  final bool required;
  final String prop;
  final Rules? rules;
  final dynamic initialValue;
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
  late String itemType = "";
  late ValidatorResult _validatorResult = ValidatorResult(result: true, message: '');

  late SkyInput _skyInput;
  late SkyInputNumber _skyInputNumber;

  late TextEditingController _skyInputTextEditingController;

  double? get _labelWidth => widget.labelWidth ?? SkyForm.maybeOf(context)?.labelWidth;

  void register(e, String type, dynamic c) {
    itemType = type;
    switch (itemType) {
      case 'SkyInput':
        _skyInput = e;
        _skyInputTextEditingController = c;
        if ((widget.initialValue != null && widget.initialValue.toString().isNotEmpty) || _skyInput.model != null) {
          _skyInputTextEditingController.text = _skyInput.model!.isNotEmpty ? _skyInput.model! : widget.initialValue.toString();
        }
        break;
      case 'SkyInputNumber':
        _skyInputNumber = e;
        _skyInputTextEditingController = c;
        if ((widget.initialValue != null && widget.initialValue.toString().isNotEmpty) || (_skyInputNumber.model != null && _skyInputNumber.model.toString().isNotEmpty)) {
          String val = _skyInputNumber.model != null ? _skyInputNumber.model.toString() : widget.initialValue.toString();
          _skyInputTextEditingController.text = val.toDoubleText();
        }
        break;
    }
    SkyForm.maybeOf(context)?._register(this);
  }

  void clearValidate() {
    _validatorResult = ValidatorResult(result: true, message: '');
    setState(() {});
  }

  void resetField() {
    switch (itemType) {
      case 'SkyInput':
        if (widget.initialValue != null && widget.initialValue.toString().isNotEmpty) {
          _skyInputTextEditingController.text = widget.initialValue.toString();
        } else {
          _skyInputTextEditingController.text = '';
        }
        break;
      case 'SkyInputNumber':
        if (widget.initialValue != null && widget.initialValue.toString().isNotEmpty) {
          String val = widget.initialValue.toString();
          _skyInputTextEditingController.text = double.parse(val).getMaxPrecision(maxDigits: _skyInputNumber.precision).toString();
        } else {
          _skyInputTextEditingController.text = '';
        }
        break;
    }
    _validatorResult = ValidatorResult(result: true, message: '');
    setState(() {});
  }

  void setField(dynamic val) {
    switch (itemType) {
      case 'SkyInput':
        if (val != null) {
          _skyInputTextEditingController.text = val;
        } else {
          _skyInputTextEditingController.text = '';
        }
        break;
      case 'SkyInputNumber':
        if (double.tryParse(val) != null) {
          _skyInputTextEditingController.text = double.tryParse(val).toString();
        } else {
          _skyInputTextEditingController.text = '';
        }
        break;
    }
    _validatorResult = ValidatorResult(result: true, message: '');
    setState(() {});
  }

  Future<dynamic> validate() async {
    _validatorResult = ValidatorResult(result: true, message: '');
    if (_required && _skyInputTextEditingController.text.isEmpty) {
      _validatorResult = ValidatorResult(result: false, message: '请输入${widget.label}');
      setState(() {});
      return Future.value({"prop": widget.prop, "result": _validatorResult.result, "value": null});
    }
    _validatorResult = await _validator(_skyInputTextEditingController.text);
    setState(() {});
    dynamic value;
    switch (itemType) {
      case 'SkyInput':
        value = _skyInputTextEditingController.text;
        break;
      case 'SkyInputNumber':
        if (_skyInputTextEditingController.text.isNotEmpty) {
          value = double.parse(_skyInputTextEditingController.text);
        }
        break;
    }
    return Future.value({"prop": widget.prop, "result": _validatorResult.result, "value": value});
  }

  bool get _required {
    return widget.required || (widget.rules != null && widget.rules!.required);
  }

  Future<ValidatorResult> Function(dynamic e) get _validator {
    if (widget.rules == null) {
      return (e) {
        return Future.value(ValidatorResult(result: true, message: ''));
      };
    } else {
      return widget.rules!.validator;
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
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: _labelWidth,
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
                const Text(''),
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
