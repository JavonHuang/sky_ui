part of 'index.dart';

class SkyGroupRadio<T> extends SkyFormFieldBridge<SkyGroupRadio> {
  const SkyGroupRadio({
    super.key,
    this.size = SkySize.small,
    this.disabled = false,
    this.onTap,
    this.model,
    this.buttonStyle = false,
    this.children = const <SkyRadio>[],
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyGroupRadio,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final bool disabled;
  final Function()? onTap;
  final T? model;
  final bool buttonStyle;
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

  List<Widget> _renderItem() {
    List<Widget> result = [];
    for (SkyRadio item in _widget.children) {
      result.add(Container(
        padding: EdgeInsets.only(right: 4.scaleSpacing),
        child: item,
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _SkyGroupRadioState(
      buttonGroupState: this,
      child: Row(
        children: _renderItem(),
      ),
    );
  }

  @override
  getValue() {
    // TODO: implement getValue
    return '';
  }

  @override
  void setValue(dynamic e) {
    setState(() {
      // value = e;
    });
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
