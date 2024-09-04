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
  // late String showType = "day"; //day,month,year
  late int year = SkyDataPickerUtils().year;
  late int month = SkyDataPickerUtils().month;
  late DateTime today = DateTime(SkyDataPickerUtils().year, SkyDataPickerUtils().month, SkyDataPickerUtils().day);

  List<DateTime> prefixList = [];
  List<DateTime> suffixList = [];
  List<DateTime> contentList = [];

  String get showType {
    if (SkyDatePickerRangeMenu.maybeOf(context)?.type == SkyDatePickerType.daterange) {
      return "day";
    }
    if (SkyDatePickerRangeMenu.maybeOf(context)?.type == SkyDatePickerType.monthrange) {
      return "month";
    }
    return "day";
  }

  void refleshItem() {
    setState(() {});
  }

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
    } else {
      SkyDatePickerRangeMenu.maybeOf(context)?.refleshItem(widget.key!);
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
    } else {
      SkyDatePickerRangeMenu.maybeOf(context)?.refleshItem(widget.key!);
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
    } else {
      SkyDatePickerRangeMenu.maybeOf(context)?.refleshItem(widget.key!);
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
    } else {
      SkyDatePickerRangeMenu.maybeOf(context)?.refleshItem(widget.key!);
    }
  }

  void setValue(DateTime e) {
    if (widget.pickerOptions.disabledDate != null && widget.pickerOptions.disabledDate!.call(e)) {
      return;
    }
    SkyDatePickerRangeMenu.maybeOf(context)?.setValue(widget.key!, e);
  }

  bool showControlsDisabled(String type, String btn) {
    if (SkyDatePickerRangeMenu.maybeOf(context)!.linkPanels) {
      return false;
    }
    SkyDatePickerItemState? start = SkyDatePickerRangeMenu.maybeOf(context)!.startPicker.currentState;
    SkyDatePickerItemState? end = SkyDatePickerRangeMenu.maybeOf(context)!.endPicker.currentState;
    if (start == null || end == null) {
      return false; // 或者根据具体需求返回合适的值
    }

    ///开始面板
    if (widget.key.hashCode == SkyDatePickerRangeMenu.maybeOf(context)!.startPicker.hashCode) {
      if (type == 'right') {
        if (btn == 'month') {
          if (!DateTime(start.year, start.month + 1).isBefore(DateTime(end.year, end.month))) {
            return true;
          } else {
            return false;
          }
        } else {
          if (!DateTime(start.year + 1).isBefore(DateTime(end.year))) {
            return true;
          } else {
            return false;
          }
        }
      }
      return false;
    } else {
      ///结束面板
      if (type == 'left') {
        if (btn == 'month') {
          DateTime endTime = DateTime(end.year, end.month - 1);
          if (end.month == 1) {
            endTime = DateTime(end.year - 1, 12);
          }
          if (!endTime.isAfter(DateTime(start.year, start.month))) {
            return true;
          } else {
            return false;
          }
        } else {
          if (!DateTime(end.year - 1).isAfter(DateTime(start.year))) {
            return true;
          } else {
            return false;
          }
        }
      } else {
        return false;
      }
    }
  }

  bool showControls(String type) {
    if (!SkyDatePickerRangeMenu.maybeOf(context)!.linkPanels) {
      return true;
    }
    if (widget.key.hashCode == SkyDatePickerRangeMenu.maybeOf(context)!.startPicker.hashCode) {
      if (type == 'left') {
        return true;
      } else {
        return false;
      }
    } else {
      if (type == 'left') {
        return false;
      } else {
        return true;
      }
    }
  }

  List<Widget> renderHeaderControls() {
    List<int> yearList = SkyDataPickerUtils().getYearList(year);
    bool linkPanels = SkyDatePickerRangeMenu.maybeOf(context)!.linkPanels;
    return [
      if (showControls('left'))
        SkyHover(
          disabled: showControlsDisabled('left', 'year'),
          onTap: () {
            preYear(linkPanels);
          },
          builder: (ctx, h) {
            Color? textColor = null;
            if (showControlsDisabled('left', 'year')) {
              textColor = SkyColors().placeholderText;
            } else {
              textColor = h ? SkyColors().primary : SkyColors().primaryText;
            }
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SkySpacings().textSpacing,
              ),
              child: Icon(
                color: textColor,
                ElementIcons.dArrowLeft,
                size: widget.size.iconSize - 2.scaleIconSize,
              ),
            );
          },
        ),
      if (showType == 'day' && showControls('left'))
        SkyHover(
          disabled: showControlsDisabled('left', 'month'),
          onTap: () {
            preMonth(linkPanels);
          },
          builder: (ctx, h) {
            Color? textColor = null;
            if (showControlsDisabled('left', 'month')) {
              textColor = SkyColors().placeholderText;
            } else {
              textColor = h ? SkyColors().primary : SkyColors().primaryText;
            }
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SkySpacings().textSpacing,
              ),
              child: Icon(
                color: textColor,
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
                builder: (ctx, h) {
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
                      fontSize: SkyFontSizes().titleSmallFont,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      if (showType == 'day' && showControls('right'))
        SkyHover(
          disabled: showControlsDisabled('right', 'month'),
          onTap: () {
            nextMonth(linkPanels);
          },
          builder: (ctx, h) {
            Color? textColor = null;
            if (showControlsDisabled('right', 'month')) {
              textColor = SkyColors().placeholderText;
            } else {
              textColor = h ? SkyColors().primary : SkyColors().primaryText;
            }
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SkySpacings().textSpacing,
              ),
              child: Icon(
                color: textColor,
                ElementIcons.arrowRight,
                size: SkyIconSizes().smallFont,
              ),
            );
          },
        ),
      if (showControls('right'))
        SkyHover(
          disabled: showControlsDisabled('right', 'year'),
          onTap: () {
            nextYear(linkPanels);
          },
          builder: (ctx, h) {
            Color? textColor = null;
            if (showControlsDisabled('right', 'year')) {
              textColor = SkyColors().placeholderText;
            } else {
              textColor = h ? SkyColors().primary : SkyColors().primaryText;
            }
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SkySpacings().textSpacing,
              ),
              child: Icon(
                color: textColor,
                ElementIcons.dArrowRight,
                size: SkyIconSizes().smallFont,
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
        if (item.isAtSameMomentAs(time)) {
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
                fontSize: SkyFontSizes().auxiliaryFont,
              ).merge(dayItemMainTextColor(time, content, h)),
            ),
          );
        },
      ),
    );
  }

  TextStyle? getMonthItemTextColor(bool onHover, int m) {
    // if (widget.type == SkyDatePickerType.months) {
    //   if (widget.modelList != null && widget.modelList!.isNotEmpty) {
    //     for (DateTime item in widget.modelList!) {
    //       if (DateTime(year, m) == item) {
    //         return TextStyle(
    //           color: SkyColors().primary,
    //         );
    //       }
    //     }
    //   }
    // }
    // if (widget.model != null && DateTime(year, m) == DateTime(widget.model!.year, widget.model!.month)) {
    //   return TextStyle(
    //     color: SkyColors().primary,
    //   );
    // } else
    if (DateTime(year, m) == DateTime(today.year, today.month)) {
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
          height: widget.size.height * 1,
          width: widget.size.height * 1.75,
          margin: EdgeInsets.only(top: SkySpacings().mainSpacing),

          decoration: getDayItemBoxDecoration(DateTime(year, e), true),

          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(
          //     widget.size.height - 8,
          //   ),
          // ),
          child: SkyHover(
            disabled: false,
            alignment: Alignment.center,
            onTap: () {
              // selectMonth(e);
              setValue(DateTime(year, e));
            },
            onchanged: (h) {
              if (h) {
                SkyDatePickerRangeMenu.maybeOf(context)?.setHoverTime(DateTime(year, e));
              }
            },
            builder: (ctx, h) {
              return Container(
                alignment: Alignment.center,
                height: widget.size.height * 1,
                // width: widget.size.height * 1,
                decoration: getItemMainDecoration(DateTime(year, e)),
                child: Text(
                  textAlign: TextAlign.center,
                  str,
                  style: TextStyle(
                    fontSize: SkyFontSizes().auxiliaryFont,
                  ).merge(dayItemMainTextColor(DateTime(year, e), true, h)),
                ),
              );
            },
          ),
        );
      },
    ).toList();
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
                if (showType == 'month') ...renderMonths(),

                // if (showType == 'year') ...renderYears(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
