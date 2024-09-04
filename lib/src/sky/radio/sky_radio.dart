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
    this.border = false,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyRadio,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final String? text;
  final bool disabled;
  final Function()? onTap;
  final String? model;
  final bool buttonStyle;
  final String label;
  final Function(String label)? onChanged;
  final bool border;

  @override
  SkyFormFieldBridgeState<SkyRadio> createState() => _SkyRadioState();
}

class _SkyRadioState<T> extends SkyFormFieldBridgeState<SkyRadio> {
  SkyRadio get _widget => super.widget as SkyRadio;

  late String value = "";

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
    if (SkyGroupRadio.maybeOf(context) != null) {
      int groupItemIndex = SkyGroupRadio.maybeOf(context)!.getItemGroupIndex(_widget.key);
      if (groupItemIndex == 0) {
        return BorderRadius.only(
          topLeft: SkyBorderRadius().normalCircular,
          bottomLeft: SkyBorderRadius().normalCircular,
        );
      } else if (groupItemIndex == SkyGroupRadio.maybeOf(context)!.childrenList.length - 1) {
        return BorderRadius.only(
          topRight: SkyBorderRadius().normalCircular,
          bottomRight: SkyBorderRadius().normalCircular,
        );
      } else {
        return null;
      }
    } else {
      return SkyBorderRadius().normalBorderRadius;
    }
  }

  BoxBorder? get border {
    if (SkyGroupRadio.maybeOf(context) != null) {
      int groupItemIndex = SkyGroupRadio.maybeOf(context)!.getItemGroupIndex(_widget.key);
      BorderSide b = BorderSide(
        width: 1.0,
        color: checked ? SkyColors().primary : SkyColors().baseBorder,
      );
      if (groupItemIndex == 0) {
        return Border(
          left: b,
          right: b,
          top: b,
          bottom: b,
        );
      } else if (groupItemIndex == SkyGroupRadio.maybeOf(context)!.childrenList.length - 1) {
        return Border(
          right: b,
          top: b,
          bottom: b,
        );
      } else {
        return Border(
          right: b,
          top: b,
          bottom: b,
        );
      }
    }
    return Border.all(
      width: 1,
      color: checked ? SkyColors().primary : SkyColors().baseBorder,
    );
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
      return _widget.buttonStyle ? SkyColors().white : SkyColors().primary;
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
        _widget.onChanged?.call(_widget.label);
        if (SkyGroupRadio.maybeOf(context) == null) {
          setValue(_widget.label);
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
                  // height: _widget.size.height,
                  decoration: BoxDecoration(
                    color: bgColor,
                    border: border,
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
                  // height: _widget.size.height,
                  padding: _widget.size.padding(),
                  decoration: _widget.border
                      ? BoxDecoration(
                          border: border,
                          borderRadius: borderRadius,
                        )
                      : null,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          height: _widget.size.height * 0.4,
                          width: _widget.size.height * 0.4,
                          margin: EdgeInsets.only(right: 10.scaleSpacing),
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
