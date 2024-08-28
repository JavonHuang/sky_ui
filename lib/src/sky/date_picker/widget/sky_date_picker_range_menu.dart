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
  });
  final List<DateTime>? modelList;
  final SkySize size;
  final double width;
  final Function(DateTime e)? onchanged;
  final SkyPickerOptions pickerOptions;
  final SkyDatePickerType type;

  @override
  State<SkyDatePickerRangeMenu> createState() => _SkyDatePickerRangeMenuState();
}

class _SkyDatePickerRangeMenuState extends State<SkyDatePickerRangeMenu> {
  Widget renderQuickMenu() {
    return Container(
      width: widget.size.height * 3,
      padding: widget.size.boxPadding,
      // margin: EdgeInsets.only(
      //   right: SkySpacings().mainSpacing,
      // ),
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
                  // e.onTap(today, setValue);
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          if (widget.pickerOptions.shortcuts != null) renderQuickMenu(),
          SizedBox(
            width: SkySpacings().mainSpacing,
          ),
          SkyDatePickerItem(
            size: widget.size,
            pickerOptions: widget.pickerOptions,
          ),
          Container(
            width: 1,
            margin: EdgeInsets.symmetric(horizontal: SkySpacings().mainSpacing),
            color: SkyColors().baseBorder,
          ),
          SkyDatePickerItem(
            size: widget.size,
            pickerOptions: widget.pickerOptions,
          ),
          SizedBox(
            width: SkySpacings().mainSpacing,
          ),
        ],
      ),
    );
  }
}
