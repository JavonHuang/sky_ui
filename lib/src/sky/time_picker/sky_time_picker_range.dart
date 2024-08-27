part of 'index.dart';

class SkyTimePickerRange extends SkyFormFieldBridge<SkyTimePickerRange> {
  const SkyTimePickerRange({
    super.key,
    this.size = SkySize.small,
    this.disabled = false,
    this.clearable = false,
    this.placeholder,
    this.model,
    this.editable = false,
    this.pickerRangeOptions,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyRadio,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final bool disabled;
  final bool clearable;
  final String? placeholder;
  final List<int>? model;
  final bool editable;
  final SkyPickerRangeOptions? pickerRangeOptions;

  @override
  SkyFormFieldBridgeState<SkyTimePickerRange> createState() => _SkyTimePickerRangeState();
}

class _SkyTimePickerRangeState extends SkyFormFieldBridgeState<SkyTimePickerRange> {
  TextEditingController textStartController = TextEditingController();
  TextEditingController textEndController = TextEditingController();

  final FocusNode focusNode = FocusNode();
  final MenuController menuController = MenuController();
  late GlobalKey<SkyTimePickerControlItemState> startPicker = GlobalKey<SkyTimePickerControlItemState>();
  late GlobalKey<SkyTimePickerControlItemState> endPicker = GlobalKey<SkyTimePickerControlItemState>();
  late double horizontal = 20.scaleSpacing;
  late double vertical = 0.scaleSpacing;
  late double space = 10.scaleSpacing;

  late SkyTimePickerRange _widget = super.widget as SkyTimePickerRange;
  late bool hasOpen = false;
  late bool onHover = false;

  late List<String> value = ["", ""];

  bool get textIsNotEmpty => value.isNotEmpty;

  bool get showCloseIcon {
    return onHover && _widget.clearable && textIsNotEmpty && !super.disabled;
  }

  void setPopupIsOpen(bool e) {
    if (e) {
      setState(() {
        hasOpen = true;
      });
    } else {
      setState(() {
        hasOpen = false;
      });
      focusNode.unfocus();
    }
  }

  void onClear() {
    if (!showCloseIcon) {
      return;
    }
    textStartController.text = "";
    textEndController.text = "";

    menuController.close();
    setValue(["", ""]);
  }

  void setSelectValue(List<String> e) {
    textStartController.text = e[0];
    textEndController.text = e[1];
    setValue(e);
  }

  onTap() {
    if (menuController.isOpen && focusNode.hasFocus) {
      menuController.close();
    } else {
      menuController.open();
    }
  }

  void confirm() {
    String? start = startPicker.currentState?.getValue();
    String? end = endPicker.currentState?.getValue();
    if (start != null && end != null) {
      if (SkyTimePickerUtils().compareTimePickerOption(_widget.pickerRangeOptions!.minTime, _widget.pickerRangeOptions!.maxTime, start) &&
          SkyTimePickerUtils().compareTimePickerOption(_widget.pickerRangeOptions!.minTime, _widget.pickerRangeOptions!.maxTime, end)) {
        setSelectValue([start, end]);
      }
    }
    menuController.close();
  }

  List<Widget> _renderOptionItem(double optionWidth) {
    return [
      Container(
        alignment: Alignment.center,
        height: _widget.size.height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                textAlign: TextAlign.center,
                "开始时间",
                style: TextStyle(
                  color: SkyColors().primaryText,
                  fontSize: _widget.size.textSize,
                ),
              ),
            ),
            Expanded(
                child: Text(
              textAlign: TextAlign.center,
              "开始时间",
              style: TextStyle(
                color: SkyColors().primaryText,
                fontSize: _widget.size.textSize,
              ),
            )),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SkyTimePickerControlItem(
            showBorder: true,
            padding: EdgeInsets.only(
              right: horizontal * 0.5,
              top: 0,
              left: horizontal,
              bottom: 0,
            ),
            key: startPicker,
            model: value[0],
            size: _widget.size,
            width: (optionWidth) * 0.5,
            pickerRangeOptions: _widget.pickerRangeOptions,
            onchanged: (e) {
              SkyPickerRangeOptions val = _widget.pickerRangeOptions!.copyWith();
              val.minTime = e;
              endPicker.currentState!.setPickerOptions(val);
            },
          ),
          SkyTimePickerControlItem(
            showBorder: true,
            padding: EdgeInsets.only(
              right: horizontal,
              top: 0,
              left: horizontal * 0.5,
              bottom: 0,
            ),
            key: endPicker,
            model: value[1],
            size: _widget.size,
            width: (optionWidth) * 0.5,
            pickerRangeOptions: _widget.pickerRangeOptions,
            onchanged: (e) {
              SkyPickerRangeOptions val = _widget.pickerRangeOptions!.copyWith();
              val.maxTime = e;
              startPicker.currentState!.setPickerOptions(val);
            },
          ),
        ],
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
              menuController.close();
            },
          ),
          SkyButton(
            type: SkyType.text,
            text: "确定",
            onTap: () {
              confirm();
            },
          )
        ],
      )
    ];
  }

  void initModel() {
    if (_widget.model != null) {
      setSelectValue([
        SkyTimePickerUtils().microsecondsSinceEpochToString(_widget.model![0], _widget.pickerRangeOptions!.minTime ?? _widget.pickerRangeOptions!.maxTime),
        SkyTimePickerUtils().microsecondsSinceEpochToString(_widget.model![1], _widget.pickerRangeOptions!.minTime ?? _widget.pickerRangeOptions!.maxTime),
      ]);
    } else {
      setSelectValue(["", ""]);
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

  @override
  void initState() {
    super.initState();
    initModel();
  }

  @override
  void didUpdateWidget(SkyTimePickerRange oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.model != _widget.model && mounted) {
      initModel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SkyInputOutLineHover(
      size: super.size,
      disabled: super.disabled,
      highlightBuilder: () {
        return hasOpen;
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
            onOpen: () => setPopupIsOpen(true),
            onClose: () => setPopupIsOpen(false),
            controller: menuController,
            alignmentOffset: const Offset(0, 4),
            style: MenuStyle(
              minimumSize: WidgetStatePropertyAll(
                Size(
                  optionWidth,
                  _widget.size.height * 7,
                ),
              ),
              maximumSize: WidgetStatePropertyAll(
                Size(
                  optionWidth,
                  _widget.size.height * 7,
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
              padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
            ),
            menuChildren: _renderOptionItem(optionWidth),
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
                      controller: textStartController,
                      focusNode: focusNode,
                      disabled: _widget.disabled,
                      readOnly: !_widget.editable,
                      size: _widget.size,
                      onTap: onTap,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "至",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: _widget.size.textSize),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.scaleSpacing),
                    child: Icon(
                      color: SkyColors().transparent,
                      ElementIcons.time,
                      size: super.size.iconSize,
                    ),
                  ),
                  Expanded(
                    child: SkyBaseInput(
                      controller: textEndController,
                      focusNode: focusNode,
                      disabled: _widget.disabled,
                      readOnly: !_widget.editable,
                      size: _widget.size,
                      onTap: onTap,
                    ),
                  ),
                  GestureDetector(
                    onTap: onClear,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.scaleSpacing,
                        ),
                        child: Icon(
                          color: showCloseIcon ? SkyColors().baseBorder : SkyColors().transparent,
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
}
