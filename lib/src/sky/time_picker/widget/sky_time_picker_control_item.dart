import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sky_ui/sky_ui.dart';

import '../../common/sky_hover.dart';
import '../model/sky_time_picker_utils.dart';

class SkyTimePickerControlItem extends StatefulWidget {
  const SkyTimePickerControlItem({
    super.key,
    this.onTap,
    this.onchanged,
    this.cancel,
    required this.size,
    required this.width,
    required this.pickerRangeOptions,
    required this.model,
    this.padding,
    this.showBorder = false,
  });
  final Function()? onTap;
  final double width;
  final SkyPickerRangeOptions? pickerRangeOptions;
  final SkySize size;
  final Function(String e)? onchanged;
  final Function()? cancel;
  final String model;
  final EdgeInsetsGeometry? padding;
  final bool showBorder;

  @override
  State<SkyTimePickerControlItem> createState() => SkyTimePickerControlItemState();
}

class SkyTimePickerControlItemState extends State<SkyTimePickerControlItem> {
  FixedExtentScrollController hourScrollController = FixedExtentScrollController(initialItem: 0);
  FixedExtentScrollController minitScrollController = FixedExtentScrollController(initialItem: 0);
  FixedExtentScrollController secendScrollController = FixedExtentScrollController(initialItem: 0);
  String? hour = "00";
  String? minit = "00";
  String? secend = "00";
  late SkyPickerRangeOptions pickerOptions = SkyPickerRangeOptions();

  String get value =>
      "${'${hourScrollController.selectedItem}'.padLeft(2, '0')}:${'${minitScrollController.selectedItem}'.padLeft(2, '0')}:${'${secendScrollController.selectedItem}'.padLeft(2, '0')}";

  @override
  void initState() {
    super.initState();
    pickerOptions = widget.pickerRangeOptions!;
    Future.delayed(Duration.zero).then((e) {
      setValue(widget.model);
    });
  }

  void setPickerOptions(SkyPickerRangeOptions e) {
    pickerOptions = e;
    setState(() {});
  }

  void _onchanged() {
    widget.onchanged?.call(value);
  }

  void setValue(String e) {
    List<int> list = SkyTimePickerUtils().getStrToList(e);
    if (list.length == 2) {
      hourScrollController.jumpToItem(list[0]);
      minitScrollController.jumpToItem(list[1]);
      return;
    }
    if (list.length == 3) {
      hourScrollController.jumpToItem(list[0]);
      minitScrollController.jumpToItem(list[1]);
      secendScrollController.jumpToItem(list[2]);
      return;
    }
    hourScrollController.jumpToItem(3);
    minitScrollController.jumpToItem(3);
    secendScrollController.jumpToItem(3);
  }

  bool checkRange(String value, String type) {
    if (type == "hour") {
      List<int> arr = SkyTimePickerUtils().getStrToList(pickerOptions.minTime);
      int minHour = arr.isEmpty ? 0 : arr[0];
      int maxHour = arr.isEmpty ? 23 : arr[0];
      return !(int.parse(value) >= minHour && int.parse(value) <= maxHour);
    }
    if (type == "minit") {
      String str = "$hour:$value:59";
      return !SkyTimePickerUtils().compareTimePickerOption(pickerOptions.minTime, pickerOptions.maxTime, str);
    }
    if (type == "secend") {
      String str = "$hour:$minit:$value";
      return !SkyTimePickerUtils().compareTimePickerOption(pickerOptions.minTime, pickerOptions.maxTime, str);
    }
    return true;
  }

  String? getValue() {
    if (SkyTimePickerUtils().compareTimePickerOption(pickerOptions.minTime, pickerOptions.maxTime, value)) {
      return value;
    } else {
      return null;
    }
  }

  Widget renderSelector(FixedExtentScrollController controller, int count, String type) {
    double magnification = 1.1; // 放大倍数
    bool useMagnifier = false; // 启用放大镜效果
    double itemExtent = widget.size.height; // 每个项目的高度
    double perspective = 0.0000000001; //属性表示圆柱投影透视图，值越大，渲染效果越圆
    double offAxisFraction = 0; //属性表示车轮水平偏离中心的程度，左右距离
    double overAndUnderCenterOpacity = 0.8;
    double squeeze = 1;
    return Expanded(
      child: ListWheelScrollView(
        perspective: perspective,
        offAxisFraction: offAxisFraction,
        controller: controller,
        useMagnifier: useMagnifier,
        magnification: magnification,
        itemExtent: itemExtent,
        squeeze: squeeze,
        overAndUnderCenterOpacity: overAndUnderCenterOpacity,
        onSelectedItemChanged: (e) {
          _onchanged();
          if (type == "hour") {
            setState(() {
              hour = '$e'.padLeft(2, '0');
            });
          }
          if (type == "minit") {
            setState(() {
              minit = '$e'.padLeft(2, '0');
            });
          }
          if (type == "secend") {
            setState(() {
              secend = '$e'.padLeft(2, '0');
            });
          }
        },
        children: List.generate(count, (e) => e).map((i) {
          String str = '$i'.padLeft(2, '0');
          bool disabled = checkRange(str, type);
          return SkyHover(
            disabled: disabled,
            onTap: () {
              controller.animateToItem(i, duration: const Duration(milliseconds: 200), curve: Curves.linear);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                str,
                style: TextStyle(
                  fontSize: widget.size.textSize,
                  color: disabled ? SkyColors().placeholderText : SkyColors().primaryText,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: widget.size.height * 5,
      width: widget.width,
      padding: widget.padding,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: widget.showBorder
                  ? BoxDecoration(
                      border: Border.all(color: SkyColors().baseBorder, width: 1.scaleSpacing),
                    )
                  : null,
              child: Row(
                children: [
                  renderSelector(hourScrollController, 24, "hour"),
                  renderSelector(minitScrollController, 60, "minit"),
                  renderSelector(secendScrollController, 60, 'secend'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
