part of 'sky_tag.dart';

extension SkyTagSize on SkySize {}

extension SkyTagType on SkyType {
  Color? getTagTextColor({
    required BuildContext context,
    Color? customizeColor,
    bool plain = false,
  }) {
    if (customizeColor != null) {
      return customizeColor;
    }
    late Color? textColor;
    switch (this) {
      case SkyType.normal || SkyType.text:
        textColor = SkyColors().primaryText;
        break;
      case SkyType.primary:
        textColor = plain ? SkyColors().primary : SkyColors().white;
        break;

      case SkyType.danger:
        textColor = plain ? SkyColors().danger : SkyColors().white;
        break;
      case SkyType.warning:
        textColor = plain ? SkyColors().warning : SkyColors().white;
        break;
      case SkyType.success:
        textColor = plain ? SkyColors().success : SkyColors().white;
        break;
      case SkyType.info:
        textColor = plain ? SkyColors().info : SkyColors().white;
        break;
    }
    return textColor;
  }

  Color? getTagBorderColor({
    required BuildContext context,
    Color? customizeColor,
  }) {
    if (customizeColor != null) {
      return customizeColor;
    }
    late Color? borderColor;
    switch (this) {
      case SkyType.normal || SkyType.text:
        borderColor = SkyColors().primaryText;
        break;
      case SkyType.primary:
        borderColor = SkyColors().primary;
        break;
      case SkyType.danger:
        borderColor = SkyColors().danger;
        break;
      case SkyType.warning:
        borderColor = SkyColors().warning;
        break;
      case SkyType.success:
        borderColor = SkyColors().success;
        break;
      case SkyType.info:
        borderColor = SkyColors().info;
        break;
    }
    return borderColor;
  }

  Color? getTagBackgroundColor({
    required BuildContext context,
    Color? customizeColor,
    bool plain = false,
    bool onHover = false,
  }) {
    if (customizeColor != null) {
      return customizeColor;
    }
    late Color backgroundColor;
    switch (this) {
      case SkyType.normal || SkyType.text:
        backgroundColor = SkyColors().white;
        break;
      case SkyType.primary:
        backgroundColor = SkyColors().primary;
        break;
      case SkyType.danger:
        backgroundColor = SkyColors().danger;
        break;
      case SkyType.warning:
        backgroundColor = SkyColors().warning;
        break;
      case SkyType.success:
        backgroundColor = SkyColors().success;
        break;
      case SkyType.info:
        backgroundColor = SkyColors().info;
        break;
    }
    if (plain) {
      backgroundColor = backgroundColor.withOpacity(0.2);
    }

    return backgroundColor;
  }

  Color? getTagCloseBackgroundColor({
    required BuildContext context,
    Color? customizeColor,
    bool plain = false,
    bool onHover = false,
  }) {
    if (!onHover) {
      return SkyColors().transparent;
    }
    if (customizeColor != null) {
      return customizeColor;
    }
    late Color backgroundColor;
    switch (this) {
      case SkyType.normal || SkyType.text:
        backgroundColor = SkyColors().white;
        break;
      case SkyType.primary:
        backgroundColor = SkyColors().primary;
        break;
      case SkyType.danger:
        backgroundColor = SkyColors().danger;
        break;
      case SkyType.warning:
        backgroundColor = SkyColors().warning;
        break;
      case SkyType.success:
        backgroundColor = SkyColors().success;
        break;
      case SkyType.info:
        backgroundColor = SkyColors().info;
        break;
    }
    if (plain) {
      backgroundColor = backgroundColor;
    } else {
      backgroundColor = SkyColors().white;
      backgroundColor = backgroundColor.withOpacity(0.2);
    }

    return backgroundColor;
  }

  Color? getTagCloseColor({
    required BuildContext context,
    Color? customizeColor,
    bool plain = false,
    required bool onHover,
  }) {
    if (customizeColor != null) {
      return customizeColor;
    }
    if (onHover) {
      return SkyColors().white;
    }
    late Color? textColor;
    switch (this) {
      case SkyType.normal || SkyType.text:
        textColor = SkyColors().primaryText;
        break;
      case SkyType.primary:
        textColor = plain ? SkyColors().primary : SkyColors().white;
        break;
      case SkyType.danger:
        textColor = plain ? SkyColors().danger : SkyColors().white;
        break;
      case SkyType.warning:
        textColor = plain ? SkyColors().warning : SkyColors().white;
        break;
      case SkyType.success:
        textColor = plain ? SkyColors().success : SkyColors().white;
        break;
      case SkyType.info:
        textColor = plain ? SkyColors().info : SkyColors().white;
        break;
    }
    return textColor;
  }
}
