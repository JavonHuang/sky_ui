part of 'badge.dart';

enum SkyBadgeType {
  normal,
  primary,
  success,
  warning,
  danger,
  info;

  Color? getBackgroundColor({
    required BuildContext context,
    Color? customizeColor,
  }) {
    if (customizeColor != null) {
      return customizeColor;
    }
    late Color backgroundColor;
    switch (this) {
      case SkyBadgeType.normal:
        backgroundColor = SkyColors().white;
        break;
      case SkyBadgeType.primary:
        backgroundColor = SkyColors().primary;
        break;
      case SkyBadgeType.danger:
        backgroundColor = SkyColors().danger;
        break;
      case SkyBadgeType.warning:
        backgroundColor = SkyColors().warning;
        break;
      case SkyBadgeType.success:
        backgroundColor = SkyColors().success;
        break;
      case SkyBadgeType.info:
        backgroundColor = SkyColors().info;
        break;
    }
    return backgroundColor;
  }
}
