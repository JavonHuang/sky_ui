part of 'index.dart';

enum SkyAlertEffect {
  light,
  dark;
}

enum SkyAlertType {
  success,
  warning,
  info,
  error;

  IconData getAlertIconData({
    IconData? customizeIcon,
  }) {
    if (customizeIcon != null) {
      return customizeIcon;
    }
    switch (this) {
      case SkyAlertType.success:
        return ElementIcons.success;
      case SkyAlertType.warning:
        return ElementIcons.warning;
      case SkyAlertType.info:
        return ElementIcons.info;
      case SkyAlertType.error:
        return ElementIcons.error;
    }
  }

  Color? getBackgroundColor({
    required BuildContext context,
    Color? customizeColor,
  }) {
    if (customizeColor != null) {
      return customizeColor;
    }
    switch (this) {
      case SkyAlertType.success:
        return SkyColors().success;
      case SkyAlertType.warning:
        return SkyColors().warning;
      case SkyAlertType.info:
        return SkyColors().info;
      case SkyAlertType.error:
        return SkyColors().danger;
    }
  }
}
