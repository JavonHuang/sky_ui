part of 'sky_link.dart';

enum SkyLinkSize {
  large,
  medium,
  small;

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
}

enum SkyLinkType {
  normal,
  primary,
  success,
  warning,
  danger,
  info;

  Color? getTextColor({
    required BuildContext context,
    Color? customizeColor,
    bool disabled = false,
    required bool onHover,
  }) {
    if (customizeColor != null) {
      return (disabled) ? customizeColor.withOpacity(0.6) : customizeColor;
    }
    late Color? textColor;
    switch (this) {
      case SkyLinkType.normal:
        textColor = SkyColors().primaryText;
        break;
      case SkyLinkType.primary:
        textColor = SkyColors().primary;
        break;
      case SkyLinkType.danger:
        textColor = SkyColors().danger;
        break;
      case SkyLinkType.warning:
        textColor = SkyColors().warning;
        break;
      case SkyLinkType.success:
        textColor = SkyColors().success;
        break;
      case SkyLinkType.info:
        textColor = SkyColors().info;
        break;
    }
    if (onHover) {
      if (this == SkyLinkType.normal) {
        textColor = SkyColors().primary;
      }
      textColor = textColor.withOpacity(0.8);
    }
    return (disabled) ? textColor.withOpacity(0.6) : textColor;
  }

  Color? getUnderlineColor({
    required BuildContext context,
    Color? customizeColor,
    bool disabled = false,
    required bool onHover,
    required bool underline,
  }) {
    if (!underline || !onHover) {
      return SkyColors().transparent;
    }
    if (customizeColor != null) {
      return (disabled) ? customizeColor.withOpacity(0.6) : customizeColor;
    }
    late Color? textColor;
    switch (this) {
      case SkyLinkType.normal:
        textColor = SkyColors().primaryText;
        break;
      case SkyLinkType.primary:
        textColor = SkyColors().primary;
        break;
      case SkyLinkType.danger:
        textColor = SkyColors().danger;
        break;
      case SkyLinkType.warning:
        textColor = SkyColors().warning;
        break;
      case SkyLinkType.success:
        textColor = SkyColors().success;
        break;
      case SkyLinkType.info:
        textColor = SkyColors().info;
        break;
    }
    if (onHover) {
      if (this == SkyLinkType.normal) {
        textColor = SkyColors().primary;
      }
      textColor = textColor.withOpacity(0.8);
    }
    return (disabled) ? textColor.withOpacity(0.6) : textColor;
  }
}
