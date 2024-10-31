part of 'index.dart';

class SkySelect<T> extends SkyFormFieldBridge<SkySelect> {
  const SkySelect({
    super.key,
    this.model,
    this.size = SkySize.small,
    required this.options,
    this.disabled = false,
    this.filterable = false,
    this.clearable = false,
    this.placeholder,
    this.multiple = false,
    this.collapseTags = false,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyRadio,
          fieldDisabled: disabled,
        );
  final T? model;
  final SkySize size;
  final List<SkySelectOption<T>> options;
  final bool disabled;
  final bool filterable;
  final bool clearable;
  final String? placeholder;
  final bool multiple;
  final bool collapseTags;

  @override
  SkyFormFieldBridgeState<SkySelect> createState() => _SkySelectState();
}

class _SkySelectState<T> extends SkyFormFieldBridgeState<SkySelect> with SingleTickerProviderStateMixin {
  SkySelect<T> get _widget => super.widget as SkySelect<T>;
  TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final MenuController _menuController = MenuController();
  // ignore: avoid_init_to_null
  late T? value = null;
  late List<SkySelectOption<T>> _valueList = [];
  // ignore: avoid_init_to_null
  late SkySelectOption<T>? _valueItem = null;
  late bool onHover = false;
  late AnimationController _animationController;
  late Animation<double> _rotateAnimation;
  final Throttler throttler = Throttler(const Duration(seconds: 1));
  late List<SkySelectOption<T>> showOptions = [];
  late bool _hasOpen = false;
  bool get _textIsNotEmpty => value != null;
  String? get _selectLabel => _valueItem?.label;
  Color get outLineBorder {
    if (_hasOpen) {
      return SkyColors().primary;
    }
    return onHover ? SkyColors().placeholderText : SkyColors().baseBorder;
  }

  SkySelectOption<T>? get getItem {
    int index = _widget.options.indexWhere((e) => e.value == _widget.model);
    if (index > -1) {
      return _widget.options[index];
    }
    return null;
  }

  void _setSelectValue(SkySelectOption<T>? e) {
    if (_widget.multiple) {
      if (e != null) {
        int index = _valueList.indexWhere((item) => item.value == e.value);
        if (index == -1) {
          _valueList.add(e);
        } else {
          _valueList.removeAt(index);
        }
        setState(() {});
      }
    } else {
      if (e != null) {
        _textController.text = e.label;
        _valueItem = e;
        setValue(e.value);
      } else {
        _textController.text = "";
        _valueItem = null;
        setValue(null);
      }
      _menuController.close();
    }
  }

  void _multipleRemoveItem(int index) {
    _valueList.removeAt(index);
    setState(() {});
  }

  bool get _showCloseIcon {
    return onHover && _widget.clearable && _textIsNotEmpty && !super.disabled;
  }

  void _filter() {
    showOptions = [];
    for (SkySelectOption<T> item in _widget.options) {
      if (item.label.contains(_textController.text)) {
        showOptions.add(item);
      }
    }
    setState(() {});
    _menuController.open();
  }

  void _onChangedText() {
    if (_menuController.isOpen && ((_valueItem != null && _textController.text != _valueItem!.label) || (_valueItem == null))) {
      throttler.trigger();
    }
  }

  void _onClear() {
    _textController.text = "";
    _valueItem = null;
    _menuController.close();
    setValue(null);
  }

  @override
  void initState() {
    super.initState();
    if (_widget.model != null) {
      _setSelectValue(getItem);
    }

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

    if (_widget.filterable) {
      _textController.addListener(_onChangedText);
      throttler.callback = _filter;
    }
    setState(() {
      showOptions = _widget.options;
    });
  }

  @override
  void setValue(dynamic e) {
    setState(() {
      value = e;
    });
  }

  @override
  dynamic getValue() {
    if (_widget.multiple) {
      return value;
    } else {
      return _valueList.map((e) => e.value).toList();
    }
  }

  _onTap() {
    if (_widget.disabled) {
      return;
    }

    if (_menuController.isOpen) {
      _menuController.close();
    } else {
      _menuController.open();
    }
  }

  Color? _selectTextColors(SkySelectOption<T> e) {
    if (e.disabled) {
      return SkyColors().placeholderText;
    }
    if (_widget.multiple) {
      int index = _valueList.indexWhere((item) => item.value == e.value);
      if (index == -1) {
        return SkyColors().primaryText;
      } else {
        return SkyColors().primary;
      }
    } else {
      if (e.value == value) {
        return SkyColors().primary;
      } else {
        return SkyColors().primaryText;
      }
    }
  }

  bool _selectShowIcon(SkySelectOption<T> e) {
    if (_widget.multiple) {
      int index = _valueList.indexWhere((item) => item.value == e.value);
      if (index == -1) {
        return false;
      } else {
        return true;
      }
    } else {
      if (e.value == value) {
        return true;
      } else {
        return false;
      }
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
          (e) => SkySelectItem(
            onTap: () {
              _setSelectValue(e);
            },
            disabled: e.disabled,
            label: e.label,
            width: optionWidth - padding,
            // ignore: unnecessary_cast
            selectColor: _selectTextColors(e as SkySelectOption<T>),
            height: _widget.size.height,
            showIcon: _selectShowIcon(e),
            iconSize: _widget.size.iconSize,
          ),
        )
        .toList();
  }

  Widget _renderTag(double width) {
    List<Widget> itemList = [];
    if (_widget.collapseTags && _valueList.length > 1) {
      itemList.add(SkySelectTag(
        size: _widget.size,
        option: _valueList[0],
        onClose: () {
          _multipleRemoveItem(0);
        },
      ));
      itemList.add(
        UnconstrainedBox(
          child: Container(
            alignment: Alignment.center,
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
            child: Text(
              '+${(_valueList.length - 1).toString()}',
              style: TextStyle(
                fontSize: _widget.size.textSize,
                color: SkyColors().secondaryText,
              ),
            ),
          ),
        ),
      );
    } else {
      for (int i = 0; i < _valueList.length; i++) {
        SkySelectOption<T> item = _valueList[i];
        itemList.add(SkySelectTag(
          size: _widget.size,
          option: item,
          onClose: () {
            _multipleRemoveItem(i);
          },
        ));
      }
    }
    return Container(
      constraints: BoxConstraints(maxWidth: width - 50),
      child: Wrap(
        spacing: 0, // 主轴(水平)方向间距
        runSpacing: 0, // 纵轴（垂直）方向间距
        children: itemList,
      ),
    );
  }

  void _setPopupIsOpen(bool value) {
    throttler.dispose();
    if (value) {
      _animationController.forward();
      if (_widget.filterable) {
        _textController.text = "";
      }
      setState(() {
        _hasOpen = true;
      });
    } else {
      _animationController.reverse();
      if (_widget.filterable && _selectLabel != null) {
        _textController.text = _selectLabel!;
      } else {
        _textController.text = "";
      }
      if (_widget.filterable) {
        setState(() {
          showOptions = _widget.options;
          _hasOpen = false;
        });
      }
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    double padding = 0;
    return Container(
      // height: super.size.height,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: outLineBorder,
        ),
        borderRadius: SkyBorderRadius().normalBorderRadius,
      ),
      child: GestureDetector(
        onTap: _onTap,
        behavior: HitTestBehavior.translucent,
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
                  return IntrinsicHeight(
                    child: Row(
                      children: [
                        _renderTag(optionWidth),
                        Expanded(
                          child: SkyBaseInput(
                            controller: _textController,
                            focusNode: _focusNode,
                            disabled: _widget.disabled,
                            readOnly: !_widget.filterable,
                            size: _widget.size,
                            placeholder: _selectLabel ?? _widget.placeholder,
                            blPlaceholder: _selectLabel == "" || _selectLabel == null,
                            onTap: _onTap,
                          ),
                        ),
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
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (_widget.filterable) {
      _textController.removeListener(_onChangedText);
    }
    throttler.dispose();
    _textController.dispose();
    _focusNode.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
