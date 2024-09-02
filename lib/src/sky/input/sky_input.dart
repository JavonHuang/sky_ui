part of 'index.dart';

class SkyInput extends SkyFormFieldBridge<SkyInput> {
  const SkyInput({
    super.key,
    this.leftIcon,
    this.rightIcon,
    this.controller,
    this.clearable = false,
    this.disabled = false,
    this.readOnly = false,
    this.size = SkySize.small,
    this.model = "",
    this.placeholder,
  }) : super(
          fieldSize: size,
          itemType: SkyFormType.skyInput,
          fieldDisabled: disabled,
        );
  final IconData? leftIcon;
  final IconData? rightIcon;
  final TextEditingController? controller;
  final bool clearable;
  final bool disabled;
  final bool readOnly;
  final SkySize size;
  final String? model;
  final String? placeholder;

  @override
  SkyFormFieldBridgeState<SkyInput> createState() => _SkyInputState();
}

class _SkyInputState extends SkyFormFieldBridgeState<SkyInput> {
  SkyInput get _widget => super.widget as SkyInput;
  late Color outLineBorder = SkyColors().baseBorder;

  TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  late bool _textIsNotEmpty = true;
  bool get _showCloseIcon {
    return _focusNode.hasFocus && _widget.clearable && _textIsNotEmpty && !super.disabled;
  }

  @override
  void initState() {
    if (_widget.controller != null) {
      _textController = _widget.controller!;
    }
    super.initState();
    _focusNode.addListener(_focusNodeListener);
    _textController.addListener(_textListener);
    _textController.text = _widget.model ?? "";
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
  void didUpdateWidget(SkyInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    SkyInput widget = super.widget as SkyInput;
    if (oldWidget.model != widget.model && mounted) {
      setValue(widget.model ?? "");
    }
  }

  void onClear() {
    _textController.text = "";
  }

  void _onChanged(String e) {
    print(e);
  }

  @override
  void setValue(dynamic e) {
    _textController.text = e;
  }

  @override
  dynamic getValue() {
    return _textController.text;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: super.size.height,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: outLineBorder,
        ),
        borderRadius: SkyBorderRadius().normalBorderRadius,
      ),
      child: Row(
        children: [
          if (_widget.leftIcon != null)
            Padding(
              padding: EdgeInsets.only(left: 4.scaleSpacing),
              child: Center(
                child: Icon(
                  color: SkyColors().baseBorder,
                  _widget.leftIcon,
                  size: super.size.iconSize,
                ),
              ),
            ),
          Expanded(
            child: SkyBaseInput(
              restorationId: restorationId,
              bucket: bucket,
              controller: _textController,
              focusNode: _focusNode,
              disabled: super.disabled,
              readOnly: _widget.readOnly,
              size: super.size,
              placeholder: _widget.placeholder,
              onChanged: _onChanged,
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
                    size: super.size.iconSize,
                  ),
                ),
              ),
            ),
          if (_widget.rightIcon != null)
            Padding(
              padding: EdgeInsets.only(right: 4.scaleSpacing),
              child: Center(
                child: Icon(
                  color: SkyColors().baseBorder,
                  _widget.rightIcon,
                  size: super.size.iconSize,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
