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
  @override
  ButtonFieldState<T> createState() => ButtonFieldState<T>();
}

class ButtonFieldState<T> extends State<ButtonField<T>> {
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
        Future.delayed(const Duration(milliseconds: 50)).then((e) {
          setState(() {
            active = false;
          });
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
            active = false;
          });
        },
        child: UnconstrainedBox(
          child: Container(
            height: widget.size.height,
            width: widget.circle ? widget.size.height : null,
            decoration: BoxDecoration(
              color: type.getBackgroundColor(
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
                color: type.getBorderColor(
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
                        color: type.getTextColor(
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
                        color: type.getTextColor(
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
                            fontSize: size.textSize,
                            color: type.getTextColor(
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
                        color: type.getTextColor(
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
      ),
    );
  }
}

typedef ButtonFieldBuilder<T> = Widget Function(ButtonFieldState<T> field);
