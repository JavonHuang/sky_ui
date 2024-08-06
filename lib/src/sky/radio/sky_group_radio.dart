part of 'index.dart';

class SkyGroupRadio extends SkyFormFieldBridge<SkyGroupRadio> {
  const SkyGroupRadio({
    super.key,
    this.size = SkySize.small,
    this.disabled = false,
    this.onTap,
    this.model,
    this.buttonStyle,
    this.children = const <SkyRadio>[],
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyGroupRadio,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final bool disabled;
  final Function()? onTap;
  final String? model;
  final bool? buttonStyle;
  final List<SkyRadio> children;
  @override
  SkyFormFieldBridgeState<SkyGroupRadio> createState() => SkyGroupRadioState();

  static SkyGroupRadioState? maybeOf(BuildContext context) {
    final _SkyGroupRadioState? scope = context.dependOnInheritedWidgetOfExactType<_SkyGroupRadioState>();
    return scope?._buttonGroupState;
  }
}

class SkyGroupRadioState extends SkyFormFieldBridgeState<SkyGroupRadio> {
  late SkyGroupRadio _widget = super.widget as SkyGroupRadio;
  late String value = "";
  late List<GlobalKey<_SkyRadioState>> keys = [];

  List<Widget> _renderItem() {
    List<Widget> result = [];
    keys = [];
    for (int i = 0; i < _widget.children.length; i++) {
      GlobalKey<_SkyRadioState> key = GlobalKey<_SkyRadioState>();
      SkyRadio item = _widget.children[i];
      result.add(
        Container(
          padding: EdgeInsets.only(right: _widget.buttonStyle ?? item.buttonStyle ? 0 : 4.scaleSpacing),
          child: SkyRadio(
            key: key,
            size: item.size,
            text: item.text,
            disabled: item.disabled,
            onTap: item.onTap,
            model: (value != '' ? value : item.model) == item.label ? item.label : "",
            buttonStyle: _widget.buttonStyle ?? item.buttonStyle,
            label: item.label,
            onChanged: (e) {
              item.onChanged?.call(e);
              setValue(e);
            },
          ),
        ),
      );
      keys.add(key);
    }
    return result;
  }

  int getItemGroupIndex(Key? index) {
    int result = -1;
    for (int i = 0; i < keys.length; i++) {
      if (index.hashCode == keys[i].hashCode) {
        result = i;
        break;
      }
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(SkyGroupRadio oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.model != _widget.model && mounted) {
      setValue(_widget.model);
    }
  }

  @override
  getValue() {
    value = "";
    for (int i = 0; i < keys.length; i++) {
      value = keys[i].currentState?.getValue();
      if (value != '') {
        break;
      }
    }
    return value;
  }

  @override
  void setValue(dynamic e) {
    for (int i = 0; i < _widget.children.length; i++) {
      if (e == _widget.children[i].label) {
        keys[i].currentState?.setValue(e);
      } else {
        keys[i].currentState?.setValue("");
      }
    }

    value = e;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero).then((e) => super.build(context));

    return _SkyGroupRadioState(
      buttonGroupState: this,
      child: Row(
        children: _renderItem(),
      ),
    );
  }
}

class _SkyGroupRadioState extends InheritedWidget {
  const _SkyGroupRadioState({
    required super.child,
    required SkyGroupRadioState buttonGroupState,
    SkyGroupRadio? choseSkyGroupRadio,
  })  : _buttonGroupState = buttonGroupState,
        _skyGroupRadio = choseSkyGroupRadio;

  final SkyGroupRadioState _buttonGroupState;
  final SkyGroupRadio? _skyGroupRadio;
  SkyGroupRadio get skyGroupRadio => _buttonGroupState._widget;

  @override
  bool updateShouldNotify(_SkyGroupRadioState old) => _skyGroupRadio != old._skyGroupRadio;
}
