part of 'index.dart';

class SkyCheckboxGroup extends SkyFormFieldBridge<SkyCheckboxGroup> {
  const SkyCheckboxGroup({
    super.key,
    this.size = SkySize.small,
    this.disabled = false,
    this.onTap,
    this.model = const <String>[],
    this.buttonStyle = false,
    this.children = const <SkyCheckboxOption>[],
    this.onChanged,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyCheckboxGroup,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final bool disabled;
  final Function()? onTap;
  final List<String> model;
  final bool? buttonStyle;
  final List<SkyCheckboxOption> children;
  final Function(List<String> value)? onChanged;

  @override
  SkyFormFieldBridgeState<SkyCheckboxGroup> createState() => SkyCheckboxGroupState();

  static SkyCheckboxGroupState? maybeOf(BuildContext context) {
    final _SkyCheckboxGroupState? scope = context.dependOnInheritedWidgetOfExactType<_SkyCheckboxGroupState>();
    return scope?._buttonGroupState;
  }
}

class SkyCheckboxGroupState extends SkyFormFieldBridgeState<SkyCheckboxGroup> {
  SkyCheckboxGroup get _widget => super.widget as SkyCheckboxGroup;
  late List<String> value = [];
  late List<GlobalKey<_SkyCheckboxState>> keys = [];
  late List<_CheckOption> childrenList = [];

  List<Widget> _renderItem() {
    List<Widget> result = [];
    for (int i = 0; i < childrenList.length; i++) {
      _CheckOption item = childrenList[i];
      result.add(
        Container(
          padding: EdgeInsets.only(right: _widget.buttonStyle! ? 0 : 4.scaleSpacing),
          child: SkyCheckbox(
            key: item.key,
            size: _widget.size,
            text: item.option.text,
            disabled: item.option.disabled!,
            onTap: _widget.onTap,
            buttonStyle: _widget.buttonStyle!,
            label: item.option.label,
            model: item.model,
            onChanged: (e) {
              bool has = value.any((e) => e == item.option.label);
              !has ? value.add(item.option.label) : value.remove(item.option.label);
              setValue(value);
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
    value = [..._widget.model];
    for (SkyCheckboxOption item in _widget.children) {
      GlobalKey<_SkyCheckboxState> key = GlobalKey<_SkyCheckboxState>();
      bool model = value.any((e) => e == item.label);
      childrenList.add(_CheckOption(key: key, model: model, option: item));
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
  void didUpdateWidget(SkyCheckboxGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    SkyCheckboxGroup newWidget = super.widget as SkyCheckboxGroup;

    if (oldWidget != newWidget && mounted) {
      initView();
      if (oldWidget.model != newWidget.model && mounted) {
        setValue(newWidget.model);
      }
    }
  }

  @override
  getValue() {
    value = [];
    for (int i = 0; i < keys.length; i++) {
      bool checked = keys[i].currentState?.getValue();
      if (checked) {
        value.add(keys[i].currentState!._widget.label);
      }
    }
    return value;
  }

  @override
  void setValue(dynamic e) {
    e as List<String>;
    for (int i = 0; i < _widget.children.length; i++) {
      if (e.contains(_widget.children[i].label)) {
        keys[i].currentState?.setValue(true);
      } else {
        keys[i].currentState?.setValue(false);
      }
    }

    value = e;
    _widget.onChanged?.call(value);
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

class _CheckOption {
  final Key key;
  final bool model;
  final SkyCheckboxOption option;
  _CheckOption({
    required this.key,
    required this.model,
    required this.option,
  });
}
