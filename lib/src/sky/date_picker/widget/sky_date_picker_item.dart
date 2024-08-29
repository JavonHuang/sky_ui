part of '../index.dart';

class SkyDatePickerItem extends StatefulWidget {
  const SkyDatePickerItem({
    super.key,
    required this.initYear,
    required this.initMonth,
    required this.size,
    required this.pickerOptions,
    required this.modelList,
  });
  final int initYear;
  final int initMonth;
  final SkySize size;
  final SkyPickerOptions pickerOptions;
  final List<DateTime> modelList;

  @override
  State<SkyDatePickerItem> createState() => SkyDatePickerItemState();
}

class SkyDatePickerItemState extends State<SkyDatePickerItem> {
  late double itemScale = 1;
  late String showType = "day"; //day,month,year
  late int year = SkyDataPickerUtils().year;
  late int month = SkyDataPickerUtils().month;
  late DateTime today = DateTime(SkyDataPickerUtils().year, SkyDataPickerUtils().month, SkyDataPickerUtils().day);

  List<DateTime> prefixList = [];
  List<DateTime> suffixList = [];
  List<DateTime> contentList = [];

  void initData() {
    Map<String, List<DateTime>> map = SkyDataPickerUtils().generateMonthDayShowItem(year, month);
    prefixList = map["prefixList"]!;
    suffixList = map["suffixList"]!;
    contentList = map["contentList"]!;

    setState(() {});
  }

  void preMonth(bool linkPanel) {
    if (month == 1) {
      month = 12;
      preYear(linkPanel);
    } else {
      month -= 1;
      initData();
    }
    if (linkPanel) {
      SkyDatePickerRangeMenu.maybeOf(context)?.preMonth(widget.key!);
    }
  }

  void nextMonth(bool linkPanel) {
    if (month == 12) {
      month = 1;
      nextYear(linkPanel);
    } else {
      month += 1;
      initData();
    }
    if (linkPanel) {
      SkyDatePickerRangeMenu.maybeOf(context)?.nextMonth(widget.key!);
    }
  }

  void preYear(bool linkPanel) {
    if (showType == 'year') {
      year -= 10;
    } else {
      year -= 1;
    }
    initData();
    if (linkPanel) {
      SkyDatePickerRangeMenu.maybeOf(context)?.preYear(widget.key!);
    }
  }

  void nextYear(bool linkPanel) {
    if (showType == 'year') {
      year += 10;
    } else {
      year += 1;
    }
    initData();
    if (linkPanel) {
      SkyDatePickerRangeMenu.maybeOf(context)?.nextYear(widget.key!);
    }
  }

  void setValue(DateTime e) {
    if (widget.pickerOptions.disabledDate != null && widget.pickerOptions.disabledDate!.call(e)) {
      return;
    }
    SkyDatePickerRangeMenu.maybeOf(context)?.setValue(widget.key!, e);
  }

  List<Widget> renderHeaderControls() {
    List<int> yearList = SkyDataPickerUtils().getYearList(year);

    return [
      SkyHover(
        disabled: false,
        onTap: () {
          preYear(true);
        },
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
          onTap: () {
            preMonth(true);
          },
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
                  // setState(() {
                  //   showType = "year";
                  // });
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
            ],
          ),
        ),
      if (showType == 'day')
        SkyHover(
          disabled: false,
          onTap: () {
            nextMonth(true);
          },
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
        onTap: () {
          nextYear(true);
        },
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

  List<Widget> renderDays() {
    List<Widget> prefixWidget = prefixList.map((e) => renderItem(e, false)).toList();
    List<Widget> suffixWidget = suffixList.map((e) => renderItem(e, false)).toList();
    List<Widget> contentWidget = contentList.map((e) => renderItem(e, true)).toList();
    return [...prefixWidget, ...contentWidget, ...suffixWidget];
  }

  BoxDecoration? getDayItemBoxDecoration(DateTime time, bool content) {
    List<DateTime> ls = [];
    DateTime? hoverTime = SkyDatePickerRangeMenu.maybeOf(context)?.hoverTime;
    if (SkyDatePickerRangeMenu.maybeOf(context)?.valueList.length == 1 && hoverTime != null) {
      ls = [...SkyDatePickerRangeMenu.maybeOf(context)!.valueList];
      if (ls[0].isAfter(hoverTime)) {
        ls = [hoverTime, ls[0]];
      } else {
        ls.add(hoverTime);
      }
    }

    if (widget.modelList.length == 2) {
      ls = widget.modelList;
    }

    if (ls.length == 2 && content) {
      if (time.isAfter(ls[0]) && time.isBefore(ls[1])) {
        return BoxDecoration(
          color: SkyColors().primary.withOpacity(0.2),
        );
      }
      if (time.isAtSameMomentAs(ls[0])) {
        return BoxDecoration(
            color: SkyColors().primary.withOpacity(0.2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.size.height),
              bottomLeft: Radius.circular(widget.size.height),
            ));
      }
      if (time.isAtSameMomentAs(ls[1])) {
        return BoxDecoration(
            color: SkyColors().primary.withOpacity(0.2),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(widget.size.height),
              bottomRight: Radius.circular(widget.size.height),
            ));
      }
    }
    if (widget.pickerOptions.disabledDate != null && widget.pickerOptions.disabledDate!.call(time)) {
      return BoxDecoration(
        color: SkyColors().disabledBg,
      );
    } else {
      return BoxDecoration(
        color: SkyColors().white,
      );
    }
    return null;
  }

  bool isSelect(DateTime time) {
    if (widget.modelList.isEmpty) {
      return false;
    } else {
      for (DateTime item in widget.modelList) {
        if (item.isAtSameMomentAs(time) && time.month == month) {
          return true;
        }
      }
      return false;
    }
  }

  Decoration? getItemMainDecoration(DateTime time) {
    if (isSelect(time)) {
      return BoxDecoration(
        color: SkyColors().primary,
        borderRadius: BorderRadius.circular(
          widget.size.height,
        ),
      );
    }
    return BoxDecoration(
      color: SkyColors().transparent,
    );
  }

  TextStyle? dayItemMainTextColor(DateTime time, bool content, bool h) {
    if (!content) {
      return TextStyle(color: SkyColors().placeholderText);
    } else if (isSelect(time)) {
      return TextStyle(color: SkyColors().white);
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
      decoration: getDayItemBoxDecoration(time, content),
      margin: EdgeInsets.only(top: SkySpacings().textSpacing),
      child: SkyHover(
        disabled: widget.pickerOptions.disabledDate != null ? widget.pickerOptions.disabledDate!.call(time) : false,
        alignment: Alignment.center,
        onTap: () {
          if (content) {
            setValue(time);
          }
        },
        onchanged: (h) {
          if (h) {
            SkyDatePickerRangeMenu.maybeOf(context)?.setHoverTime(time);
          }
        },
        builder: (ctx, h) {
          return Container(
            alignment: Alignment.center,
            height: widget.size.height * 0.8,
            width: widget.size.height * 0.8,
            decoration: getItemMainDecoration(time),
            child: Text(
              textAlign: TextAlign.center,
              time.day.toString(),
              style: TextStyle(
                fontSize: SkyFontSizes().s12,
              ).merge(dayItemMainTextColor(time, content, h)),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    year = widget.initYear;
    month = widget.initMonth;

    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.height * itemScale * 7,
      margin: EdgeInsets.symmetric(vertical: SkySpacings().mainSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: widget.size.height,
            child: Row(
              children: renderHeaderControls(),
            ),
          ),
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
                // if (showType == 'year') ...renderYears(),
                // if (showType == 'month') ...renderMonths(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
