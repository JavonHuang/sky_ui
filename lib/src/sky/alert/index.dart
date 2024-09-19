import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'package:sky_ui/src/sky/common/sky_hover.dart';
part 'enum.dart';

class SkyAlert extends StatefulWidget {
  final String title;
  final String? description;
  final bool showIcon;
  final SkyAlertType type;
  final SkyAlertEffect effect;
  final String? closeText;
  final bool closable;
  final Future<bool> Function()? close;
  final bool center;
  final TextStyle? textStyle;
  const SkyAlert({
    super.key,
    required this.title,
    this.type = SkyAlertType.info,
    this.description,
    this.showIcon = false,
    this.effect = SkyAlertEffect.light,
    this.closeText,
    this.closable = false,
    this.close,
    this.center = false,
    this.textStyle,
  });

  @override
  State<SkyAlert> createState() => _SkyAlertState();
}

class _SkyAlertState extends State<SkyAlert> {
  late bool hidden = false;
  @override
  Widget build(BuildContext context) {
    if (hidden) {
      return const SizedBox(
        height: 0,
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: widget.type.getBackgroundColor(context: context)?.withOpacity(widget.effect == SkyAlertEffect.light ? 0.1 : 1),
        borderRadius: SkyBorderRadius().normalBorderRadius,
      ),
      child: Row(
        crossAxisAlignment: widget.description != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: widget.center ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                if (widget.showIcon)
                  Padding(
                    padding: EdgeInsets.only(right: SkySpacings().textSpacing),
                    child: Center(
                      child: Icon(
                        size: widget.description != null ? 24.scaleFontSize : SkyIconSizes().mediumFont,
                        widget.type.getAlertIconData(),
                        color: widget.effect == SkyAlertEffect.light ? widget.type.getBackgroundColor(context: context) : SkyColors().white,
                      ),
                    ),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: SkyFontSizes().textSmallFont,
                        fontWeight: widget.description != null ? FontWeight.w700 : null,
                        color: widget.effect == SkyAlertEffect.light ? widget.type.getBackgroundColor(context: context) : SkyColors().white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    if (widget.description != null)
                      Text(
                        widget.description!,
                        style: TextStyle(
                          fontSize: SkyFontSizes().auxiliaryFont,
                          color: widget.effect == SkyAlertEffect.light ? widget.type.getBackgroundColor(context: context) : SkyColors().white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (widget.closable)
            SkyHover(
              disabled: false,
              onTap: () async {
                if (widget.close != null && await widget.close!.call()) {
                  setState(() {
                    hidden = true;
                  });
                } else {
                  return;
                }
                setState(() {
                  hidden = true;
                });
              },
              child: widget.closeText != null
                  ? Text(
                      widget.closeText!,
                      style: TextStyle(
                        fontSize: SkyFontSizes().textSmallFont,
                        color: widget.effect == SkyAlertEffect.light ? SkyColors().tableSortBg : SkyColors().white,
                      ),
                    )
                  : Center(
                      child: Icon(
                        size: SkyIconSizes().smallFont,
                        ElementIcons.close,
                        color: widget.effect == SkyAlertEffect.light ? SkyColors().tableSortBg : SkyColors().white,
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}
