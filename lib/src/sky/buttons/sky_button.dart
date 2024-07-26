part of 'buttons.dart';

class SkyButton extends StatefulWidget {
  const SkyButton({
    super.key,
    this.text = "",
    this.type = SkyButtonType.normal,
    this.size = SkyButtonSize.medium,
    this.disabled = false,
    this.loading = false,
    this.plain = false,
    this.round = false,
    this.circle = false,
    this.leftIcon,
    this.rightIcon,
    this.onTap,
  });
  final String text;
  final SkyButtonType type;
  final SkyButtonSize size;

  /// State
  final bool disabled;
  final bool loading;
  final bool plain;
  final bool round;
  final bool circle;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Function()? onTap;
  @override
  State<SkyButton> createState() => _SkyButtonState();
}

class _SkyButtonState extends State<SkyButton> with MyMixin {
  late bool onHover = false;
  late bool active = false;
  late double circular = 5.0;
  void tet() {}
  BorderRadiusGeometry? get borderRadius {
    if (widget.round) {
      return BorderRadius.circular(
        MediaQuery.of(context).size.height * 0.25,
      );
    } else if (widget.circle) {
      return BorderRadius.circular(
        MediaQuery.of(context).size.height * 0.5,
      );
    } else {
      return BorderRadius.circular(circular);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (e) {
        if (widget.disabled) {
          return;
        }
        setState(() {
          active = true;
        });
      },
      onTapUp: (e) {
        if (widget.disabled) {
          return;
        }
        setState(() {
          active = false;
        });
      },
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
          width: widget.circle ? widget.size.height : null,
          decoration: BoxDecoration(
            color: widget.type.getBackgroundColor(
              context: context,
              disabled: widget.disabled,
              loading: widget.loading,
              plain: widget.plain,
              onHover: onHover,
              active: active,
            ),
            border: Border.all(
              width: 1,
              color: widget.type.getBorderColor(
                context: context,
                onHover: onHover,
                active: active,
                disabled: widget.disabled,
                loading: widget.loading,
              )!,
            ),
            borderRadius: borderRadius,
          ),
          child: Padding(
            padding: widget.size.padding(circle: widget.circle),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.loading)
                    Icon(
                      color: widget.type.getTextColor(
                        context: context,
                        plain: widget.plain,
                        onHover: onHover,
                        active: active,
                        loading: widget.loading,
                      ),
                      ElementIcons.loading,
                      size: widget.size.iconSize,
                    ),
                  if (widget.leftIcon != null)
                    Icon(
                      color: widget.type.getTextColor(
                        context: context,
                        plain: widget.plain,
                        onHover: onHover,
                        active: active,
                        loading: widget.loading,
                      ),
                      widget.leftIcon,
                      size: widget.size.iconSize,
                    ),
                  if (widget.text.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.scaleSpacing),
                      child: Text(
                        widget.text,
                        style: TextStyle(
                          color: widget.type.getTextColor(
                            context: context,
                            plain: widget.plain,
                            onHover: onHover,
                            active: active,
                            disabled: widget.disabled,
                            loading: widget.loading,
                          ),
                        ),
                      ),
                    ),
                  if (widget.rightIcon != null)
                    Icon(
                      color: widget.type.getTextColor(
                        context: context,
                        plain: widget.plain,
                        onHover: onHover,
                        active: active,
                        loading: widget.loading,
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
