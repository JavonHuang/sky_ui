import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
import 'package:sky_ui/src/utils/utils.dart';

import '../form/sky_form_field_bridge.dart';

class SkyInput extends SkyFormFieldBridge<SkyInput> {
  const SkyInput({
    super.key,
    this.leftIcon,
    this.rightIcon,
    this.controller,
    this.clearable = true,
    this.disabled = false,
    this.readOnly = false,
  }) : super(
          itemType: "SkyInput",
        );
  final IconData? leftIcon;
  final IconData? rightIcon;
  final TextEditingController? controller;
  final bool clearable;
  final bool disabled;
  final bool readOnly;

  @override
  SkyFormFieldBridgeState<SkyInput> createState() => _SkyInputState();
}

class _SkyInputState extends SkyFormFieldBridgeState<SkyInput> {
  TextStyle a = TextStyle(
    fontSize: 10,
    height: 0.2,
  );

  late SkyInput _widget = super.widget as SkyInput;
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
          if (_widget.rightIcon != null)
            Icon(
              // color: widget.type.getTextColor(
              //   context: context,
              //   onHover: onHover,
              // ),
              _widget.rightIcon,
              // size: widget.size.iconSize,
            ),
          Expanded(
            child: TextField(
              mouseCursor: _widget.disabled ? SystemMouseCursors.forbidden : null,
              controller: _textController,
              focusNode: _focusNode,
              readOnly: _widget.disabled || _widget.readOnly,
              style: TextStyle(
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
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
          if (_widget.rightIcon != null)
            Icon(
              // color: widget.type.getTextColor(
              //   context: context,
              //   onHover: onHover,
              // ),
              _widget.rightIcon,
              // size: widget.size.iconSize,
            ),
        ],
      ),
    );
  }
}
