part of 'buttons.dart';

extension SkyButtonSize on SkySize {}

extension SkyButtonType on SkyType {
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
      case SkyType.normal:
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
      case SkyType.text:
        textColor = plain ? SkyColors().primary : SkyColors().primary;
        break;
    }
    if (active || onHover) {
      textColor = SkyColors().white;
      if (this == SkyType.normal) {
        textColor = SkyColors().primary;
      }
      if (this == SkyType.text) {
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
      case SkyType.normal:
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
      case SkyType.text:
        borderColor = SkyColors().white;
        break;
    }
    if (active || onHover) {
      if (this == SkyType.normal) {
        borderColor = SkyColors().primary;
      }
      if (this == SkyType.text) {
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
      case SkyType.normal:
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
      case SkyType.text:
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
