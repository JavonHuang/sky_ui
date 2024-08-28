part of 'index.dart';

class SkyDatePickerRange<T> extends SkyFormFieldBridge<SkyDatePickerRange> {
  const SkyDatePickerRange({
    super.key,
    this.size = SkySize.small,
    this.disabled = false,
    this.clearable = false,
    this.placeholder,
    this.model,
    this.editable = false,
    this.pickerOptions,
    this.format,
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
  final T? model;
  final SkyDatePickerType? type;

  final bool editable;
  final SkyPickerOptions? pickerOptions;
  final String? format;
  @override
  SkyFormFieldBridgeState<SkyDatePickerRange> createState() => _SkyDatePickerRangeState<T>();
}

class _SkyDatePickerRangeState<T> extends SkyFormFieldBridgeState<SkyDatePickerRange> {
  TextEditingController textStartController = TextEditingController();
  TextEditingController textEndController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final MenuController menuController = MenuController();
  late SkyDatePickerRange<T> _widget = super.widget as SkyDatePickerRange<T>;

  late bool hasOpen = false;
  late bool onHover = false;

  late List<DateTime> value = [];
  bool get textIsNotEmpty => value.isNotEmpty;
  bool get showCloseIcon {
    return onHover && _widget.clearable && textIsNotEmpty && !super.disabled;
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

  onTap() {
    if (menuController.isOpen && focusNode.hasFocus) {
      menuController.close();
    } else {
      menuController.open();
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
      child: LayoutBuilder(builder: (_, constraints) {
        final optionWidth = constraints.maxWidth;
        return MenuAnchor(
          onOpen: () => setPopupIsOpen(true),
          onClose: () => setPopupIsOpen(false),
          controller: menuController,
          alignmentOffset: const Offset(0, 4),
          style: MenuStyle(
            // minimumSize: WidgetStatePropertyAll(
            //   Size(
            //     optionWidth,
            //     _widget.size.height * 7,
            //   ),
            // ),
            // maximumSize: WidgetStatePropertyAll(
            //   Size(
            //     optionWidth,
            //     _widget.size.height * 7,
            //   ),
            // ),
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
          menuChildren: [
            SkyDatePickerRangeMenu(
              size: _widget.size,
              width: optionWidth,
              modelList: value,
              type: _widget.type!,
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
      }),
    );
  }
}
