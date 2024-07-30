part of 'index.dart';

class SkyInputNumber extends SkyFormFieldBridge<SkyInputNumber> {
  const SkyInputNumber({
    super.key,
    this.leftIcon,
    this.rightIcon,
    this.controller,
    this.clearable = true,
    this.disabled = false,
    this.readOnly = false,
    this.size = SkySize.small,
    this.model,
    this.min,
    this.max,
    this.step = 1,
    this.precision = 0,
    this.placeholder,
  }) : super(
          itemType: "SkyInputNumber",
        );
  final IconData? leftIcon;
  final IconData? rightIcon;
  final TextEditingController? controller;
  final bool clearable;
  final bool disabled;
  final bool readOnly;
  final SkySize size;
  final double? model;
  final double? min;
  final double? max;
  final double step;
  final int precision;
  final String? placeholder;

  @override
  SkyFormFieldBridgeState<SkyInputNumber> createState() => _SkyInputNumberState();
}

class _SkyInputNumberState extends SkyFormFieldBridgeState<SkyInputNumber> {
  late SkyInputNumber _widget = super.widget as SkyInputNumber;
  late Color outLineBorder = SkyColors().baseBorder;
  TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late bool _textIsNotEmpty = true;
  bool get _showCloseIcon {
    return _focusNode.hasFocus && _widget.clearable && _textIsNotEmpty && !_widget.disabled;
  }

  @override
  void initState() {
    if (_widget.controller != null) {
      _textController = _widget.controller!;
    }
    super.initState();
    _focusNode.addListener(_focusNodeListener);
    _textController.addListener(_textListener);
    setControll(_textController);
  }

  _focusNodeListener() {
    if (_focusNode.hasFocus) {
      setState(() {
        outLineBorder = SkyColors().primary;
      });
    } else {
      Future.delayed(const Duration(milliseconds: 100)).then((e) {
        setState(() {
          outLineBorder = SkyColors().baseBorder;
        });
      });
    }
  }

  _textListener() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _textIsNotEmpty = true;
      });
    } else {
      setState(() {
        _textIsNotEmpty = false;
      });
    }
  }

  @override
  void dispose() {
    _textController.removeListener(_textListener);
    _textController.dispose();
    _focusNode.removeListener(_focusNodeListener);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SkyInputNumber oldWidget) {
    super.didUpdateWidget(oldWidget);
    SkyInputNumber widget = super.widget as SkyInputNumber;
    if (oldWidget.model != widget.model && mounted) {
      _textController.text = widget.model.toString();
    }
  }

  void onClear() {
    _textController.text = "";
  }

  void _onMinus() {
    double val = double.parse(_textController.text != '' ? _textController.text : '0') - _widget.step;
    if (_widget.min != null && val < _widget.min!) {
      return;
    }
    _textController.text = val.getMaxPrecision(maxDigits: _widget.precision).toString();
  }

  void _onPluss() {
    double val = double.parse(_textController.text != '' ? _textController.text : '0') + _widget.step;
    if (_widget.max != null && val > _widget.max!) {
      return;
    }
    _textController.text = val.getMaxPrecision(maxDigits: _widget.precision).toString();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: _widget.size.height,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: outLineBorder,
        ),
        borderRadius: SkyBorderRadius().normalBorderRadius,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: _onMinus,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  color: SkyColors().defaultBg,
                  border: Border(
                    right: BorderSide(
                      width: 1,
                      color: SkyColors().baseBorder,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: SkyBorderRadius().normalCircular,
                    bottomLeft: SkyBorderRadius().normalCircular,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.scaleSpacing),
                  child: Center(
                    child: Icon(
                      color: SkyColors().baseBorder,
                      ElementIcons.minus,
                      size: _widget.size.iconSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextField(
              mouseCursor: _widget.disabled ? SystemMouseCursors.forbidden : null,
              controller: _textController,
              focusNode: _focusNode,
              readOnly: _widget.disabled || _widget.readOnly,
              style: TextStyle(
                fontSize: _widget.size.textSize,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: SkyBorderRadius().normalBorderRadius,
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: SkyBorderRadius().normalBorderRadius,
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: _widget.disabled ? SkyColors().defaultBg : SkyColors().transparent,
                hoverColor: _widget.disabled ? SkyColors().defaultBg : SkyColors().transparent,
                contentPadding: _widget.size.contentPadding,
                hintText: _widget.placeholder,
              ),
            ),
          ),
          if (_showCloseIcon)
            GestureDetector(
              onTap: onClear,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.scaleSpacing,
                  ),
                  child: Icon(
                    color: SkyColors().baseBorder,
                    ElementIcons.circleClose,
                    size: _widget.size.iconSize,
                  ),
                ),
              ),
            ),
          GestureDetector(
            onTap: _onPluss,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  color: SkyColors().defaultBg,
                  border: Border(
                    left: BorderSide(
                      width: 1,
                      color: SkyColors().baseBorder,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: SkyBorderRadius().normalCircular,
                    bottomRight: SkyBorderRadius().normalCircular,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.scaleSpacing),
                  child: Center(
                    child: Icon(
                      color: SkyColors().baseBorder,
                      ElementIcons.plus,
                      size: _widget.size.iconSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
