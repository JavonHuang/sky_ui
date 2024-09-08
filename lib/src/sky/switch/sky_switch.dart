part of 'index.dart';

class SkySwitch<T> extends SkyFormFieldBridge<SkySwitch> {
  const SkySwitch({
    super.key,
    this.size = SkySize.medium,
    this.disabled = false,
    this.activeText,
    this.inactiveText,
    this.model,
    this.activeValue,
    this.inactiveValue,
    this.activeColor,
    this.inactiveColor,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skySwitch,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final bool disabled;
  final String? activeText;
  final String? inactiveText;
  final T? model;
  final T? activeValue;
  final T? inactiveValue;
  final Color? activeColor;
  final Color? inactiveColor;
  @override
  SkyFormFieldBridgeState<SkySwitch> createState() => _SkySwitchState<T>();
}

class _SkySwitchState<T> extends SkyFormFieldBridgeState<SkySwitch> {
  SkySwitch get _widget => super.widget as SkySwitch;

  late bool value = false;
  late bool onHoverTrue = false;
  late bool onHoverFalse = false;

  Color get bgColor {
    if (value) {
      return _widget.activeColor ?? SkyColors().primary;
    } else {
      return _widget.inactiveColor ?? SkyColors().baseBorder;
    }
  }

  @override
  void initState() {
    super.initState();
    if (_widget.model != null) {
      setValue(_widget.model);
    }
  }

  @override
  void didUpdateWidget(SkySwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.model != _widget.model && mounted) {
      setValue(_widget.model);
    }
  }

  @override
  void setValue(dynamic e) {
    if (_widget.activeValue != null && _widget.inactiveValue != null) {
      if (e == _widget.activeValue) {
        setState(() {
          value = true;
        });
      } else {
        setState(() {
          value = false;
        });
      }
    } else {
      setState(() {
        value = e;
      });
    }
  }

  @override
  dynamic getValue() {
    if (_widget.activeValue != null && _widget.inactiveValue != null) {
      return value ? _widget.activeValue : _widget.inactiveValue;
    } else {
      return value;
    }
  }

  Widget renderText(String e, int w) {
    return GestureDetector(
      onTap: () {
        if (_widget.disabled) {
          return;
        }
        setValue(!value);
      },
      child: MouseRegion(
        cursor: _widget.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        child: Container(
          padding: _widget.size.contentPadding,
          child: Text(
            e,
            style: TextStyle(
              fontSize: _widget.size.textSize,
              color: ((w == 1 && !value) || (w == 2 && value)) ? SkyColors().primary : SkyColors().primaryText,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double cSize = _widget.size.height * 0.45;
    double bHeight = _widget.size.height * 0.5;
    double bWidth = _widget.size.height;
    double leftTrue = _widget.size.height * 0.5;
    double leftFalse = _widget.size.height * 0.05;
    super.build(context);
    return Container(
      child: Row(
        children: [
          if (_widget.inactiveText != null) renderText(_widget.inactiveText!, 1),
          GestureDetector(
            onTap: () {
              if (_widget.disabled) {
                return;
              }
              if (_widget.activeValue != null && _widget.inactiveValue != null) {
                setValue(!value ? _widget.activeValue : _widget.inactiveValue);
              } else {
                setValue(!value);
              }
            },
            child: MouseRegion(
              cursor: _widget.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
              child: UnconstrainedBox(
                child: Stack(
                  children: [
                    Container(
                      height: bHeight,
                      width: bWidth,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.25,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 200),
                      left: value ? leftTrue : leftFalse,
                      height: bHeight,
                      child: Center(
                        child: Container(
                          height: cSize,
                          width: cSize,
                          decoration: BoxDecoration(
                            color: SkyColors().white,
                            borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.height * 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_widget.activeText != null) renderText(_widget.activeText!, 2),
        ],
      ),
    );
  }
}
