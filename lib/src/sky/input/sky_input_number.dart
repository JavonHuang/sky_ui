part of 'index.dart';

class SkyInputNumber extends SkyFormFieldBridge<SkyInputNumber> {
  const SkyInputNumber({
    super.key,
    this.leftIcon,
    this.rightIcon,
    this.controller,
    this.disabled = false,
    this.readOnly = false,
    this.size = SkySize.small,
    this.model,
    this.min,
    this.max,
    this.step = 1,
    this.precision = 0,
    this.placeholder,
    this.rightPosition = false,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyInputNumber,
          fieldDisabled: disabled,
        );
  final IconData? leftIcon;
  final IconData? rightIcon;
  final TextEditingController? controller;
  final bool disabled;
  final bool readOnly;
  final SkySize size;
  final double? model;
  final double? min;
  final double? max;
  final double step;
  final int precision;
  final String? placeholder;
  final bool rightPosition;

  @override
  SkyFormFieldBridgeState<SkyInputNumber> createState() => _SkyInputNumberState();
}

class _SkyInputNumberState extends SkyFormFieldBridgeState<SkyInputNumber> {
  SkyInputNumber get _widget => super.widget as SkyInputNumber;
  TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  late String _lastValue = "";
  late bool onMinusHover = false;
  late bool onPlusHover = false;
  late bool hasFocus = false;

  Color get outLineBorder => onMinusHover || onPlusHover || hasFocus ? SkyColors().primary : SkyColors().baseBorder;

  @override
  void initState() {
    if (_widget.controller != null) {
      _textController = _widget.controller!;
    }
    if (_widget.model != null) {
      setValue(_widget.model!.getMaxPrecision(maxDigits: _widget.precision).toString());
    } else {
      setValue("");
    }

    super.initState();
    _focusNode.addListener(_focusNodeListener);
  }

  _focusNodeListener() {
    String _text = _textController.text;
    if (_focusNode.hasFocus) {
      setState(() {
        hasFocus = true;
      });
      _lastValue = _text;
    } else {
      Future.delayed(const Duration(milliseconds: 100)).then((e) {
        setState(() {
          hasFocus = false;
        });
      });
      if (!_text.doubleTryParse && _text != "") {
        setValue(_lastValue);
        _textController.text = _lastValue;
      } else {
        if (_text == "") {
          setValue(_text);
        } else {
          double val = double.parse(_textController.text);
          _textController.text = val.getMaxPrecision(maxDigits: _widget.precision).toString();
          setValue(_textController.text);
        }
      }
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.removeListener(_focusNodeListener);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SkyInputNumber oldWidget) {
    super.didUpdateWidget(oldWidget);
    SkyInputNumber widget = super.widget as SkyInputNumber;
    if (oldWidget.model != widget.model && mounted) {
      setValue(widget.model.toString());
    }
  }

  void onClear() {
    setValue("");
  }

  void _onMinus() {
    double val = double.parse(_textController.text != '' ? _textController.text : '0') - _widget.step;
    if (_widget.min != null && val < _widget.min!) {
      return;
    }
    setValue(val.getMaxPrecision(maxDigits: _widget.precision).toString());
  }

  void _onPluss() {
    double val = double.parse(_textController.text != '' ? _textController.text : '0') + _widget.step;
    if (_widget.max != null && val > _widget.max!) {
      return;
    }
    setValue(val.getMaxPrecision(maxDigits: _widget.precision).toString());
  }

  void _onChanged(String e) {
    // if (_lastValue == "" && e.doubleTryParse) {
    //   _lastValue = e;
    // }
  }

  @override
  void setValue(dynamic e) {
    if (e != "" && !e.toString().doubleTryParse) {
      return;
    }
    _lastValue = e;
    _textController.text = e;
  }

  @override
  dynamic getValue() {
    return _textController.text;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget minusWidget = GestureDetector(
      onTap: _onMinus,
      child: MouseRegion(
        cursor: super.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        onEnter: (e) {
          if (super.disabled) {
            return;
          }
          setState(() {
            onMinusHover = true;
          });
        },
        onExit: (e) {
          if (super.disabled) {
            return;
          }
          setState(() {
            onMinusHover = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: SkyColors().defaultBg,
            border: _widget.rightPosition
                ? Border(
                    left: BorderSide(
                      width: 1,
                      color: SkyColors().baseBorder,
                    ),
                    top: BorderSide(
                      width: 1,
                      color: SkyColors().baseBorder,
                    ),
                  )
                : Border(
                    right: BorderSide(
                      width: 1,
                      color: SkyColors().baseBorder,
                    ),
                  ),
            borderRadius: _widget.rightPosition
                ? BorderRadius.only(
                    bottomRight: SkyBorderRadius().normalCircular,
                  )
                : BorderRadius.only(
                    topLeft: SkyBorderRadius().normalCircular,
                    bottomLeft: SkyBorderRadius().normalCircular,
                  ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.scaleSpacing),
            child: Center(
              child: Icon(
                color: onMinusHover ? SkyColors().primary : SkyColors().baseBorder,
                _widget.rightPosition ? ElementIcons.arrowDown : ElementIcons.plus,
                size: super.size.iconSize,
              ),
            ),
          ),
        ),
      ),
    );
    Widget plusWidget = GestureDetector(
      onTap: _onPluss,
      child: MouseRegion(
        cursor: super.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        onEnter: (e) {
          if (super.disabled) {
            return;
          }
          setState(() {
            onPlusHover = true;
          });
        },
        onExit: (e) {
          if (super.disabled) {
            return;
          }
          setState(() {
            onPlusHover = false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: SkyColors().defaultBg,
            border: Border(
              left: BorderSide(
                width: 1,
                color: SkyColors().baseBorder,
              ),
            ),
            borderRadius: _widget.rightPosition
                ? BorderRadius.only(
                    topRight: SkyBorderRadius().normalCircular,
                  )
                : BorderRadius.only(
                    topRight: SkyBorderRadius().normalCircular,
                    bottomRight: SkyBorderRadius().normalCircular,
                  ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.scaleSpacing),
            child: Center(
              child: Icon(
                color: onPlusHover ? SkyColors().primary : SkyColors().baseBorder,
                _widget.rightPosition ? ElementIcons.arrowUp : ElementIcons.plus,
                size: super.size.iconSize,
              ),
            ),
          ),
        ),
      ),
    );

    Widget intpuWidget = Expanded(
      child: SkyBaseInput(
        restorationId: restorationId,
        bucket: bucket,
        controller: _textController,
        focusNode: _focusNode,
        disabled: super.disabled,
        readOnly: _widget.readOnly,
        size: super.size,
        placeholder: _widget.placeholder,
        onChanged: _onChanged,
        textAlign: TextAlign.center,
      ),
    );
    return Container(
      height: super.size.height,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: outLineBorder,
        ),
        borderRadius: SkyBorderRadius().normalBorderRadius,
      ),
      child: _widget.rightPosition
          ? Row(
              children: [
                intpuWidget,
                Column(
                  children: [
                    plusWidget,
                    minusWidget,
                  ],
                )
              ],
            )
          : Row(
              children: [
                minusWidget,
                intpuWidget,
                plusWidget,
              ],
            ),
    );
  }
}
