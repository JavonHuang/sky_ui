part of 'index.dart';

class SkyCheckboxGroup extends SkyFormFieldBridge<SkyCheckboxGroup> {
  const SkyCheckboxGroup({
    super.key,
    this.size = SkySize.small,
    this.disabled = false,
    this.onTap,
    this.model,
    this.buttonStyle,
    this.children = const <SkyCheckbox>[],
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyCheckboxGroup,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final bool disabled;
  final Function()? onTap;
  final String? model;
  final bool? buttonStyle;
  final List<SkyCheckbox> children;
  @override
  SkyFormFieldBridgeState<SkyCheckboxGroup> createState() => SkyCheckboxGroupState();

  static SkyCheckboxGroupState? maybeOf(BuildContext context) {
    final _SkyCheckboxGroupState? scope = context.dependOnInheritedWidgetOfExactType<_SkyCheckboxGroupState>();
    return scope?._buttonGroupState;
  }
}

class SkyCheckboxGroupState extends SkyFormFieldBridgeState<SkyCheckboxGroup> {
  late SkyCheckboxGroup _widget = super.widget as SkyCheckboxGroup;
  late String value = "";
  late List<GlobalKey<_SkyCheckboxState>> keys = [];

  List<Widget> _renderItem() {
    List<Widget> result = [];
    keys = [];
    for (int i = 0; i < _widget.children.length; i++) {
      GlobalKey<_SkyCheckboxState> key = GlobalKey<_SkyCheckboxState>();
      SkyCheckbox item = _widget.children[i];
      result.add(
        Container(
          padding: EdgeInsets.only(right: _widget.buttonStyle ?? item.buttonStyle ? 0 : 4.scaleSpacing),
          child: SkyCheckbox(
            key: key,
            size: item.size,
            text: item.text,
            disabled: item.disabled,
            onTap: item.onTap,
            model: false,
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
  void didUpdateWidget(SkyCheckboxGroup oldWidget) {
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
        keys[i].currentState?.setValue(true);
      } else {
        keys[i].currentState?.setValue(false);
      }
    }

    value = e;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero).then((e) => super.build(context));
    return _SkyCheckboxGroupState(
      buttonGroupState: this,
      child: Row(
        children: _renderItem(),
      ),
    );
  }
}

class _SkyCheckboxGroupState extends InheritedWidget {
  const _SkyCheckboxGroupState({
    required super.child,
    required SkyCheckboxGroupState buttonGroupState,
    SkyCheckboxGroup? choseSkyCheckboxGroup,
  })  : _buttonGroupState = buttonGroupState,
        _skyCheckboxGroup = choseSkyCheckboxGroup;

  final SkyCheckboxGroupState _buttonGroupState;
  final SkyCheckboxGroup? _skyCheckboxGroup;
  SkyCheckboxGroup get skyCheckboxGroup => _buttonGroupState._widget;

  @override
  bool updateShouldNotify(_SkyCheckboxGroupState old) => _skyCheckboxGroup != old._skyCheckboxGroup;
}
