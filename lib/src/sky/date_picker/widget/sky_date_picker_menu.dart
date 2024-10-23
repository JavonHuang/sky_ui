part of '../index.dart';

class SkyDatePickerMenu extends StatefulWidget {
  const SkyDatePickerMenu({
    super.key,
    this.model,
    this.modelList,
    required this.size,
    required this.width,
    required this.pickerOptions,
    required this.type,
    this.onchanged,
  });
  final DateTime? model;
  final List<DateTime>? modelList;
  final SkySize size;
  final double width;
  final Function(DateTime e)? onchanged;
  final SkyPickerOptions pickerOptions;
  final SkyDatePickerType type;

  @override
  State<SkyDatePickerMenu> createState() => _SkyDatePickerMenuState();
}

class _SkyDatePickerMenuState extends State<SkyDatePickerMenu> {
  late String showType = "day"; //day,month,year
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
    if (widget.type == SkyDatePickerType.year || widget.type == SkyDatePickerType.years) {
      showType = "year";
    }
    if (widget.type == SkyDatePickerType.month || widget.type == SkyDatePickerType.months) {
      showType = "month";
    }
    if (widget.type == SkyDatePickerType.date || widget.type == SkyDatePickerType.dates || widget.type == SkyDatePickerType.week) {
      showType = "day";
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
    if (widget.type == SkyDatePickerType.year || widget.type == SkyDatePickerType.years) {
      setValue(DateTime(e, 1, 1));
      return;
    }
    setState(() {
      showType = "month";
      year = e;
    });
  }

  void selectMonth(int e) {
    if (widget.type == SkyDatePickerType.month) {
      setValue(DateTime(year, e, 1));
      return;
    }
    if (widget.type == SkyDatePickerType.months) {
      setValue(DateTime(year, e, 1));
      return;
    }
    setState(() {
      showType = "day";
      month = e;
    });
    initData();
  }

  void setValue(DateTime e) {
    if (widget.pickerOptions.disabledDate != null && widget.pickerOptions.disabledDate!.call(e)) {
      return;
    }
    widget.onchanged?.call(e);
  }

  BoxDecoration? getDayItemBoxDecoration(DateTime time) {
    if (widget.pickerOptions.disabledDate != null && widget.pickerOptions.disabledDate!.call(time)) {
      return BoxDecoration(
        color: SkyColors().disabledBg,
      );
    } else if (widget.type == SkyDatePickerType.week && widget.model != null) {
      List<DateTime> timeRange = SkyDataPickerUtils().weekToDayRange(widget.model!.year, SkyDataPickerUtils().getWeek(widget.model!));
      if (time.isAfter(timeRange[0]) && time.isBefore(timeRange[1])) {
        return BoxDecoration(
          color: SkyColors().defaultBg,
        );
      }
      if (time.isAtSameMomentAs(timeRange[0])) {
        return BoxDecoration(
          color: SkyColors().defaultBg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(widget.size.height),
            bottomLeft: Radius.circular(widget.size.height),
          ),
        );
      }
      if (time.isAtSameMomentAs(timeRange[1])) {
        return BoxDecoration(
          color: SkyColors().defaultBg,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(widget.size.height),
            bottomRight: Radius.circular(widget.size.height),
          ),
        );
      }
    } else {
      return BoxDecoration(
        color: SkyColors().white,
      );
    }
    return null;
  }

  Decoration? getItemMainDecoration(DateTime time) {
    if (widget.type == SkyDatePickerType.week && widget.model != null) {
      List<DateTime> timeRange = SkyDataPickerUtils().weekToDayRange(widget.model!.year, SkyDataPickerUtils().getWeek(widget.model!));
      if (time.isAtSameMomentAs(timeRange[0]) || time.isAtSameMomentAs(timeRange[1])) {
        return BoxDecoration(
          color: SkyColors().primary,
          borderRadius: BorderRadius.circular(
            widget.size.height,
          ),
        );
      }
    } else if (widget.model != null && time.isAtSameMomentAs(widget.model!)) {
      return BoxDecoration(
        color: SkyColors().primary,
        borderRadius: BorderRadius.circular(
          widget.size.height,
        ),
      );
    } else {
      return BoxDecoration(
        color: SkyColors().transparent,
      );
    }
    return null;
  }

  TextStyle? dayItemMainTextColor(DateTime time, bool content, bool h) {
    if (widget.type == SkyDatePickerType.dates) {
      if (widget.modelList != null && widget.modelList!.isNotEmpty) {
        for (DateTime item in widget.modelList!) {
          if (time == item) {
            return TextStyle(
              color: SkyColors().primary,
            );
          }
        }
      }
    }
    if (widget.type == SkyDatePickerType.week && widget.model != null) {
      List<DateTime> timeRange = SkyDataPickerUtils().weekToDayRange(widget.model!.year, SkyDataPickerUtils().getWeek(widget.model!));
      if (time.isAtSameMomentAs(timeRange[0]) || time.isAtSameMomentAs(timeRange[1])) {
        return TextStyle(
          color: SkyColors().white,
          fontWeight: FontWeight.w700,
        );
      } else {
        return TextStyle(color: h ? SkyColors().primary : SkyColors().regularText);
      }
    } else if (widget.model != null && time.isAtSameMomentAs(widget.model!)) {
      return TextStyle(
        color: SkyColors().white,
        fontWeight: FontWeight.w700,
      );
    } else if (!content) {
      return TextStyle(color: SkyColors().placeholderText);
    } else if (time.isAtSameMomentAs(today)) {
      return TextStyle(
        color: SkyColors().primary,
        fontWeight: FontWeight.w700,
      );
    } else {
      return TextStyle(color: h ? SkyColors().primary : SkyColors().regularText);
    }
  }

  Widget renderItem(DateTime time, bool content) {
    return Container(
      alignment: Alignment.center,
      height: widget.size.height,
      width: widget.size.height * itemScale,
      decoration: getDayItemBoxDecoration(time),
      margin: EdgeInsets.only(bottom: SkySpacings().textSpacing),
      child: SkyHover(
        disabled: widget.pickerOptions.disabledDate != null ? widget.pickerOptions.disabledDate!.call(time) : false,
        alignment: Alignment.center,
        onTap: () {
          setValue(time);
        },
        builder: (ctx, h, setvalue) {
          return Container(
            alignment: Alignment.center,
            height: widget.size.height * 0.8,
            width: widget.size.height * 0.8,
            decoration: getItemMainDecoration(time),
            child: Text(
              textAlign: TextAlign.center,
              time.day.toString(),
              style: TextStyle(
                fontSize: SkyFontSizes().auxiliaryFont,
              ).merge(dayItemMainTextColor(time, content, h)),
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
          builder: (ctx, h, setvalue) {
            TextStyle? yearItemTextColor;
            if (widget.model != null && e == widget.model!.year) {
              yearItemTextColor = TextStyle(
                color: SkyColors().primary,
              );
            } else if (e == today.year) {
              yearItemTextColor = TextStyle(
                color: SkyColors().primary,
                fontWeight: FontWeight.w700,
              );
            } else {
              yearItemTextColor = TextStyle(color: h ? SkyColors().primary : SkyColors().regularText);
            }
            return Container(
              alignment: Alignment.center,
              height: widget.size.height,
              width: widget.size.height * itemScale,
              decoration: dayItemBoxDecoration,
              child: Text(
                textAlign: TextAlign.center,
                e.toString(),
                style: TextStyle(
                  fontSize: SkyFontSizes().auxiliaryFont,
                ).merge(yearItemTextColor),
              ),
            );
          },
        ),
      );
    }).toList();
  }

  TextStyle? getMonthItemTextColor(bool onHover, int m) {
    if (widget.type == SkyDatePickerType.months) {
      if (widget.modelList != null && widget.modelList!.isNotEmpty) {
        for (DateTime item in widget.modelList!) {
          if (DateTime(year, m) == item) {
            return TextStyle(
              color: SkyColors().primary,
            );
          }
        }
      }
    }
    if (widget.model != null && DateTime(year, m) == DateTime(widget.model!.year, widget.model!.month)) {
      return TextStyle(
        color: SkyColors().primary,
      );
    } else if (DateTime(year, m) == DateTime(today.year, today.month)) {
      return TextStyle(
        color: SkyColors().primary,
        fontWeight: FontWeight.w700,
        fontSize: SkyFontSizes().auxiliaryFont,
      );
    } else {
      return TextStyle(
        color: onHover ? SkyColors().primary : SkyColors().regularText,
      );
    }
  }

  List<Widget> renderMonths() {
    List<Map<String, int>> monthList = SkyDataPickerUtils().getMontList();
    return monthList.map(
      (k) {
        int e = k[k.keys.first]!;
        String str = '${k.keys.first}月';
        return Container(
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
            builder: (ctx, h, setvalue) {
              return Text(
                textAlign: TextAlign.center,
                str,
                style: TextStyle(
                  fontSize: SkyFontSizes().auxiliaryFont,
                ).merge(getMonthItemTextColor(h, e)),
              );
            },
          ),
        );
      },
    ).toList();
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

  List<Widget> renderHeaderControls() {
    List<int> yearList = SkyDataPickerUtils().getYearList(year);

    return [
      SkyHover(
        disabled: false,
        onTap: preYear,
        builder: (ctx, h, setvalue) {
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
          builder: (ctx, h, setvalue) {
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
                builder: (ctx, h, setvalue) {
                  return Text(
                    "$year年",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: h ? SkyColors().primary : SkyColors().regularText,
                      fontWeight: FontWeight.w500,
                      fontSize: SkyFontSizes().titleSmallFont,
                    ),
                  );
                },
              ),
              SizedBox(
                width: SkySpacings().textSpacing,
              ),
              SkyHover(
                disabled: false,
                builder: (ctx, h, setvalue) {
                  return Text(
                    "$month月",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: h ? SkyColors().primary : SkyColors().regularText,
                      fontWeight: FontWeight.w500,
                      fontSize: SkyFontSizes().titleSmallFont,
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
                  fontSize: SkyFontSizes().titleSmallFont,
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
              SkyHover(
                disabled: false,
                onTap: () {
                  setState(() {
                    showType = "year";
                  });
                },
                builder: (ctx, h, setvalue) {
                  return Text(
                    "$year年",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: h ? SkyColors().primary : SkyColors().regularText,
                      fontWeight: FontWeight.w500,
                      fontSize: SkyFontSizes().titleSmallFont,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      if (showType == 'day')
        SkyHover(
          disabled: false,
          onTap: nextMonth,
          builder: (ctx, h, setvalue) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SkySpacings().textSpacing,
              ),
              child: Icon(
                color: h ? SkyColors().primary : SkyColors().primaryText,
                ElementIcons.arrowRight,
                size: SkyIconSizes().smallFont,
              ),
            );
          },
        ),
      SkyHover(
        disabled: false,
        onTap: nextYear,
        builder: (ctx, h, setvalue) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SkySpacings().textSpacing,
            ),
            child: Icon(
              color: h ? SkyColors().primary : SkyColors().primaryText,
              ElementIcons.dArrowRight,
              size: SkyIconSizes().smallFont,
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

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          if (widget.pickerOptions.shortcuts != null) renderQuickMenu(),
          SizedBox(
            width: widget.size.height * itemScale * 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
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
