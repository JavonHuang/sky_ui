part of 'index.dart';

class SkyDatePicker<T> extends SkyFormFieldBridge<SkyDatePicker> {
  const SkyDatePicker({
    super.key,
    this.size = SkySize.small,
    this.disabled = false,
    this.clearable = false,
    this.placeholder,
    this.model,
    this.editable = false,
    this.pickerOptions,
    this.format,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyDataPicker,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final bool disabled;
  final bool clearable;
  final String? placeholder;
  final SkyDatePickerModel<T>? model;

  final bool editable;
  final SkyPickerOptions? pickerOptions;
  final String? format;
  @override
  SkyFormFieldBridgeState<SkyDatePicker> createState() => _SkyDatePickerState();
}

class _SkyDatePickerState<T> extends SkyFormFieldBridgeState<SkyDatePicker> {
  late SkyDatePicker<T> _widget = super.widget as SkyDatePicker<T>;
  TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final MenuController menuController = MenuController();

  late dynamic value = null;
  late List<dynamic> valueList = [];

  late bool onHover = false;
  late bool hasOpen = false;

  SkyDatePickerModel<T> get initModel {
    if (_widget.model == null) {
      return SkyDatePickerModel<T>(SkyDatePickerType.date);
    } else {
      return _widget.model!;
    }
  }

  String get formatStr {
    if (_widget.format != null) {
      return _widget.format!;
    }
    if (_widget.model != null) {
      return _widget.model!.type.format;
    }
    return SkyDatePickerType.date.format;
  }

  SkyDatePickerType get type {
    if (_widget.model != null) {
      return _widget.model!.type;
    }
    return SkyDatePickerType.date;
  }

  bool get textIsNotEmpty => value != null;
  bool get textListIsNotEmpty => valueList.isNotEmpty;

  bool get showCloseIcon {
    if (type == SkyDatePickerType.months) {
      return onHover && _widget.clearable && textListIsNotEmpty && !super.disabled;
    }
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
    if (type == SkyDatePickerType.months) {
      setValue([]);
    } else {
      setValue(null);
    }
  }

  onTap() {
    if (menuController.isOpen && focusNode.hasFocus) {
      menuController.close();
    } else {
      menuController.open();
    }
  }

  void setSelectValue(DateTime e) {
    switch (initModel.type) {
      case SkyDatePickerType.year:
        textController.text = DateFormat(formatStr).format(e);
        setValue(e);
        break;
      case SkyDatePickerType.month:
        textController.text = DateFormat(formatStr).format(e);
        setValue(e);
      case SkyDatePickerType.date:
        textController.text = DateFormat(formatStr).format(e);
        setValue(e);
      case SkyDatePickerType.week:
        textController.text = formatStr.replaceAll("yyyy", e.year.toString()).replaceAll("ww", SkyDataPickerUtils().getWeek(e).toString());
        setValue(e);
        break;
      case SkyDatePickerType.months:
        int index = valueList.indexWhere((t) => t.isAtSameMomentAs(e));
        if (index > -1) {
          valueList.removeAt(index);
        } else {
          valueList.add(e);
        }
        List<String> strArr = [];
        for (DateTime item in valueList) {
          strArr.add(DateFormat(formatStr).format(item));
        }
        textController.text = strArr.join(',');
        setValue(valueList);
      default:
    }
    if (menuController.isOpen && initModel.type != SkyDatePickerType.months) {
      menuController.close();
    }
  }

  void initValue(SkyDatePickerModel<T>? mymodel) {
    if (mymodel == null || mymodel.value == null) {
      return;
    }
    if (mymodel.type == SkyDatePickerType.year || initModel.type == SkyDatePickerType.month || initModel.type == SkyDatePickerType.date) {
      DateTime t = DateTime.fromMillisecondsSinceEpoch(mymodel.value! as int);
      textController.text = DateFormat(formatStr).format(t);
      setValue(DateTime(t.year, t.month, t.day));
    } else if (mymodel.type == SkyDatePickerType.week) {
      String str = mymodel.value as String;
      List<int> arr = str.split("-").map((e) => int.parse(e)).cast<int>().toList();
      DateTime t = SkyDataPickerUtils().getDateTimeByWeek(arr[0], arr[1]);
      textController.text = formatStr.replaceAll("yyyy", t.year.toString()).replaceAll("ww", SkyDataPickerUtils().getWeek(t).toString());
      setValue(DateTime(t.year, t.month, t.day));
    } else if (mymodel.type == SkyDatePickerType.months) {
      List<int> v = mymodel.value as List<int>;
      List<String> strArr = [];
      List<DateTime> tList = [];
      for (int item in v) {
        DateTime t = DateTime.fromMillisecondsSinceEpoch(item);
        tList.add(t);
        strArr.add(DateFormat(formatStr).format(t));
      }
      textController.text = strArr.join(',');
      setValue(tList);
    }
  }

  @override
  void initState() {
    super.initState();
    initValue(initModel);
  }

  @override
  void didUpdateWidget(SkyDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    SkyDatePicker<T> widget = super.widget as SkyDatePicker<T>;
    if (oldWidget.model != widget.model && mounted) {
      initValue(widget.model);
    }
  }

  @override
  void setValue(dynamic e) {
    if (type == SkyDatePickerType.months) {
      setState(() {
        valueList = e;
      });
    } else {
      setState(() {
        value = e;
      });
    }
  }

  @override
  dynamic getValue() {
    if (type == SkyDatePickerType.months) {
      return valueList;
    } else {
      return value;
    }
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
                type: type,
                modelList: valueList.isNotEmpty ? valueList as List<DateTime> : [],
                pickerOptions: _widget.pickerOptions ?? SkyPickerOptions(),
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     SkyButton(
              //       type: SkyType.text,
              //       text: "确定",
              //       onTap: () {

              //       },
              //     )
              //   ],
              // )
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
