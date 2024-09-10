part of 'buttons.dart';

class ButtonField<T> extends StatefulWidget {
  const ButtonField({
    super.key,
    this.text = "",
    this.type = SkyType.normal,
    this.size = SkySize.medium,
    this.disabled = false,
    this.loading = false,
    this.plain = false,
    this.round = false,
    this.circle = false,
    this.leftIcon,
    this.rightIcon,
    this.onTap,
    this.buttonKey,
    this.customTextColor,
    this.customHoverColor,

    // required this.builder,
  });
  // final ButtonFieldBuilder<T> builder;
  final String text;
  final SkyType type;
  final SkySize size;

  /// State
  final bool disabled;
  final bool loading;
  final bool plain;
  final bool round;
  final bool circle;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Function()? onTap;
  final String? buttonKey;
  final Color? customTextColor;
  final Color? customHoverColor;

  @override
  ButtonFieldState<T> createState() => ButtonFieldState<T>();
}

class ButtonFieldState<T> extends State<ButtonField<T>> {
  late Throttler throttler = Throttler(const Duration(milliseconds: 50));
  late bool onHover = false;
  late bool active = false;

  SkyType get type {
    return ButtonGroup.maybeOf(context)?.type ?? widget.type;
  }

  SkySize get size {
    return ButtonGroup.maybeOf(context)?.size ?? widget.size;
  }

  BorderRadiusGeometry? get borderRadius {
    if (ButtonGroup.maybeOf(context) != null) {
      return ButtonGroup.maybeOf(context)?.borderRadius(widget);
    }
    if (widget.round) {
      return BorderRadius.circular(
        MediaQuery.of(context).size.height * 0.25,
      );
    } else if (widget.circle) {
      return BorderRadius.circular(
        MediaQuery.of(context).size.height * 0.5,
      );
    } else {
      return SkyBorderRadius().normalBorderRadius;
    }
  }

  @override
  void initState() {
    throttler.callback = () {
      setState(() {
        active = false;
      });
    };
    super.initState();
  }

  void callBack(ButtonField<T> b) {
    ButtonGroup.maybeOf(context)?.callBack(b);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (e) {
        if (widget.disabled) {
          return;
        }
        setState(() {
          active = true;
        });
      },
      onTapUp: (e) {
        if (active) {
          callBack(super.widget);
          widget.onTap?.call();
        }
        throttler.trigger();
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
            active = false;
          });
        },
        child: UnconstrainedBox(
          child: Container(
            padding: widget.size.padding(circle: widget.circle),
            decoration: BoxDecoration(
              color: type.getBtnBackgroundColor(
                context: context,
                disabled: widget.disabled,
                loading: widget.loading,
                plain: widget.plain,
                onHover: onHover,
                active: active,
                chosenButton: false,
              ),
              border: Border.all(
                width: 1,
                color: type.getBtnBorderColor(
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
              padding: EdgeInsets.zero,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.loading)
                      Icon(
                        color: type.getBtnTextColor(
                          context: context,
                          plain: widget.plain,
                          onHover: onHover,
                          active: active,
                          loading: widget.loading,
                          customHoverColor: widget.customHoverColor,
                        ),
                        ElementIcons.loading,
                        size: widget.size.iconSize,
                      ),
                    if (widget.leftIcon != null)
                      Padding(
                        padding: EdgeInsets.only(right: widget.circle || widget.text.isEmpty ? 0 : 5.scaleSpacing),
                        child: Icon(
                          color: type.getBtnTextColor(
                            context: context,
                            plain: widget.plain,
                            onHover: onHover,
                            active: active,
                            loading: widget.loading,
                            customHoverColor: widget.customHoverColor,
                          ),
                          widget.leftIcon,
                          size: widget.size.iconSize,
                        ),
                      ),
                    Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: widget.size.textSize,
                        color: type.getBtnTextColor(
                          context: context,
                          plain: widget.plain,
                          onHover: onHover,
                          active: active,
                          disabled: widget.disabled,
                          loading: widget.loading,
                          customizeColor: widget.customTextColor,
                          customHoverColor: widget.customHoverColor,
                        ),
                      ),
                    ),
                    if (widget.rightIcon != null)
                      Padding(
                        padding: EdgeInsets.only(left: widget.circle || widget.text.isEmpty ? 0 : 5.scaleSpacing),
                        child: Icon(
                          color: type.getBtnTextColor(
                            context: context,
                            plain: widget.plain,
                            onHover: onHover,
                            active: active,
                            loading: widget.loading,
                            customizeColor: widget.customTextColor,
                            customHoverColor: widget.customHoverColor,
                          ),
                          widget.rightIcon,
                          size: widget.size.iconSize,
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    throttler.dispose();
    super.dispose();
  }
}
