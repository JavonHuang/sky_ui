part of 'index.dart';

class SkyTimePicker extends SkyFormFieldBridge<SkyTimePicker> {
  const SkyTimePicker({
    super.key,
    this.size = SkySize.small,
    this.disabled = false,
    this.clearable = false,
    this.placeholder,
    this.pickerOptions,
    this.arrowControl = false,
    this.model,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyRadio,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final bool disabled;
  final bool clearable;
  final String? placeholder;
  final SkyPickerPptions? pickerOptions;
  final bool arrowControl;
  final int? model;
  @override
  SkyFormFieldBridgeState<SkyTimePicker> createState() => _SkyTimePickerState();
}

class _SkyTimePickerState extends SkyFormFieldBridgeState<SkyTimePicker> with SingleTickerProviderStateMixin {
  late SkyTimePicker _widget = super.widget as SkyTimePicker;
  TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final MenuController _menuController = MenuController();

  late GlobalKey<SkyInputOutLineHoverState> hoverKey = GlobalKey<SkyInputOutLineHoverState>();

  late dynamic value = null;
  late List<String> showOptions = [];

  late bool _hasOpen = false;
  bool get _textIsNotEmpty => value != null;

  bool get _showCloseIcon {
    return hoverKey.currentState!.onHover && _widget.clearable && _textIsNotEmpty && !super.disabled;
  }

  void _onClear() {
    _textController.text = "";
    _menuController.close();
    setValue(null);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      showOptions = SkyTimePickerUtils().createTimePickerOption(_widget.pickerOptions ?? SkyPickerPptions());
    });
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

  void _setSelectValue(String e) {
    _textController.text = e;
    value = e;
    setValue(e);
    _menuController.close();
  }

  _onTap() {
    if (_menuController.isOpen && _focusNode.hasFocus) {
      _menuController.close();
    } else {
      _menuController.open();
    }
  }

  Color? _selectTextColors(String e) {
    if (e == value) {
      return SkyColors().primary;
    } else {
      return SkyColors().primaryText;
    }
  }

  bool _selectShowIcon(String e) {
    if (e == value) {
      return true;
    } else {
      return false;
    }
  }

  List<Widget> _renderOptionItem(double optionWidth, double padding) {
    if (_widget.arrowControl) {
      return [
        SkyTimePickerControlItem(
          model: value ?? "",
          size: _widget.size,
          width: optionWidth - padding,
          pickerOptions: _widget.pickerOptions,
          confirm: (e) {
            _setSelectValue(e);
          },
        ),
      ];
    }
    if (showOptions.isEmpty) {
      return [
        Container(
          alignment: Alignment.center,
          width: optionWidth - padding,
          height: _widget.size.height,
          child: Text(
            "暂无数据",
            style: TextStyle(
              color: SkyColors().placeholderText,
              fontSize: _widget.size.textSize,
            ),
          ),
        )
      ];
    }
    return showOptions
        .map(
          (e) => SkyTimePickerItem(
            onTap: () {
              _setSelectValue(e);
            },
            disabled: !SkyTimePickerUtils().compareTimePickerOption(_widget.pickerOptions!.minTime, _widget.pickerOptions!.maxTime, e),
            label: e,
            width: optionWidth - padding,
            selectColor: _selectTextColors(e),
            height: _widget.size.height,
            showIcon: _selectShowIcon(e),
            iconSize: _widget.size.iconSize,
          ),
        )
        .toList();
  }

  void _setPopupIsOpen(bool e) {
    if (e) {
      setState(() {
        _hasOpen = true;
      });
    } else {
      setState(() {
        _hasOpen = false;
      });
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    double padding = 0;
    return SkyInputOutLineHover(
      key: hoverKey,
      size: super.size,
      disabled: super.disabled,
      highlightBuilder: () {
        return _hasOpen;
      },
      child: LayoutBuilder(
        builder: (_, constraints) {
          final optionWidth = constraints.maxWidth;
          return MenuAnchor(
            onOpen: () => _setPopupIsOpen(true),
            onClose: () => _setPopupIsOpen(false),
            controller: _menuController,
            alignmentOffset: const Offset(0, 4),
            style: MenuStyle(
              minimumSize: WidgetStatePropertyAll(
                Size(
                  optionWidth,
                  40,
                ),
              ),
              maximumSize: WidgetStatePropertyAll(
                Size(
                  optionWidth,
                  200,
                ),
              ),
              visualDensity: VisualDensity.comfortable,
              side: WidgetStatePropertyAll(BorderSide(
                color: SkyColors().baseBorder,
                width: 1,
                style: BorderStyle.solid,
              )),
              backgroundColor: WidgetStatePropertyAll<Color>(SkyColors().white),
              surfaceTintColor: WidgetStatePropertyAll<Color>(SkyColors().white),
              padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 0, horizontal: padding)),
            ),
            menuChildren: _renderOptionItem(optionWidth, padding * 2),
            builder: (context, controller, child) {
              return Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.scaleSpacing),
                    child: Icon(
                      color: SkyColors().baseBorder,
                      ElementIcons.time,
                      size: super.size.iconSize,
                    ),
                  ),
                  Expanded(
                    child: SkyBaseInput(
                      controller: _textController,
                      focusNode: _focusNode,
                      disabled: _widget.disabled,
                      readOnly: false,
                      size: _widget.size,
                      onTap: _onTap,
                    ),
                  ),
                  if (_showCloseIcon)
                    GestureDetector(
                      onTap: _onClear,
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
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
