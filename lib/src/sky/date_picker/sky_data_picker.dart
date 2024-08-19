part of 'index.dart';

class SkyDataPicker extends SkyFormFieldBridge<SkyDataPicker> {
  const SkyDataPicker({
    super.key,
    this.size = SkySize.small,
    this.disabled = false,
    this.clearable = false,
    this.placeholder,
    this.model,
    this.editable = false,
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

  @override
  SkyFormFieldBridgeState<SkyDataPicker> createState() => _SkyDataPickerState();
}

class _SkyDataPickerState extends SkyFormFieldBridgeState<SkyDataPicker> {
  late SkyDataPicker _widget = super.widget as SkyDataPicker;
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

  Widget renderOptionItem(double optionWidth, double padding) {
    return Container(
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
    );
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
    double padding = 0;
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
            menuChildren: [
              renderOptionItem(optionWidth, padding * 2),
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
