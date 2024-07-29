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
  }) : super(
          itemType: "SkyInputNumber",
        );
  final IconData? leftIcon;
  final IconData? rightIcon;
  final TextEditingController? controller;
  final bool clearable;
  final bool disabled;
  final bool readOnly;
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
    super.setControll(_textController);
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

  void onClear() {
    _textController.text = "";
    print("javon");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: outLineBorder,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onClear,
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
                    topLeft: Radius.circular(4.scaleSpacing),
                    bottomLeft: Radius.circular(4.scaleSpacing),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.scaleSpacing),
                  child: Center(
                    child: Icon(
                      color: SkyColors().baseBorder,
                      ElementIcons.minus,
                      size: 18.scaleIconSize,
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
              style: const TextStyle(
                fontSize: 12,
                // height: 1,
              ),
              decoration: InputDecoration(
                // suffixIcon: Icon(Icons.person), // 在右侧添加一个人物图标
                // prefixIcon: Icon(Icons.person),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: _widget.disabled ? Color(0xFFf5f7fa) : SkyColors().transparent,
                hoverColor: _widget.disabled ? Color(0xFFf5f7fa) : SkyColors().transparent,
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                // hintText: 'Hint Text',
                // helperText: 'Helper Text',
                // helperStyle: a,
                // counterText: '0 characters',
                // counterStyle: a,
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
                    size: 18.scaleIconSize,
                  ),
                ),
              ),
            ),
          GestureDetector(
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
                    topRight: Radius.circular(4.scaleSpacing),
                    bottomRight: Radius.circular(4.scaleSpacing),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.scaleSpacing),
                  child: Center(
                    child: Icon(
                      color: SkyColors().baseBorder,
                      ElementIcons.plus,
                      size: 18.scaleIconSize,
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
