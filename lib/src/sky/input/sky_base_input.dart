part of 'index.dart';

class SkyBaseInput extends StatelessWidget {
  const SkyBaseInput({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.disabled,
    required this.readOnly,
    required this.size,
    this.placeholder,
    this.restorationId,
    this.bucket,
    this.onChanged,
    this.onTap,
    this.obscureText = false,
    this.maxLines,
    this.minLines,
    this.maxLength,
  });

  final TextEditingController controller;
  final FocusNode focusNode;

  final bool disabled;
  final bool readOnly;
  final SkySize size;
  final String? placeholder;
  final String? restorationId;
  final RestorationBucket? bucket;
  final Function(String)? onChanged;
  final Function()? onTap;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  @override
  Widget build(BuildContext context) {
    return UnmanagedRestorationScope(
      bucket: bucket,
      child: TextField(
        maxLength: maxLength,
        maxLines: obscureText ? 1 : maxLines,
        minLines: minLines,
        restorationId: restorationId,
        mouseCursor: disabled ? SystemMouseCursors.forbidden : SystemMouseCursors.click,
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        readOnly: disabled || readOnly,
        onTap: onTap,
        cursorWidth: 1,
        style: TextStyle(
          fontSize: size.textSize,
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
            fillColor: disabled ? SkyColors().defaultBg : SkyColors().transparent,
            hoverColor: disabled ? SkyColors().defaultBg : SkyColors().transparent,
            contentPadding: size.contentPadding,
            hintText: placeholder,
            hintStyle: TextStyle(
              color: SkyColors().placeholderText,
              fontSize: size.textSize,
            ),
            isDense: true,
            counterText: ""),
        obscureText: obscureText,
      ),
    );
  }
}
