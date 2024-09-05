part of 'index.dart';

class SkyGroupRadio extends SkyFormFieldBridge<SkyGroupRadio> {
  const SkyGroupRadio({
    super.key,
    this.size = SkySize.medium,
    this.disabled = false,
    this.onTap,
    this.model,
    this.buttonStyle = false,
    this.options = const <SkyRadioOption>[],
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyGroupRadio,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final bool disabled;
  final Function()? onTap;
  final String? model;
  final bool buttonStyle;
  final List<SkyRadioOption> options;
  @override
  SkyFormFieldBridgeState<SkyGroupRadio> createState() => SkyGroupRadioState();

  static SkyGroupRadioState? maybeOf(BuildContext context) {
    final _SkyGroupRadioState? scope = context.dependOnInheritedWidgetOfExactType<_SkyGroupRadioState>();
    return scope?._buttonGroupState;
  }
}

class SkyGroupRadioState extends SkyFormFieldBridgeState<SkyGroupRadio> {
  SkyGroupRadio get _widget => super.widget as SkyGroupRadio;
  late String? value = null;
  late List<GlobalKey<_SkyRadioState>> keys = [];
  late List<_RadioOption> childrenList = [];

  List<Widget> _renderItem() {
    List<Widget> result = [];
    for (int i = 0; i < childrenList.length; i++) {
      _RadioOption item = childrenList[i];
      result.add(
        Container(
          padding: EdgeInsets.only(right: _widget.buttonStyle! ? 0 : 4.scaleSpacing),
          child: SkyRadio(
            key: item.key,
            size: _widget.size,
            text: item.option.text,
            disabled: _widget.disabled ? _widget.disabled : item.option.disabled!,
            model: item.model,
            buttonStyle: _widget.buttonStyle,
            label: item.option.label,
            onChanged: (e) {
              // item.onChanged?.call(e);
              setValue(e);
            },
          ),
        ),
      );
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

  void initView() {
    childrenList = [];
    keys = [];
    value = _widget.model;
    for (SkyRadioOption item in _widget.options) {
      GlobalKey<_SkyRadioState> key = GlobalKey<_SkyRadioState>();
      childrenList.add(_RadioOption(key: key, model: value == item.label ? value : null, option: item));
      keys.add(key);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initView();
  }

  @override
  void didUpdateWidget(SkyGroupRadio oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget != _widget && mounted) {
      initView();
      if (oldWidget.model != _widget.model && mounted) {
        setValue(_widget.model);
      }
    }
  }

  @override
  getValue() {
    value = "";
    for (int i = 0; i < childrenList.length; i++) {
      value = childrenList[i].key.currentState?.getValue();
      if (value != '') {
        break;
      }
    }
    return value;
  }

  @override
  void setValue(dynamic e) {
    for (int i = 0; i < childrenList.length; i++) {
      if (e == childrenList[i].option.label) {
        childrenList[i].key.currentState?.setValue(e);
      } else {
        childrenList[i].key.currentState?.setValue("");
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

class _RadioOption {
  final GlobalKey<_SkyRadioState> key;
  final String? model;
  final SkyRadioOption option;
  _RadioOption({
    required this.key,
    required this.option,
    this.model,
  });
}
