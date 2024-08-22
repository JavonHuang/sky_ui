part of '../index.dart';

class SkyDatePickerMenu extends StatefulWidget {
  const SkyDatePickerMenu({
    super.key,
    this.model,
    required this.size,
    required this.width,
    required this.pickerOptions,
    required this.type,
    this.onchanged,
  });
  final DateTime? model;
  final SkySize size;
  final double width;
  final Function(DateTime e)? onchanged;
  final SkyPickerOptions pickerOptions;
  final SkyDatePickerType type;

  @override
  State<SkyDatePickerMenu> createState() => _SkyDatePickerMenuState();
}

class _SkyDatePickerMenuState extends State<SkyDatePickerMenu> {
  late String showType = "day";
  late double itemScale = 1.5;
  late int year = SkyDataPickerUtils().year;
  late int month = SkyDataPickerUtils().month;
  late DateTime today = DateTime(SkyDataPickerUtils().year, SkyDataPickerUtils().month, SkyDataPickerUtils().day);

  List<DateTime> prefixList = [];
  List<DateTime> suffixList = [];
  List<DateTime> contentList = [];

  @override
  void initState() {
    super.initState();
    if (widget.model != null) {
      year = widget.model!.year;
      month = widget.model!.month;
    }
    initData();
  }

  void initData() {
    Map<String, List<DateTime>> map = SkyDataPickerUtils().generateMonthDayShowItem(year, month);
    prefixList = map["prefixList"]!;
    suffixList = map["suffixList"]!;
    contentList = map["contentList"]!;

    setState(() {});
  }

  void preMonth() {
    if (month == 1) {
      month = 12;
      preYear();
    } else {
      month -= 1;
      initData();
    }
  }

  void nextMonth() {
    if (month == 12) {
      month = 1;
      nextYear();
    } else {
      month += 1;
      initData();
    }
  }

  void preYear() {
    if (showType == 'year') {
      year -= 10;
    } else {
      year -= 1;
    }
    initData();
  }

  void nextYear() {
    if (showType == 'year') {
      year += 10;
    } else {
      year += 1;
    }
    initData();
  }

  void selectYear(int e) {
    setState(() {
      showType = "month";
      year = e;
    });
  }

  void selectMonth(int e) {
    setState(() {
      showType = "day";
      month = e;
    });
    initData();
  }

  void setValue(DateTime day) {
    if (widget.pickerOptions.disabledDate != null && widget.pickerOptions.disabledDate!.call(day)) {
      return;
    }
    widget.onchanged?.call(day);
  }

  Widget renderItem(DateTime time, bool content) {
    BoxDecoration? dayItemBoxDecoration;
    if (widget.pickerOptions.disabledDate != null && widget.pickerOptions.disabledDate!.call(time)) {
      dayItemBoxDecoration = BoxDecoration(
        color: SkyColors().disabledBg,
      );
    } else {
      dayItemBoxDecoration = BoxDecoration(
        color: SkyColors().white,
      );
    }
    return Container(
      alignment: Alignment.center,
      height: widget.size.height,
      width: widget.size.height * itemScale,
      decoration: dayItemBoxDecoration,
      margin: EdgeInsets.only(bottom: SkySpacings().textSpacing),
      child: SkyHover(
        disabled: widget.pickerOptions.disabledDate != null ? widget.pickerOptions.disabledDate!.call(time) : false,
        alignment: Alignment.center,
        onTap: () {
          setValue(time);
        },
        builder: (ctx, h) {
          Decoration? decoration;
          if (widget.model != null && time.isAtSameMomentAs(widget.model!)) {
            decoration = BoxDecoration(
              color: SkyColors().primary,
              borderRadius: BorderRadius.circular(
                widget.size.height,
              ),
            );
          } else {
            decoration = BoxDecoration(
              color: SkyColors().transparent,
            );
          }
          TextStyle? dayItemTextColor;
          if (widget.model != null && time.isAtSameMomentAs(widget.model!)) {
            dayItemTextColor = TextStyle(
              color: SkyColors().white,
              fontWeight: FontWeight.w700,
            );
          } else if (!content) {
            dayItemTextColor = TextStyle(color: SkyColors().placeholderText);
          } else if (time.isAtSameMomentAs(today)) {
            dayItemTextColor = TextStyle(
              color: SkyColors().primary,
              fontWeight: FontWeight.w700,
            );
          } else {
            dayItemTextColor = TextStyle(color: h ? SkyColors().primary : SkyColors().regularText);
          }
          return Container(
            alignment: Alignment.center,
            height: widget.size.height * 0.8,
            width: widget.size.height * 0.8,
            decoration: decoration,
            child: Text(
              textAlign: TextAlign.center,
              time.day.toString(),
              style: TextStyle(
                fontSize: SkyFontSizes().s12,
              ).merge(dayItemTextColor),
            ),
          );
        },
      ),
    );
  }

  List<Widget> renderDays() {
    List<Widget> prefixWidget = prefixList.map((e) => renderItem(e, false)).toList();
    List<Widget> suffixWidget = suffixList.map((e) => renderItem(e, false)).toList();
    List<Widget> contentWidget = contentList.map((e) => renderItem(e, true)).toList();
    return [...prefixWidget, ...contentWidget, ...suffixWidget];
  }

  TextStyle yearItemTextColor(bool onHover, int y) {
    if (widget.model != null && y == widget.model!.year) {
      return TextStyle(
        color: SkyColors().primary,
        fontWeight: FontWeight.w700,
      );
    }
    return TextStyle(color: onHover ? SkyColors().primary : SkyColors().regularText);
  }

  List<Widget> renderYears() {
    List<int> yearList = SkyDataPickerUtils().getYearList(year);
    return yearList.map((e) {
      bool disabled = widget.pickerOptions.disabledDate != null ? widget.pickerOptions.disabledDate!.call(DateTime(e, 1, 1)) : false;
      BoxDecoration? dayItemBoxDecoration;
      if (disabled) {
        dayItemBoxDecoration = BoxDecoration(
          color: SkyColors().disabledBg,
        );
      } else {
        dayItemBoxDecoration = BoxDecoration(
          color: SkyColors().white,
        );
      }
      return Container(
        alignment: Alignment.center,
        height: widget.size.height * 2,
        width: widget.size.height * 2.5,
        child: SkyHover(
          disabled: disabled,
          alignment: Alignment.center,
          onTap: () {
            selectYear(e);
          },
          builder: (ctx, h) {
            return Container(
              alignment: Alignment.center,
              height: widget.size.height,
              width: widget.size.height * itemScale,
              decoration: dayItemBoxDecoration,
              child: Text(
                textAlign: TextAlign.center,
                e.toString(),
                style: TextStyle(
                  fontSize: SkyFontSizes().s12,
                ).merge(yearItemTextColor(h, e)),
              ),
            );
          },
        ),
      );
    }).toList();
  }

  List<Widget> renderMonths() {
    List<int> monthList = SkyDataPickerUtils().getMontList();
    return monthList
        .map((e) => Container(
              alignment: Alignment.center,
              height: widget.size.height * 2,
              width: widget.size.height * 2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  widget.size.height - 8,
                ),
              ),
              child: SkyHover(
                disabled: false,
                alignment: Alignment.center,
                onTap: () {
                  selectMonth(e);
                },
                builder: (ctx, h) {
                  return Text(
                    textAlign: TextAlign.center,
                    '${e.toString()}月',
                    style: TextStyle(
                      fontSize: SkyFontSizes().s12,
                    ).merge(yearItemTextColor(h, e)),
                  );
                },
              ),
            ))
        .toList();
  }

  List<Widget> renderHeaderTitle() {
    return SkyDataPickerUtils.headerTitle
        .map((e) => Container(
              alignment: Alignment.center,
              height: widget.size.height,
              width: widget.size.height * itemScale,
              child: Text(
                textAlign: TextAlign.center,
                e,
                style: TextStyle(color: SkyColors().primaryText),
              ),
            ))
        .toList();
  }

  List<Widget> renderHeaderYearControls() {
    List<int> yearList = SkyDataPickerUtils().getYearList(year);
    return [
      Expanded(child: Container()),
      Container(
        alignment: Alignment.center,
        height: widget.size.height,
        padding: EdgeInsets.symmetric(horizontal: SkySpacings().textSpacing),
        child: Text(
          textAlign: TextAlign.center,
          "${yearList[0]}年",
          style: TextStyle(color: SkyColors().primaryText),
        ),
      ),
      Text(
        textAlign: TextAlign.center,
        "-",
        style: TextStyle(color: SkyColors().primaryText),
      ),
      Container(
        alignment: Alignment.center,
        height: widget.size.height,
        padding: EdgeInsets.symmetric(horizontal: SkySpacings().textSpacing),
        child: Text(
          textAlign: TextAlign.center,
          "${yearList.last}年",
          style: TextStyle(color: SkyColors().primaryText),
        ),
      ),
      Expanded(child: Container()),
    ];
  }

  List<Widget> renderHeaderControls() {
    List<int> yearList = SkyDataPickerUtils().getYearList(year);

    return [
      SkyHover(
        disabled: false,
        onTap: preYear,
        builder: (ctx, h) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SkySpacings().textSpacing,
            ),
            child: Icon(
              color: h ? SkyColors().primary : SkyColors().primaryText,
              ElementIcons.dArrowLeft,
              size: widget.size.iconSize - 2.scaleIconSize,
            ),
          );
        },
      ),
      if (showType == 'day')
        SkyHover(
          disabled: false,
          onTap: preMonth,
          builder: (ctx, h) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SkySpacings().textSpacing,
              ),
              child: Icon(
                color: h ? SkyColors().primary : SkyColors().primaryText,
                ElementIcons.arrowLeft,
                size: widget.size.iconSize - 2.scaleIconSize,
              ),
            );
          },
        ),
      if (showType == 'day')
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SkyHover(
                disabled: false,
                onTap: () {
                  setState(() {
                    showType = "year";
                  });
                },
                builder: (ctx, h) {
                  return Text(
                    "$year年",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: h ? SkyColors().primary : SkyColors().regularText,
                      fontWeight: FontWeight.w500,
                      fontSize: SkyFontSizes().s16,
                    ),
                  );
                },
              ),
              SizedBox(
                width: SkySpacings().textSpacing,
              ),
              SkyHover(
                disabled: false,
                builder: (ctx, h) {
                  return Text(
                    "$month月",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: h ? SkyColors().primary : SkyColors().regularText,
                      fontWeight: FontWeight.w500,
                      fontSize: SkyFontSizes().s16,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      if (showType == 'year')
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${yearList[0]}年 - ${yearList.last}年",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: SkyColors().regularText,
                  fontWeight: FontWeight.w500,
                  fontSize: SkyFontSizes().s16,
                ),
              )
            ],
          ),
        ),
      if (showType == 'month')
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$year年",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: SkyColors().regularText,
                  fontWeight: FontWeight.w500,
                  fontSize: SkyFontSizes().s16,
                ),
              )
            ],
          ),
        ),
      if (showType == 'day')
        SkyHover(
          disabled: false,
          onTap: nextMonth,
          builder: (ctx, h) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SkySpacings().textSpacing,
              ),
              child: Icon(
                color: h ? SkyColors().primary : SkyColors().primaryText,
                ElementIcons.arrowRight,
                size: SkyFontSizes().s12,
              ),
            );
          },
        ),
      SkyHover(
        disabled: false,
        onTap: nextYear,
        builder: (ctx, h) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SkySpacings().textSpacing,
            ),
            child: Icon(
              color: h ? SkyColors().primary : SkyColors().primaryText,
              ElementIcons.dArrowRight,
              size: SkyFontSizes().s12,
            ),
          );
        },
      ),
    ];
  }

  Widget renderQuickMenu() {
    return Container(
      width: widget.size.height * 3,
      padding: widget.size.boxPadding,
      margin: EdgeInsets.only(
        right: SkySpacings().mainSpacing,
      ),
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
          ...widget.pickerOptions.shortcuts!.map(
            (e) => Padding(
              padding: EdgeInsets.symmetric(vertical: SkySpacings().textSpacing),
              child: SkyHover(
                disabled: false,
                onTap: () {
                  e.onTap(today, setValue);
                },
                builder: (ctx, h) {
                  return Text(
                    e.text,
                    style: TextStyle(
                      color: h ? SkyColors().primary : SkyColors().regularText,
                      fontSize: SkyFontSizes().s14,
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

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          if (widget.pickerOptions.shortcuts != null) renderQuickMenu(),
          Container(
            width: widget.size.height * itemScale * 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: widget.size.height,
                  child: Row(
                    children: renderHeaderControls(),
                  ),
                ),
                if (showType == 'day')
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: SkyColors().otherBorder,
                        ),
                      ),
                    ),
                    child: Row(
                      children: renderHeaderTitle(),
                    ),
                  ),
                Center(
                  child: Wrap(
                    spacing: 0,
                    runSpacing: 0,
                    direction: Axis.horizontal,
                    children: [
                      if (showType == 'day') ...renderDays(),
                      if (showType == 'year') ...renderYears(),
                      if (showType == 'month') ...renderMonths(),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
