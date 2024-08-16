import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class SkyTimePickerControlItem extends StatefulWidget {
  const SkyTimePickerControlItem({
    super.key,
    this.onTap,
    required this.width,
    required this.height,
    required this.pickerOptions,
  });
  final Function()? onTap;
  final double width;
  final double height;
  final SkyPickerPptions? pickerOptions;

  @override
  State<SkyTimePickerControlItem> createState() => _SkyTimePickerControlItemState();
}

class _SkyTimePickerControlItemState extends State<SkyTimePickerControlItem> {
  late bool onHover = false;
  Color? get onHoverColor {
    // if (widget.disabled) {
    //   return SkyColors().white;
    // }
    if (onHover) {
      return SkyColors().defaultBg;
    }
    return SkyColors().white;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (widget.disabled) {
        //   return;
        // }
        widget.onTap?.call();
      },
      child: MouseRegion(
        // cursor: widget.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        onEnter: (e) {
          // if (widget.disabled) {
          //   return;
          // }
          setState(() {
            onHover = true;
          });
        },
        onExit: (e) {
          // if (widget.disabled) {
          //   return;
          // }
          setState(() {
            onHover = false;
          });
        },
        child: Container(
          alignment: Alignment.centerLeft,
          // padding: EdgeInsets.symmetric(horizontal: 20.scaleSpacing, vertical: 0),
          height: widget.height * 5,
          // decoration: BoxDecoration(
          //   color: onHoverColor,
          // ),
          width: widget.width,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      color: SkyColors().defaultBg,
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: widget.height,
                  ),
                  Expanded(
                    child: Container(
                      color: SkyColors().defaultBg,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 23,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (ctx, index) {
                        return UnconstrainedBox(
                          child: Container(
                            alignment: Alignment.center,
                            height: widget.height,
                            child: Text((index + 1).toString()),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 59,
                      physics: AlwaysScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (ctx, index) {
                        return UnconstrainedBox(
                          child: Container(
                            alignment: Alignment.center,
                            height: widget.height,
                            child: Text((index).toString()),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: 59,
                        physics: AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (ctx, index) {
                          return UnconstrainedBox(
                            child: Container(
                              alignment: Alignment.center,
                              height: widget.height,
                              child: Text((index).toString()),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
