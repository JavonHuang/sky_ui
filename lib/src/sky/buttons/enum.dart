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
