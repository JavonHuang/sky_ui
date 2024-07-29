part of 'sky_tag.dart';

enum SkyTagSize {
  large,
  medium,
  small;

  const SkyTagSize();

  double get height {
    switch (this) {
      case large:
        return 40.scaleSpacing;
      case medium:
        return 36.scaleSpacing;
      case small:
        return 32.scaleSpacing;
    }
  }

  double get spacing {
    switch (this) {
      case large:
        return 10.scaleSpacing;
      case medium:
        return 8.scaleSpacing;
      case small:
        return 6.scaleSpacing;
    }
  }

  double get iconSize {
    switch (this) {
      case large:
        return 18.scaleFontSize;
      case medium:
        return 16.scaleFontSize;
      case small:
        return 14.scaleFontSize;
    }
  }

  double get textSize {
    switch (this) {
      case large:
        return SkyFontSizes().s16;
      case medium:
        return SkyFontSizes().s14;
      case small:
        return SkyFontSizes().s12;
    }
  }

  EdgeInsets padding() {
    switch (this) {
      case large:
        return EdgeInsets.symmetric(horizontal: 18.scaleSpacing);
      case medium:
        return EdgeInsets.symmetric(horizontal: 16.scaleSpacing);
      case small:
        return EdgeInsets.symmetric(horizontal: 14.scaleSpacing);
    }
  }
}

enum SkyTagType {
  normal,
  primary,
  success,
  warning,
  danger,
  info;

  Color? getTextColor({
    required BuildContext context,
    Color? customizeColor,
    bool plain = false,
  }) {
    if (customizeColor != null) {
      return customizeColor;
    }
    late Color? textColor;
    switch (this) {
      case SkyTagType.normal:
        textColor = SkyColors().primaryText;
        break;
      case SkyTagType.primary:
        textColor = plain ? SkyColors().primary : SkyColors().white;
        break;

      case SkyTagType.danger:
        textColor = plain ? SkyColors().danger : SkyColors().white;
        break;
      case SkyTagType.warning:
        textColor = plain ? SkyColors().warning : SkyColors().white;
        break;
      case SkyTagType.success:
        textColor = plain ? SkyColors().success : SkyColors().white;
        break;
      case SkyTagType.info:
        textColor = plain ? SkyColors().info : SkyColors().white;
        break;
    }
    return textColor;
  }

  Color? getBorderColor({
    required BuildContext context,
    Color? customizeColor,
  }) {
    if (customizeColor != null) {
      return customizeColor;
    }
    late Color? borderColor;
    switch (this) {
      case SkyTagType.normal:
        borderColor = SkyColors().primaryText;
        break;
      case SkyTagType.primary:
        borderColor = SkyColors().primary;
        break;
      case SkyTagType.danger:
        borderColor = SkyColors().danger;
        break;
      case SkyTagType.warning:
        borderColor = SkyColors().warning;
        break;
      case SkyTagType.success:
        borderColor = SkyColors().success;
        break;
      case SkyTagType.info:
        borderColor = SkyColors().info;
        break;
    }
    return borderColor;
  }

  Color? getBackgroundColor({
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
      case SkyTagType.normal:
        backgroundColor = SkyColors().white;
        break;
      case SkyTagType.primary:
        backgroundColor = SkyColors().primary;
        break;
      case SkyTagType.danger:
        backgroundColor = SkyColors().danger;
        break;
      case SkyTagType.warning:
        backgroundColor = SkyColors().warning;
        break;
      case SkyTagType.success:
        backgroundColor = SkyColors().success;
        break;
      case SkyTagType.info:
        backgroundColor = SkyColors().info;
        break;
    }
    if (plain) {
      backgroundColor = backgroundColor.withOpacity(0.2);
    }

    return backgroundColor;
  }

  Color? getCloseBackgroundColor({
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
      case SkyTagType.normal:
        backgroundColor = SkyColors().white;
        break;
      case SkyTagType.primary:
        backgroundColor = SkyColors().primary;
        break;
      case SkyTagType.danger:
        backgroundColor = SkyColors().danger;
        break;
      case SkyTagType.warning:
        backgroundColor = SkyColors().warning;
        break;
      case SkyTagType.success:
        backgroundColor = SkyColors().success;
        break;
      case SkyTagType.info:
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

  Color? getCloseColor({
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
      case SkyTagType.normal:
        textColor = SkyColors().primaryText;
        break;
      case SkyTagType.primary:
        textColor = plain ? SkyColors().primary : SkyColors().white;
        break;

      case SkyTagType.danger:
        textColor = plain ? SkyColors().danger : SkyColors().white;
        break;
      case SkyTagType.warning:
        textColor = plain ? SkyColors().warning : SkyColors().white;
        break;
      case SkyTagType.success:
        textColor = plain ? SkyColors().success : SkyColors().white;
        break;
      case SkyTagType.info:
        textColor = plain ? SkyColors().info : SkyColors().white;
        break;
    }
    return textColor;
  }
}
