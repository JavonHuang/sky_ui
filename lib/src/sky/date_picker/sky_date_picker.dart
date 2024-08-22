part of 'index.dart';

class SkyDatePicker extends SkyFormFieldBridge<SkyDatePicker> {
  const SkyDatePicker({
    super.key,
    this.size = SkySize.small,
    this.disabled = false,
    this.clearable = false,
    this.placeholder,
    this.model,
    this.editable = false,
    this.pickerOptions,
    this.format = "yyyy-MM-dd",
    this.type = SkyDatePickerType.date,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyDataPicker,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final bool disabled;
  final bool clearable;
  final String? placeholder;
  final int? model;
  final bool editable;
  final SkyPickerOptions? pickerOptions;
  final String? format;
  final SkyDatePickerType type;
  @override
  SkyFormFieldBridgeState<SkyDatePicker> createState() => _SkyDatePickerState();
}

class _SkyDatePickerState extends SkyFormFieldBridgeState<SkyDatePicker> {
  late SkyDatePicker _widget = super.widget as SkyDatePicker;
  TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final MenuController menuController = MenuController();

  late dynamic value = null;
  late bool onHover = false;
  late bool hasOpen = false;

  bool get textIsNotEmpty => value != null;

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
    textController.text = "";
    menuController.close();
    setValue(null);
  }

  onTap() {
    if (menuController.isOpen && focusNode.hasFocus) {
      menuController.close();
    } else {
      menuController.open();
    }
  }

  void setSelectValue(DateTime e) {
    textController.text = DateFormat(_widget.format).format(e);
    if (menuController.isOpen) {
      menuController.close();
    }
    setValue(e);
  }

  void initValue(int? number) {
    if (number != null && mounted) {
      DateTime t = DateTime.fromMillisecondsSinceEpoch(number);
      textController.text = DateFormat(_widget.format).format(t);
      setValue(DateTime(t.year, t.month, t.day));
    }
  }

  @override
  void initState() {
    super.initState();
    initValue(_widget.model);
  }

  @override
  void didUpdateWidget(SkyDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    SkyDatePicker widget = super.widget as SkyDatePicker;
    if (oldWidget.model != widget.model && mounted) {
      initValue(widget.model);
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
  Widget build(BuildContext context) {
    double padding = 10.scaleSpacing;
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
              visualDensity: VisualDensity.comfortable,
              side: WidgetStatePropertyAll(BorderSide(
                color: SkyColors().baseBorder,
                width: 1,
                style: BorderStyle.solid,
              )),
              backgroundColor: WidgetStatePropertyAll<Color>(SkyColors().white),
              surfaceTintColor: WidgetStatePropertyAll<Color>(SkyColors().white),
              padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: SkySpacings().mainSpacing, horizontal: padding)),
            ),
            menuChildren: [
              SkyDatePickerMenu(
                size: _widget.size,
                width: optionWidth,
                onchanged: setSelectValue,
                model: value,
                type: _widget.type,
                pickerOptions: _widget.pickerOptions ?? SkyPickerOptions(),
              ),
            ],
            builder: (context, controller, child) {
              return Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.scaleSpacing),
                    child: Icon(
                      color: SkyColors().baseBorder,
                      ElementIcons.date,
                      size: super.size.iconSize,
                    ),
                  ),
                  Expanded(
                    child: SkyBaseInput(
                      controller: textController,
                      focusNode: focusNode,
                      disabled: _widget.disabled,
                      readOnly: !_widget.editable,
                      size: _widget.size,
                      onTap: onTap,
                    ),
                  ),
                  if (showCloseIcon)
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
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode.dispose();
    super.dispose();
  }
}
