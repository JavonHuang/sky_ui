part of 'index.dart';

class SkyCheckbox extends SkyFormFieldBridge<SkyCheckbox> {
  const SkyCheckbox({
    super.key,
    this.size = SkySize.small,
    this.text,
    this.disabled = false,
    this.onTap,
    this.model = false,
    required this.label,
    this.buttonStyle = false,
    this.onChanged,
    this.border = false,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyCheckbox,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final String? text;
  final bool disabled;
  final Function()? onTap;
  final bool model;
  final String label;
  final bool buttonStyle;

  final Function(bool label)? onChanged;
  final bool border;

  @override
  SkyFormFieldBridgeState<SkyCheckbox> createState() => _SkyCheckboxState();
}

class _SkyCheckboxState extends SkyFormFieldBridgeState<SkyCheckbox> {
  SkyCheckbox get _widget => super.widget as SkyCheckbox;
  late bool value = false;
  late bool onHover = false;

  Color get outLineBorder => (onHover || value) && !_widget.disabled ? SkyColors().primary : SkyColors().baseBorder;

  @override
  void initState() {
    super.initState();
    setState(() {
      value = _widget.model;
    });
  }

  @override
  void didUpdateWidget(SkyCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.model != _widget.model && mounted) {
      setValue(_widget.model);
    }
  }

  BoxBorder? get border {
    // if (SkyGroupRadio.maybeOf(context) != null) {
    //   int groupItemIndex = SkyGroupRadio.maybeOf(context)!.getItemGroupIndex(_widget.key);
    //   BorderSide b = BorderSide(
    //     width: 1.0,
    //     color: checked ? SkyColors().primary : SkyColors().baseBorder,
    //   );
    //   if (groupItemIndex == 0) {
    //     return Border(
    //       left: b,
    //       right: b,
    //       top: b,
    //       bottom: b,
    //     );
    //   } else if (groupItemIndex == SkyGroupRadio.maybeOf(context)!._widget.children.length - 1) {
    //     return Border(
    //       right: b,
    //       top: b,
    //       bottom: b,
    //     );
    //   } else {
    //     return Border(
    //       right: b,
    //       top: b,
    //       bottom: b,
    //     );
    //   }
    // }
    return Border.all(
      width: 1,
      color: value ? SkyColors().primary : SkyColors().baseBorder,
    );
  }

  BorderRadiusGeometry? get borderRadius {
    return SkyBorderRadius().normalBorderRadius;
    // if (SkyGroupRadio.maybeOf(context) != null) {
    //   int groupItemIndex = SkyGroupRadio.maybeOf(context)!.getItemGroupIndex(_widget.key);
    //   if (groupItemIndex == 0) {
    //     return BorderRadius.only(
    //       topLeft: SkyBorderRadius().normalCircular,
    //       bottomLeft: SkyBorderRadius().normalCircular,
    //     );
    //   } else if (groupItemIndex == SkyGroupRadio.maybeOf(context)!._widget.children.length - 1) {
    //     return BorderRadius.only(
    //       topRight: SkyBorderRadius().normalCircular,
    //       bottomRight: SkyBorderRadius().normalCircular,
    //     );
    //   } else {
    //     return null;
    //   }
    // } else {
    //   return SkyBorderRadius().normalBorderRadius;
    // }
  }

  Color? get bgColor {
    if (_widget.disabled) {
      return SkyColors().disabledBg;
    }
    if (value) {
      return SkyColors().primary;
    } else {
      return SkyColors().white;
    }
  }

  Color get textColor {
    if (_widget.disabled) {
      return SkyColors().placeholderText;
    }

    if (value) {
      return _widget.buttonStyle ? SkyColors().white : SkyColors().primary;
    } else {
      return SkyColors().primaryText;
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

  @override
  Widget build(BuildContext context) {
    if (SkyCheckboxGroup.maybeOf(context) == null) {
      super.build(context);
    }
    return GestureDetector(
      onTap: () {
        if (_widget.disabled) {
          return;
        }
        _widget.onChanged?.call(!value);
        if (SkyCheckboxGroup.maybeOf(context) == null) {
          setValue(!value);
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
                  height: _widget.size.height,
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
                          margin: EdgeInsets.only(right: 4.scaleSpacing),
                          decoration: BoxDecoration(
                            color: value && !_widget.disabled ? SkyColors().primary : SkyColors().defaultBg,
                            border: Border.all(
                              width: 1,
                              color: outLineBorder,
                            ),
                            borderRadius: SkyBorderRadius().smallBorderRadius,
                          ),
                          child: Center(
                            child: Icon(
                              ElementIcons.check,
                              size: _widget.size.textSize - 2.scaleFontSize,
                              color: SkyColors().white,
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
