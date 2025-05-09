import 'package:flutter/material.dart';
import 'package:sky_ui/src/utils/utils.dart';
import '../../styles/styles.dart';

part "tag_enum.dart";

class SkyTag extends StatefulWidget {
  const SkyTag({
    super.key,
    this.text = '',
    this.type = SkyType.normal,
    this.size = SkySize.medium,
    this.plain = false,
    this.closable = false,
    this.onTap,
  });
  final String text;
  final SkyType type;
  final SkySize size;
  final bool plain;
  final bool closable;
  final Function()? onTap;

  @override
  State<SkyTag> createState() => _SkyTagState();
}

class _SkyTagState extends State<SkyTag> {
  late bool onHover = false;
  BorderRadiusGeometry? get borderRadius {
    return BorderRadius.circular(5.scaleSpacing);
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        // height: widget.size.height,
        decoration: BoxDecoration(
          color: widget.type.getTagBackgroundColor(
            context: context,
            plain: widget.plain,
          ),
          border: Border.all(
            width: 1,
            color: widget.type.getTagBorderColor(
              context: context,
            )!,
          ),
          borderRadius: borderRadius,
        ),
        child: Padding(
          padding: widget.size.padding(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.text.isNotEmpty)
                Padding(
                  padding: EdgeInsets.only(right: 2.scaleSpacing),
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: widget.size.textSize,
                      color: widget.type.getTagTextColor(
                        context: context,
                        plain: widget.plain,
                      ),
                    ),
                  ),
                ),
              if (widget.closable)
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (e) {
                    setState(() {
                      onHover = true;
                    });
                  },
                  onExit: (e) {
                    setState(() {
                      onHover = false;
                    });
                  },
                  child: GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      padding: EdgeInsets.all(2.scaleSpacing),
                      decoration: BoxDecoration(
                        color: widget.type.getTagCloseBackgroundColor(
                          context: context,
                          onHover: onHover,
                          plain: widget.plain,
                        ),
                        borderRadius: BorderRadius.circular(widget.size.iconSize * 0.5),
                      ),
                      child: Icon(
                        color: widget.type.getTagCloseColor(
                          context: context,
                          plain: widget.plain,
                          onHover: onHover,
                        ),
                        ElementIcons.close,
                        size: widget.size.iconSize - 2 * 2.scaleSpacing,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
