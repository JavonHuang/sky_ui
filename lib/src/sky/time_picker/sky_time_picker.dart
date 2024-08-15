part of 'index.dart';

class SkyTimePicker extends SkyFormFieldBridge<SkyTimePicker> {
  const SkyTimePicker({
    super.key,
    this.size = SkySize.small,
    this.disabled = false,
    this.clearable = false,
    this.placeholder,
    this.collapseTags = false,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyRadio,
          fieldDisabled: disabled,
        );
  final SkySize size;
  final bool disabled;
  final bool clearable;
  final String? placeholder;
  final bool collapseTags;

  @override
  SkyFormFieldBridgeState<SkyTimePicker> createState() => _SkyTimePickerState();
}

class _SkyTimePickerState extends SkyFormFieldBridgeState<SkyTimePicker> with SingleTickerProviderStateMixin {
  late SkyTimePicker _widget = super.widget as SkyTimePicker;
  TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final MenuController _menuController = MenuController();
  late dynamic value = null;
  late dynamic showOptions = [];
  late bool onHover = false;
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;

  late bool _hasOpen = false;
  bool get _textIsNotEmpty => value != null;
  Color get outLineBorder {
    if (_hasOpen) {
      return SkyColors().primary;
    }
    return onHover ? SkyColors().placeholderText : SkyColors().baseBorder;
  }

  bool get _showCloseIcon {
    return onHover && _widget.clearable && _textIsNotEmpty && !super.disabled;
  }

  void _filter() {
    showOptions = [];
    setState(() {});
    _menuController.open();
  }

  void _onClear() {
    _textController.text = "";
    _menuController.close();
    setValue(null);
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _rotateAnimation = Tween(begin: 0.0, end: -0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    setState(() {});
  }

  @override
  void setValue(dynamic e) {
    setState(() {
      value = e;
    });
  }

  @override
  dynamic getValue() {
    return value;
  }

  _onTap() {
    if (_menuController.isOpen && _focusNode.hasFocus) {
      _menuController.close();
    } else {
      _menuController.open();
    }
  }

  List<Widget> _renderOptionItem(double optionWidth, double padding) {
    if (showOptions.isEmpty) {
      return [
        Container(
          alignment: Alignment.center,
          width: optionWidth - padding,
          height: _widget.size.height,
          child: Text(
            "暂无数据",
            style: TextStyle(
              color: SkyColors().placeholderText,
              fontSize: _widget.size.textSize,
            ),
          ),
        )
      ];
    }
    return showOptions
        .map(
          (e) => Container(
            child: Text("898"),
          ),
        )
        .toList();
  }

  void _setPopupIsOpen(bool value) {
    if (value) {
      _animationController.forward();
      setState(() {
        _hasOpen = true;
      });
    } else {
      _animationController.reverse();
      _textController.text = "";
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    double padding = 0;
    return Container(
      height: super.size.height,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: outLineBorder,
        ),
        borderRadius: SkyBorderRadius().normalBorderRadius,
      ),
      child: MouseRegion(
        cursor: _widget.disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        onEnter: (e) {
          if (_widget.disabled) {
            return;
          }
          setState(() {
            onHover = true;
          });
        },
        onExit: (e) {
          if (_widget.disabled) {
            return;
          }
          setState(() {
            onHover = false;
          });
        },
        child: LayoutBuilder(
          builder: (_, constraints) {
            final optionWidth = constraints.maxWidth;
            return MenuAnchor(
              onOpen: () => _setPopupIsOpen(true),
              onClose: () => _setPopupIsOpen(false),
              controller: _menuController,
              alignmentOffset: const Offset(0, 4),
              style: MenuStyle(
                minimumSize: WidgetStatePropertyAll(
                  Size(
                    optionWidth,
                    40,
                  ),
                ),
                maximumSize: WidgetStatePropertyAll(
                  Size(
                    optionWidth,
                    200,
                  ),
                ),
                visualDensity: VisualDensity.comfortable,
                side: WidgetStatePropertyAll(BorderSide(
                  color: SkyColors().baseBorder,
                  width: 1,
                  style: BorderStyle.solid,
                )),
                backgroundColor: WidgetStatePropertyAll<Color>(SkyColors().white),
                surfaceTintColor: WidgetStatePropertyAll<Color>(SkyColors().white),
                padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 20, horizontal: padding)),
              ),
              menuChildren: _renderOptionItem(optionWidth, padding * 2),
              builder: (context, controller, child) {
                return Row(
                  children: [
                    Expanded(
                        child: SkyBaseInput(
                      controller: _textController,
                      focusNode: _focusNode,
                      disabled: _widget.disabled,
                      readOnly: false,
                      size: _widget.size,
                      onTap: _onTap,
                    )),
                    if (_showCloseIcon)
                      GestureDetector(
                        onTap: _onClear,
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.scaleSpacing,
                            ),
                            child: Icon(
                              color: SkyColors().baseBorder,
                              ElementIcons.circleClose,
                              size: super.size.iconSize,
                            ),
                          ),
                        ),
                      ),
                    if (!_showCloseIcon)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.scaleSpacing,
                        ),
                        child: RotationTransition(
                          turns: _rotateAnimation,
                          child: Icon(
                            color: SkyColors().baseBorder,
                            ElementIcons.arrowDown,
                            size: super.size.iconSize,
                          ),
                        ),
                      ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
