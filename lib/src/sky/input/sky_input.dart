import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sky_ui/sky_ui.dart';
import 'package:sky_ui/src/utils/utils.dart';

class SkyInput extends StatefulWidget {
  const SkyInput({
    super.key,
    this.leftIcon,
    this.rightIcon,
  });
  final IconData? leftIcon;
  final IconData? rightIcon;
  @override
  State<SkyInput> createState() => _SkyInputState();
}

class _SkyInputState extends State<SkyInput> {
  TextStyle a = TextStyle(
    fontSize: 10,
    height: 0.2,
    // wordSpacing: 0.5,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: SkyColors().primary,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          if (widget.rightIcon != null)
            Icon(
              // color: widget.type.getTextColor(
              //   context: context,
              //   onHover: onHover,
              // ),
              widget.rightIcon,
              // size: widget.size.iconSize,
            ),
          Expanded(
            child: TextField(
              style: TextStyle(
                fontSize: 12,
                height: 1,
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
                // filled: true,
                // fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                // hintText: 'Hint Text',
                // helperText: 'Helper Text',
                // helperStyle: a,
                // counterText: '0 characters',
                // counterStyle: a,
              ),
            ),
          ),
          if (widget.rightIcon != null)
            Icon(
              // color: widget.type.getTextColor(
              //   context: context,
              //   onHover: onHover,
              // ),
              widget.rightIcon,
              // size: widget.size.iconSize,
            ),
        ],
      ),
    );
  }
}
