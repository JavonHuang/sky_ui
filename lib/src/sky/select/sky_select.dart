part of 'index.dart';

class SkySelect<T> extends SkyFormFieldBridge<SkySelect> {
  const SkySelect({
    super.key,
    this.model,
    this.size = SkySize.small,
    required this.options,
    this.disabled = false,
    this.readOnly = false,
    this.clearable = false,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyRadio,
          fieldDisabled: disabled,
        );
  final T? model;
  final SkySize size;
  final List<SkySelectOption<T>> options;
  final bool disabled;
  final bool readOnly;
  final bool clearable;

  @override
  SkyFormFieldBridgeState<SkySelect> createState() => _SkySelectState();
}

class _SkySelectState<T> extends SkyFormFieldBridgeState<SkySelect> {
  late SkySelect _widget = super.widget as SkySelect;

  TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final MenuController _menuController = MenuController();
  late T? value = null;
  late bool onHover = false;

  bool get _textIsNotEmpty => value != null;
  Color get outLineBorder => onHover ? SkyColors().primary : SkyColors().baseBorder;

  void setSelectValue(SkySelectOption<T> e) {
    _textController.text = e.label;
    _menuController.close();
    setValue(e.value);
  }

  bool get _showCloseIcon {
    return onHover && _widget.clearable && _textIsNotEmpty && !super.disabled;
  }

  void onClear() {
    _textController.text = "";
    _menuController.close();
    setValue(null);
  }

  @override
  void initState() {
    super.initState();
    // _focusNode.addListener(_focusNodeListener);
    if (_widget.model != null) {
      setState(_widget.model);
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

  // _focusNodeListener() {
  //   if (_focusNode.hasFocus) {
  //     setState(() {
  //       outLineBorder = SkyColors().primary;
  //     });
  //     _menuController.open();
  //   } else {
  //     Future.delayed(const Duration(milliseconds: 100)).then((e) {
  //       setState(() {
  //         outLineBorder = SkyColors().baseBorder;
  //       });
  //     });
  //     _menuController.close();
  //   }
  // }

  _onTap() {
    if (_menuController.isOpen && _focusNode.hasFocus) {
      _menuController.close();
    } else {
      _menuController.open();
    }
  }

  Color? selectBgColor(T e) {
    if (e == value) {
      return SkyColors().primary.withOpacity(0.4);
    }
    return SkyColors().white;
  }

  List<Widget> _renderOptionItem(double optionWidth, double padding) {
    return _widget.options
        .map(
          (e) => SkySelectItem(
            onTap: () {
              setSelectValue(e as SkySelectOption<T>);
            },
            disabled: _widget.disabled,
            label: e.label,
            width: optionWidth - padding,
            selectColor: e.value == value ? SkyColors().primary : SkyColors().primaryText,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    double padding = 10;
    return Container(
      height: super.size.height,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: outLineBorder,
        ),
        borderRadius: SkyBorderRadius().normalBorderRadius,
      ),
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
        child: LayoutBuilder(
          builder: (_, constraints) {
            final optionWidth = constraints.maxWidth;
            return Row(
              children: [
                Expanded(
                  child: MenuAnchor(
                    controller: _menuController,
                    alignmentOffset: const Offset(0, 4),
                    style: MenuStyle(
                      side: WidgetStatePropertyAll(BorderSide(
                        color: SkyColors().baseBorder,
                        width: 1,
                        style: BorderStyle.solid,
                      )),
                      backgroundColor: WidgetStatePropertyAll<Color>(SkyColors().white),
                      surfaceTintColor: WidgetStatePropertyAll<Color>(SkyColors().white),
                      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 10, horizontal: padding)),
                    ),
                    menuChildren: _renderOptionItem(optionWidth, padding * 2),
                    builder: (context, controller, child) {
                      return SkyBaseInput(
                        controller: _textController,
                        focusNode: _focusNode,
                        disabled: _widget.disabled,
                        readOnly: true,
                        size: _widget.size,
                        onTap: _onTap,
                      );
                    },
                  ),
                ),
                if (_showCloseIcon)
                  GestureDetector(
                    onTap: onClear,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.scaleSpacing,
                        ),
                        child: Icon(
                          color: SkyColors().baseBorder,
                          ElementIcons.circleClose,
                          size: super.size.iconSize,
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
