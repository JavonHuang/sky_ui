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
    this.editable = false,
    this.onChanged,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyRadio,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final bool disabled;
  final bool clearable;
  final String? placeholder;
  final SkyTimeSelectPickerOptions? pickerOptions;
  final bool arrowControl;
  final int? model;
  final bool editable;
  final Function(String)? onChanged;

  @override
  SkyFormFieldBridgeState<SkyTimePicker> createState() => _SkyTimePickerState();
}

class _SkyTimePickerState extends SkyFormFieldBridgeState<SkyTimePicker> with SingleTickerProviderStateMixin {
  SkyTimePicker get _widget => super.widget as SkyTimePicker;
  TextEditingController _textController = TextEditingController();
  late GlobalKey<SkyTimePickerControlItemState> picker = GlobalKey<SkyTimePickerControlItemState>();
  final FocusNode _focusNode = FocusNode();
  final MenuController _menuController = MenuController();

  late dynamic value = null;
  late List<String> showOptions = [];
  late bool onHover = false;
  late bool _hasOpen = false;
  bool get _textIsNotEmpty => value != null;

  bool get _showCloseIcon {
    return onHover && _widget.clearable && _textIsNotEmpty && !super.disabled;
  }

  @override
  void initState() {
    super.initState();
    initModel();
    setState(() {
      showOptions = SkyTimePickerUtils().createTimePickerOption(_widget.pickerOptions ?? SkyTimeSelectPickerOptions());
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

  @override
  void didUpdateWidget(SkyTimePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.model != _widget.model && mounted) {
      initModel();
    }
  }

  void initModel() {
    if (_widget.model != null) {
      _setSelectValue(SkyTimePickerUtils().microsecondsSinceEpochToString(
          _widget.model!, _widget.pickerOptions!.start ?? _widget.pickerOptions!.end ?? _widget.pickerOptions!.step ?? _widget.pickerOptions!.minTime ?? _widget.pickerOptions!.maxTime));
    } else {
      _setSelectValue("");
    }
  }

  void _onClear() {
    _textController.text = "";
    _menuController.close();
    setValue(null);
  }

  void _setSelectValue(String e) {
    _textController.text = e;
    value = e;
    setValue(e);
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
          key: picker,
          model: value ?? "",
          size: _widget.size,
          width: optionWidth - padding,
          pickerRangeOptions: SkyPickerRangeOptions(minTime: _widget.pickerOptions!.minTime, maxTime: _widget.pickerOptions!.maxTime),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SkyButton(
              type: SkyType.text,
              text: "取消",
              customTextColor: SkyColors().primaryText,
              onTap: () {
                _menuController.close();
              },
            ),
            SkyButton(
              type: SkyType.text,
              text: "确定",
              onTap: () {
                String? e = picker.currentState!.getValue();
                if (e != null && SkyTimePickerUtils().compareTimePickerOption(_widget.pickerOptions!.minTime, _widget.pickerOptions!.maxTime, e)) {
                  _setSelectValue(e);
                  _widget.onChanged?.call(e);
                  _menuController.close();
                }
              },
            )
          ],
        )
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
              _menuController.close();
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
      size: super.size,
      disabled: super.disabled,
      highlightBuilder: () {
        return _hasOpen;
      },
      onchanged: (e) {
        setState(() {
          onHover = e;
        });
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
                      readOnly: !_widget.editable,
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
