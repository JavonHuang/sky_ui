part of 'index.dart';

class SkySelectTag<T> extends StatefulWidget {
  const SkySelectTag({
    super.key,
    this.size = SkySize.small,
    required this.option,
    required this.onClose,
  });
  final SkySize size;
  final SkySelectOption<T> option;
  final void Function() onClose;
  @override
  State<SkySelectTag> createState() => _SkySelectTagState();
}

class _SkySelectTagState extends State<SkySelectTag> {
  late bool onHover = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.scaleSpacing, vertical: 2.scaleSpacing),
      margin: EdgeInsets.symmetric(horizontal: 4.scaleSpacing, vertical: 2.scaleSpacing),
      decoration: BoxDecoration(
        color: SkyColors().defaultBg,
        borderRadius: SkyBorderRadius().normalBorderRadius,
        border: Border.all(
          width: 1,
          color: SkyColors().lighterBorder,
        ),
      ),
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Text(
                widget.option.label,
                style: TextStyle(
                  color: SkyColors().secondaryText,
                  fontSize: widget.size.textSize,
                  height: 1,
                ),
              ),
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: GestureDetector(
                onTap: widget.onClose,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(2.scaleSpacing),
                  margin: EdgeInsets.only(left: 2.scaleSpacing),
                  decoration: BoxDecoration(
                    color: onHover ? SkyColors().secondaryText : SkyColors().placeholderText,
                    borderRadius: BorderRadius.circular(widget.size.iconSize * 0.5),
                  ),
                  child: MouseRegion(
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
                    child: Icon(
                      color: onHover ? SkyColors().white : SkyColors().info,
                      ElementIcons.close,
                      size: widget.size.iconSize - 2 * 2.scaleSpacing,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
