part of '../index.dart';

class SkyDataPickerMenu extends StatefulWidget {
  const SkyDataPickerMenu({
    super.key,
    required this.size,
    required this.width,
    this.onchanged,
  });
  final SkySize size;
  final double width;
  final Function(DateTime e)? onchanged;

  @override
  State<SkyDataPickerMenu> createState() => _SkyDataPickerMenuState();
}

class _SkyDataPickerMenuState extends State<SkyDataPickerMenu> {
  late double itemScale = 1.5;
  late int year = SkyDataPickerUtils().year;
  late int month = SkyDataPickerUtils().month;
  List<DateTime> prefixList = [];
  List<DateTime> suffixList = [];
  List<DateTime> contentList = [];

  @override
  void initState() {
    super.initState();
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
    year -= 1;
    initData();
  }

  void nextYear() {
    year -= 1;
    initData();
  }

  void setValue(DateTime day) {
    widget.onchanged?.call(day);
  }

  Widget renderItem(DateTime time, bool content) {
    return Container(
      alignment: Alignment.center,
      height: widget.size.height,
      width: widget.size.height * itemScale,
      child: SkyHover(
        disabled: false,
        alignment: Alignment.center,
        showBackgroup: false,
        onTap: () {
          setValue(time);
        },
        builder: (ctx, h) {
          return Text(
            textAlign: TextAlign.center,
            time.day.toString(),
            style: TextStyle(
              color: content ? (h ? SkyColors().primary : SkyColors().regularText) : SkyColors().placeholderText,
              fontSize: SkyFontSizes().s12,
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
    return [
      SkyHover(
        disabled: false,
        showBackgroup: false,
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
      SkyHover(
        disabled: false,
        showBackgroup: false,
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
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SkyHover(
              disabled: false,
              showBackgroup: false,
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
              showBackgroup: false,
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
      SkyHover(
        disabled: false,
        showBackgroup: false,
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
        showBackgroup: false,
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

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: widget.size.height * 3,
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
                SkyHover(
                  disabled: false,
                  showBackgroup: false,
                  builder: (ctx, h) {
                    return Text(
                      "今天",
                      style: TextStyle(
                        color: h ? SkyColors().primary : SkyColors().regularText,
                        fontSize: SkyFontSizes().s14,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: SkySpacings().textSpacing,
                ),
                SkyHover(
                  disabled: false,
                  showBackgroup: false,
                  builder: (ctx, h) {
                    return Text(
                      "昨天",
                      style: TextStyle(
                        color: h ? SkyColors().primary : SkyColors().regularText,
                        fontSize: SkyFontSizes().s14,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: SkySpacings().textSpacing,
                ),
                SkyHover(
                  disabled: false,
                  showBackgroup: false,
                  builder: (ctx, h) {
                    return Text(
                      "一周前",
                      style: TextStyle(
                        color: h ? SkyColors().primary : SkyColors().regularText,
                        fontSize: SkyFontSizes().s14,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            width: SkySpacings().mainSpacing,
          ),
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
                      ...renderDays(),
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
