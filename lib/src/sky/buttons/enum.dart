part of 'buttons.dart';

enum TekButtonSize {
  extraLarge,
  large,
  medium,
  small;

  const TekButtonSize();

  double get height {
    switch (this) {
      case extraLarge:
        return 56;
      case large:
        return 48;
      case medium:
        return 40;
      case small:
        return 32;
    }
  }

  double get spacing {
    switch (this) {
      case extraLarge:
        return 12.scaleSpacing;
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
      case extraLarge:
        return 14.scaleFontSize;
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
      case extraLarge:
        return 20.scaleFontSize;
      case large:
        return 18.scaleFontSize;
      case medium:
        return 18.scaleFontSize;
      case small:
        return 14.scaleFontSize;
    }
  }

  // TextStyle get textStyle {
  //   switch (this) {
  //     case extraLarge:
  //       return TekTextStyles().titleMedium;
  //     case large:
  //       return TekTextStyles().body;
  //     case medium:
  //       return TekTextStyles().body;
  //     case small:
  //       return TekTextStyles().label;
  //   }
  // }

  EdgeInsets get padding {
    switch (this) {
      case extraLarge:
        return EdgeInsets.symmetric(horizontal: 20.scaleSpacing);
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
  primary,
  success,
  warning,
  danger,
  info;

  Color? getTextColor({
    required BuildContext context,
    Color? customizeColor,
    bool disabled = false,
    bool loading = false,
    bool plain = false,
  }) {
    if (customizeColor != null) {
      return (disabled || loading) ? customizeColor.withOpacity(0.4) : customizeColor;
    }
    late Color? textColor;
    switch (this) {
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
    }
    return (disabled || loading) ? textColor.withOpacity(0.4) : textColor;
  }

  Color? getBackgroundColor({
    required BuildContext context,
    bool disabled = false,
    bool loading = false,
    Color? customizeColor,
    bool plain = false,
  }) {
    if (customizeColor != null) {
      return (disabled || loading) ? customizeColor.withOpacity(0.4) : customizeColor;
    }
    late Color backgroundColor;
    switch (this) {
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
    }
    if (plain) {
      backgroundColor = backgroundColor.withAlpha(0);
    }
    return (disabled || loading) ? backgroundColor.withOpacity(0.4) : backgroundColor;
  }
}
