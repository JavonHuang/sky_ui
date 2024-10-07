part of '../index.dart';

class TabOption {
  final String label;
  final String name;
  final Widget child;
  TabOption({
    required this.label,
    required this.name,
    required this.child,
  });
}

enum SkyTabType {
  normal,
  card,
  borderCard;

  EdgeInsetsGeometry padding(bool start, bool end) {
    switch (this) {
      case SkyTabType.normal:
        if (start) {
          return EdgeInsets.only(right: 20.scaleSpacing);
        }
        if (end) {
          return EdgeInsets.only(left: 20.scaleSpacing);
        }
        return EdgeInsets.symmetric(horizontal: 20.scaleSpacing);
      case SkyTabType.card:
        return EdgeInsets.symmetric(horizontal: 20.scaleSpacing);
      case SkyTabType.borderCard:
        return EdgeInsets.symmetric(horizontal: 20.scaleSpacing);
    }
  }

  Color get dividerColor {
    switch (this) {
      case SkyTabType.normal:
        return SkyColors().primary;
      case SkyTabType.card:
        return SkyColors().transparent;
      case SkyTabType.borderCard:
        return SkyColors().transparent;
    }
  }

  Color bottomColor() {
    switch (this) {
      case SkyTabType.normal:
        return SkyColors().baseBorder;
      case SkyTabType.card:
        return SkyColors().transparent;
      case SkyTabType.borderCard:
        return SkyColors().transparent;
    }
  }

  Decoration? decoration(bool start, bool actived) {
    switch (this) {
      case SkyTabType.normal:
        return null;
      case SkyTabType.card:
        return BoxDecoration(
          // color: Colors.red,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: actived ? SkyColors().transparent : SkyColors().baseBorder,
            ),
            top: BorderSide(
              width: 1,
              color: SkyColors().baseBorder,
            ),
            right: BorderSide(
              width: 1,
              color: SkyColors().baseBorder,
            ),
            left: BorderSide(
              width: start ? 1 : 0,
              color: SkyColors().baseBorder,
            ),
          ),
        );
      case SkyTabType.borderCard:
        return BoxDecoration(
          color: actived ? SkyColors().transparent : SkyColors().defaultBg,
          border: Border(
            bottom: BorderSide(
              width: 1,
              color: actived ? SkyColors().transparent : SkyColors().baseBorder,
            ),
            top: BorderSide(
              width: 1,
              color: SkyColors().baseBorder,
            ),
            right: BorderSide(
              width: 1,
              color: SkyColors().baseBorder,
            ),
            left: BorderSide(
              width: start ? 1 : 0,
              color: SkyColors().baseBorder,
            ),
          ),
        );
    }
  }
}
