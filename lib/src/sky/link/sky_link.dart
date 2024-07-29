import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sky_ui/src/utils/utils.dart';

import '../../styles/styles.dart';

part 'link_enum.dart';

class SkyLink extends StatefulWidget {
  const SkyLink({
    super.key,
    required this.text,
    this.type = SkyLinkType.primary,
    this.size = SkyLinkSize.small,
    this.disabled = false,
    this.underline = true,
    this.leftIcon,
    this.rightIcon,
    this.onTap,
  });
  final String text;
  final SkyLinkType type;
  final SkyLinkSize size;

  final bool disabled;
  final bool underline;

  final IconData? leftIcon;
  final IconData? rightIcon;
  final Function()? onTap;
  @override
  State<SkyLink> createState() => _SkyLinkState();
}

class _SkyLinkState extends State<SkyLink> {
  late bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: widget.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        onEnter: (e) {
          if (widget.disabled) {
            return;
          }
          setState(() {
            onHover = true;
          });
        },
        onExit: (e) {
          if (widget.disabled) {
            return;
          }
          setState(() {
            onHover = false;
          });
        },
        child: Container(
          height: widget.size.height,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: widget.type.getUnderlineColor(
                  context: context,
                  onHover: onHover,
                  underline: widget.underline,
                )!,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.zero,
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.leftIcon != null)
                    Icon(
                      color: widget.type.getTextColor(
                        context: context,
                        onHover: onHover,
                      ),
                      widget.leftIcon,
                      size: SkyFontSizes().s14,
                    ),
                  if (widget.text.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.scaleSpacing),
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          fontSize: widget.size.textSize,
                          color: widget.type.getTextColor(
                            context: context,
                            onHover: onHover,
                          ),
                        ),
                      ),
                    ),
                  if (widget.rightIcon != null)
                    Icon(
                      color: widget.type.getTextColor(
                        context: context,
                        onHover: onHover,
                      ),
                      widget.rightIcon,
                      size: widget.size.iconSize,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
