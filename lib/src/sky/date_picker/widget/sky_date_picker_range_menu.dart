part of '../index.dart';

class SkyDatePickerRangeMenu extends StatefulWidget {
  const SkyDatePickerRangeMenu({
    super.key,
    this.modelList,
    required this.size,
    required this.width,
    required this.pickerOptions,
    required this.type,
    this.onchanged,
    required this.linkPanels,
  });
  final List<DateTime>? modelList;
  final SkySize size;
  final double width;
  final Function(List<DateTime> e)? onchanged;
  final SkyPickerOptions pickerOptions;
  final SkyDatePickerType type;
  final bool linkPanels;

  static _SkyDatePickerRangeMenuState? maybeOf(BuildContext context) {
    final _SkyDatePickerRangeMenuScope? scope = context.dependOnInheritedWidgetOfExactType<_SkyDatePickerRangeMenuScope>();
    return scope?._skyDatePickerRangeMenuState;
  }

  @override
  State<SkyDatePickerRangeMenu> createState() => _SkyDatePickerRangeMenuState();
}

class _SkyDatePickerRangeMenuState extends State<SkyDatePickerRangeMenu> {
  late GlobalKey<SkyDatePickerItemState> startPicker = GlobalKey<SkyDatePickerItemState>();
  late GlobalKey<SkyDatePickerItemState> endPicker = GlobalKey<SkyDatePickerItemState>();

  late List<DateTime> valueList = [];
  // ignore: avoid_init_to_null
  late DateTime? hoverTime = null;

  bool get linkPanels => widget.linkPanels;
  SkyDatePickerType get type => widget.type;

  int get year {
    if (valueList.isNotEmpty) {
      return valueList[0].year;
    }
    return SkyDataPickerUtils().year;
  }

  int get month {
    if (valueList.isNotEmpty) {
      return valueList[0].month;
    }
    return SkyDataPickerUtils().month;
  }

  Widget renderQuickMenu() {
    return Container(
      padding: widget.size.boxPadding,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 1,
            color: SkyColors().otherBorder,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...widget.pickerOptions.shortcutRange!.map(
            (e) => Padding(
              padding: EdgeInsets.symmetric(vertical: SkySpacings().textSpacing),
              child: SkyHover(
                disabled: false,
                onTap: () {
                  DateTime t = DateTime.now();
                  e.onTap(DateTime(t.year, t.month, t.day), setQuicKValue);
                },
                builder: (ctx, h, setvalue) {
                  return Text(
                    e.text,
                    style: TextStyle(
                      color: h ? SkyColors().primary : SkyColors().regularText,
                      fontSize: SkyFontSizes().textFont,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void preMonth(Key type) {
    if (type.hashCode == endPicker.hashCode) {
      startPicker.currentState!.preMonth(false);
    } else {
      endPicker.currentState!.preMonth(false);
    }
  }

  void nextMonth(Key type) {
    if (type.hashCode == endPicker.hashCode) {
      startPicker.currentState!.nextMonth(false);
    } else {
      endPicker.currentState!.nextMonth(false);
    }
  }

  void preYear(Key type) {
    if (type.hashCode == endPicker.hashCode) {
      startPicker.currentState!.preYear(false);
    } else {
      endPicker.currentState!.preYear(false);
    }
  }

  void nextYear(Key type) {
    if (type.hashCode == endPicker.hashCode) {
      startPicker.currentState!.nextYear(false);
    } else {
      endPicker.currentState!.nextYear(false);
    }
  }

  void refleshItem(Key type) {
    if (type.hashCode == endPicker.hashCode) {
      startPicker.currentState!.refleshItem();
    } else {
      endPicker.currentState!.refleshItem();
    }
  }

  void setValue(Key type, DateTime e) {
    if (valueList.length == 2) {
      valueList = [];
    }
    if (valueList.isEmpty) {
      valueList.add(e);
    } else {
      if (valueList[0].isAfter(e)) {
        valueList = [e, valueList[0]];
      } else {
        valueList = [valueList[0], e];
      }
    }
    if (valueList.length == 2) {
      widget.onchanged?.call(valueList);
    }
    setState(() {});
  }

  void setQuicKValue(List<DateTime> e) {
    if (e.length == 2) {
      valueList = e;
      widget.onchanged?.call(valueList);
    }
  }

  void setHoverTime(DateTime e) {
    setState(() {
      hoverTime = e;
    });
  }

  @override
  void initState() {
    super.initState();
    valueList = widget.modelList ?? [];
    setState(() {
      valueList = widget.modelList ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: _SkyDatePickerRangeMenuScope(
        skyDatePickerRangeMenuState: this,
        child: Row(
          children: [
            if (widget.pickerOptions.shortcutRange != null) renderQuickMenu(),
            SizedBox(
              width: SkySpacings().mainSpacing,
            ),
            SkyDatePickerItem(
              key: startPicker,
              size: widget.size,
              pickerOptions: widget.pickerOptions,
              initYear: year,
              initMonth: month,
              modelList: valueList,
            ),
            Container(
              width: 1,
              margin: EdgeInsets.symmetric(horizontal: SkySpacings().mainSpacing),
              color: SkyColors().baseBorder,
            ),
            SkyDatePickerItem(
              key: endPicker,
              size: widget.size,
              pickerOptions: widget.pickerOptions,
              initYear: widget.type == SkyDatePickerType.daterange ? year : year + 1,
              initMonth: month + 1,
              modelList: valueList,
            ),
            SizedBox(
              width: SkySpacings().mainSpacing,
            ),
          ],
        ),
      ),
    );
  }
}

class _SkyDatePickerRangeMenuScope extends InheritedWidget {
  const _SkyDatePickerRangeMenuScope({
    required super.child,
    required _SkyDatePickerRangeMenuState skyDatePickerRangeMenuState,
  }) : _skyDatePickerRangeMenuState = skyDatePickerRangeMenuState;

  final _SkyDatePickerRangeMenuState _skyDatePickerRangeMenuState;
  SkyDatePickerRangeMenu get buttonGroup => _skyDatePickerRangeMenuState.widget;

  @override
  bool updateShouldNotify(_SkyDatePickerRangeMenuScope old) => _skyDatePickerRangeMenuState != old._skyDatePickerRangeMenuState;
}
