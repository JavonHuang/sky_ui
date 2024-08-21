part of '../index.dart';

class SkyDataPickerMenu extends StatefulWidget {
  const SkyDataPickerMenu({
    super.key,
    this.model,
    required this.size,
    required this.width,
    required this.pickerOptions,
    this.onchanged,
  });
  final DateTime? model;
  final SkySize size;
  final double width;
  final Function(DateTime e)? onchanged;
  final SkyPickerOptions pickerOptions;

  @override
  State<SkyDataPickerMenu> createState() => _SkyDataPickerMenuState();
}

class _SkyDataPickerMenuState extends State<SkyDataPickerMenu> {
  late double itemScale = 1.5;
  late int year = SkyDataPickerUtils().year;
  late int month = SkyDataPickerUtils().month;
  late DateTime today = DateTime(SkyDataPickerUtils().year, SkyDataPickerUtils().month, SkyDataPickerUtils().day);

  List<DateTime> prefixList = [];
  List<DateTime> suffixList = [];
  List<DateTime> contentList = [];
  List<Map<String, String>> quickMenu = [
    {
      "value": "today",
      "label": "今天",
    },
    {
      "value": "yesterday",
      "label": "昨天",
    },
    {
      "value": "weekAgo",
      "label": "一周前",
    },
  ];

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    if (widget.model != null) {
      year = widget.model!.year;
      month = widget.model!.month;
    }
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
    year += 1;
    initData();
  }

  void setValue(DateTime day) {
    widget.onchanged?.call(day);
  }

  void onQuickMenu(String type) {
    switch (type) {
      case "today":
        setValue(today);
        break;
      case "yesterday":
        setValue(today.subtract(const Duration(days: 1)));
        break;
      case "weekAgo":
        setValue(today.subtract(const Duration(days: 7)));
        break;
      default:
    }
  }

  TextStyle dayItemTextColor(bool onhover, bool content, DateTime e) {
    if (widget.model != null && e.isAtSameMomentAs(widget.model!)) {
      return TextStyle(
        color: SkyColors().white,
        fontWeight: FontWeight.w700,
      );
    }
    if (!content) {
      return TextStyle(color: SkyColors().placeholderText);
    }
    if (e.isAtSameMomentAs(today)) {
      return TextStyle(
        color: SkyColors().primary,
        fontWeight: FontWeight.w700,
      );
    } else {
      return TextStyle(color: onhover ? SkyColors().primary : SkyColors().regularText);
    }
  }

  Widget renderItem(DateTime time, bool content) {
    return Container(
      alignment: Alignment.center,
      height: widget.size.height - 8,
      width: widget.size.height - 8,
      margin: EdgeInsets.symmetric(horizontal: widget.size.height * (itemScale - 1) * 0.5 + 4, vertical: 4),
      decoration: BoxDecoration(
        color: widget.model != null && time.isAtSameMomentAs(widget.model!) ? SkyColors().primary : SkyColors().white,
        borderRadius: BorderRadius.circular(
          widget.size.height - 8,
        ),
      ),
      child: SkyHover(
        disabled: widget.pickerOptions.disabledDate != null ? widget.pickerOptions.disabledDate!.call(time) : false,
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
              fontSize: SkyFontSizes().s12,
            ).merge(dayItemTextColor(h, content, time)),
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

  Widget renderQuickMenu() {
    return Container(
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
          ...quickMenu.map(
            (e) => Padding(
              padding: EdgeInsets.symmetric(vertical: SkySpacings().textSpacing),
              child: SkyHover(
                disabled: false,
                showBackgroup: false,
                onTap: () {
                  onQuickMenu(e["value"]!);
                },
                builder: (ctx, h) {
                  return Text(
                    e["label"]!,
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
          renderQuickMenu(),
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
