part of 'buttons.dart';

enum SkyButtonSize {
  large,
  medium,
  small;

  const SkyButtonSize();

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

  double get loadingSize {
    switch (this) {
      case large:
        return 13.scaleFontSize;
      case medium:
        return 12.scaleFontSize;
      case small:
        return 10.scaleFontSize;
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

  EdgeInsets padding({
    bool circle = false,
  }) {
    if (circle) {
      return EdgeInsets.zero;
    }
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

enum SkyButtonType {
  normal,
  primary,
  success,
  warning,
  danger,
  info,
  text;

  Color? getTextColor({
    required BuildContext context,
    Color? customizeColor,
    bool disabled = false,
    bool loading = false,
    bool plain = false,
    required bool active,
    required bool onHover,
  }) {
    if (customizeColor != null) {
      return (disabled || loading) ? customizeColor.withOpacity(0.6) : customizeColor;
    }
    late Color? textColor;
    switch (this) {
      case SkyButtonType.normal:
        textColor = SkyColors().primaryText;
        break;
      case SkyButtonType.primary:
        textColor = plain ? SkyColors().primary : SkyColors().white;
        break;

      case SkyButtonType.danger:
        textColor = plain ? SkyColors().danger : SkyColors().white;
        break;
      case SkyButtonType.warning:
        textColor = plain ? SkyColors().warning : SkyColors().white;
        break;
      case SkyButtonType.success:
        textColor = plain ? SkyColors().success : SkyColors().white;
        break;
      case SkyButtonType.info:
        textColor = plain ? SkyColors().info : SkyColors().white;
        break;
      case SkyButtonType.text:
        textColor = plain ? SkyColors().primary : SkyColors().primary;
        break;
    }
    if (active || onHover) {
      textColor = SkyColors().white;
      if (this == SkyButtonType.normal) {
        textColor = SkyColors().primary;
      }
      if (this == SkyButtonType.text) {
        textColor = SkyColors().primary.withOpacity(0.6);
      }
    }
    return (disabled || loading) ? textColor.withOpacity(0.6) : textColor;
  }

  Color? getBorderColor({
    required BuildContext context,
    Color? customizeColor,
    bool disabled = false,
    bool loading = false,
    required bool active,
    required bool onHover,
  }) {
    if (customizeColor != null) {
      return (disabled || loading) ? customizeColor.withOpacity(0.4) : customizeColor;
    }
    late Color? borderColor;
    switch (this) {
      case SkyButtonType.normal:
        borderColor = SkyColors().primaryText;
        break;
      case SkyButtonType.primary:
        borderColor = SkyColors().primary;
        break;
      case SkyButtonType.danger:
        borderColor = SkyColors().danger;
        break;
      case SkyButtonType.warning:
        borderColor = SkyColors().warning;
        break;
      case SkyButtonType.success:
        borderColor = SkyColors().success;
        break;
      case SkyButtonType.info:
        borderColor = SkyColors().info;
        break;
      case SkyButtonType.text:
        borderColor = SkyColors().white;
        break;
    }
    if (active || onHover) {
      if (this == SkyButtonType.normal) {
        borderColor = SkyColors().primary;
      }
      if (this == SkyButtonType.text) {
        borderColor = SkyColors().white;
      }
    }
    return (disabled || loading) ? borderColor.withOpacity(0.4) : borderColor;
  }

  Color? getBackgroundColor({
    required BuildContext context,
    bool disabled = false,
    bool loading = false,
    Color? customizeColor,
    bool plain = false,
    bool active = false,
    bool onHover = false,
    bool chosenButton = false,
  }) {
    if (customizeColor != null) {
      return (disabled || loading) ? customizeColor.withOpacity(0.4) : customizeColor;
    }
    late Color backgroundColor;
    switch (this) {
      case SkyButtonType.normal:
        backgroundColor = SkyColors().white;
        break;
      case SkyButtonType.primary:
        backgroundColor = SkyColors().primary;
        break;
      case SkyButtonType.danger:
        backgroundColor = SkyColors().danger;
        break;
      case SkyButtonType.warning:
        backgroundColor = SkyColors().warning;
        break;
      case SkyButtonType.success:
        backgroundColor = SkyColors().success;
        break;
      case SkyButtonType.info:
        backgroundColor = SkyColors().info;
        break;
      case SkyButtonType.text:
        backgroundColor = SkyColors().white;
        break;
    }
    if (plain) {
      backgroundColor = backgroundColor.withOpacity(0.2);
    }
    if (onHover || chosenButton) {
      backgroundColor = backgroundColor.withOpacity(0.8);
    }
    if (active) {
      backgroundColor = darkenColor(backgroundColor.withOpacity(1));
    }
    if (plain) {
      return (disabled || loading) ? backgroundColor.withOpacity(0.1) : backgroundColor;
    } else {
      return (disabled || loading) ? backgroundColor.withOpacity(0.4) : backgroundColor;
    }
  }
}
