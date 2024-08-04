part of 'index.dart';

class SkyRadio<T> extends SkyFormFieldBridge<SkyRadio> {
  const SkyRadio({
    super.key,
    this.size = SkySize.small,
    this.text,
    this.disabled = false,
    this.onTap,
    this.model,
    this.buttonStyle = false,
    required this.label,
    this.onChanged,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyRadio,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final String? text;
  final bool disabled;
  final Function()? onTap;
  final T? model;
  final bool buttonStyle;
  final T label;
  final Function(T label)? onChanged;

  @override
  SkyFormFieldBridgeState<SkyRadio> createState() => _SkyRadioState();
}

class _SkyRadioState<T> extends SkyFormFieldBridgeState<SkyRadio> {
  late SkyRadio _widget = super.widget as SkyRadio;

  late T value;

  late bool onHover = false;

  bool get checked => value == _widget.label;

  Color get outLineBorder => (onHover || checked) && !_widget.disabled ? SkyColors().primary : SkyColors().baseBorder;

  @override
  void initState() {
    super.initState();
    setState(() {
      value = _widget.model ?? "";
    });
  }

  @override
  void didUpdateWidget(SkyRadio oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.model != _widget.model && mounted) {
      setValue(_widget.model);
    }
  }

  @override
  void setValue(dynamic e) {
    setState(() {
      value = e;
    });
  }

  @override
  dynamic getValue() {
    return value;
  }

  BorderRadiusGeometry? get borderRadius {
    // if (ButtonGroup.maybeOf(context) != null) {
    //   return ButtonGroup.maybeOf(context)?.borderRadius(widget);
    // }
    // if (widget.round) {
    //   return BorderRadius.circular(
    //     MediaQuery.of(context).size.height * 0.25,
    //   );
    // } else if (widget.circle) {
    //   return BorderRadius.circular(
    //     MediaQuery.of(context).size.height * 0.5,
    //   );
    // } else {
    //   return SkyBorderRadius().normalBorderRadius;
    // }
    return SkyBorderRadius().normalBorderRadius;
  }

  Color? get bgColor {
    if (_widget.disabled) {
      return SkyColors().disabledBg;
    }
    if (checked) {
      return SkyColors().primary;
    } else {
      return SkyColors().white;
    }
  }

  Color get textColor {
    if (_widget.disabled) {
      return SkyColors().placeholderText;
    }

    if (checked) {
      return _widget.buttonStyle ? SkyColors().white : SkyColors().primaryText;
    } else if (!checked && onHover) {
      return SkyColors().primary;
    } else {
      return SkyColors().primaryText;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (SkyGroupRadio.maybeOf(context) == null) {
      super.build(context);
    } else {}
    return GestureDetector(
      onTap: () {
        if (_widget.disabled) {
          return;
        }
        _widget.onChanged?.call(checked ? "" : _widget.label);
        if (SkyGroupRadio.maybeOf(context) == null) {
          setValue(checked ? "" : _widget.label);
        }
        _widget.onTap?.call();
      },
      child: MouseRegion(
        cursor: _widget.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        onEnter: (e) {
          if (_widget.disabled) {
            return;
          }
          setState(() {
            onHover = true;
          });
        },
        onExit: (e) {
          if (_widget.disabled) {
            return;
          }
          setState(() {
            onHover = false;
          });
        },
        child: UnconstrainedBox(
          child: _widget.buttonStyle
              ? Container(
                  height: _widget.size.height,
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: Border.all(
                      width: 1,
                      color: checked ? SkyColors().primary : SkyColors().baseBorder,
                    ),
                    borderRadius: borderRadius,
                  ),
                  child: Padding(
                    padding: _widget.size.padding(),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _widget.text ?? '',
                            style: TextStyle(
                              fontSize: _widget.size.textSize,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container(
                  height: _widget.size.height,
                  // color: Colors.red,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: _widget.size.height * 0.4,
                          width: _widget.size.height * 0.4,
                          margin: EdgeInsets.only(right: 4.scaleSpacing),
                          decoration: BoxDecoration(
                            color: checked && !_widget.disabled ? SkyColors().primary : SkyColors().defaultBg,
                            border: Border.all(
                              width: 1,
                              color: outLineBorder,
                            ),
                            borderRadius: BorderRadius.circular(_widget.size.height * 0.25),
                          ),
                          child: Center(
                            child: Container(
                              height: _widget.size.height * 0.4 * 0.3,
                              width: _widget.size.height * 0.4 * 0.3,
                              decoration: BoxDecoration(
                                color: !_widget.disabled ? SkyColors().white : (checked ? SkyColors().placeholderText : SkyColors().defaultBg),
                                borderRadius: BorderRadius.circular(_widget.size.height * 0.2 * 0.3),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        _widget.text ?? '',
                        style: TextStyle(
                          fontSize: _widget.size.textSize,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
