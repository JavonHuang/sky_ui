part of 'index.dart';

class SkyRadio extends SkyFormFieldBridge<SkyRadio> {
  const SkyRadio({
    super.key,
    this.size = SkySize.small,
    this.text,
    this.disabled = false,
    this.onTap,
    this.model = false,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyInput,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final String? text;
  final bool disabled;
  final Function()? onTap;
  final bool model;
  @override
  SkyFormFieldBridgeState<SkyRadio> createState() => _SkyRadioState();
}

class _SkyRadioState extends SkyFormFieldBridgeState<SkyRadio> {
  late SkyRadio _widget = super.widget as SkyRadio;

  late bool onHover = false;
  late bool value = false;

  Color get outLineBorder => (onHover || value) && !_widget.disabled ? SkyColors().primary : SkyColors().baseBorder;

  @override
  void initState() {
    super.initState();
    setValue(_widget.model);
  }

  @override
  void didUpdateWidget(SkyRadio oldWidget) {
    super.didUpdateWidget(oldWidget);
    SkyRadio widget = super.widget as SkyRadio;
    if (oldWidget.model != widget.model && mounted) {
      setValue(widget.model);
    }
  }

  @override
  void setValue(dynamic e) {
    setState(() {
      value = _widget.model;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_widget.disabled) {
          return;
        }
        setState(() {
          value = !value;
        });
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
        child: Container(
          height: _widget.size.height,
          color: Colors.red,
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
                    borderRadius: BorderRadius.circular(_widget.size.height * 0.25),
                  ),
                  child: Center(
                    child: Container(
                      height: _widget.size.height * 0.4 * 0.3,
                      width: _widget.size.height * 0.4 * 0.3,
                      decoration: BoxDecoration(
                        color: !_widget.disabled ? SkyColors().white : (value ? SkyColors().placeholderText : SkyColors().defaultBg),
                        // border: Border.all(
                        //   width: 0,
                        //   color: SkyColors().baseBorder,
                        // ),
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
                  // color: type.getTextColor(
                  //   context: context,
                  //   plain: _widget.plain,
                  //   onHover: onHover,
                  //   active: active,
                  //   disabled: _widget.disabled,
                  //   loading: _widget.loading,
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
