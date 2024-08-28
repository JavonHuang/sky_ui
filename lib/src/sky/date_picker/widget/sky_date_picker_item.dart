part of '../index.dart';

class SkyDatePickerItem extends StatefulWidget {
  const SkyDatePickerItem({
    super.key,
    required this.size,
    required this.pickerOptions,
  });
  final SkySize size;
  final SkyPickerOptions pickerOptions;

  @override
  State<SkyDatePickerItem> createState() => _SkyDatePickerItemState();
}

class _SkyDatePickerItemState extends State<SkyDatePickerItem> {
  late double itemScale = 1.5;
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

  BoxDecoration? getDayItemBoxDecoration(DateTime time) {
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

  Decoration? getItemMainDecoration(DateTime time) {
    return BoxDecoration(
      color: SkyColors().transparent,
    );
  }

  TextStyle? dayItemMainTextColor(DateTime time, bool content, bool h) {
    if (!content) {
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
          // setValue(time);
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
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
