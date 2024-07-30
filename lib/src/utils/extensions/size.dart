import 'package:flutter/material.dart';
import 'package:sky_ui/src/utils/utils.dart';

import '../../styles/styles.dart';

enum SkySize {
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
      case SkySize.large:
        return EdgeInsets.symmetric(horizontal: 18.scaleSpacing);
      case SkySize.medium:
        return EdgeInsets.symmetric(horizontal: 16.scaleSpacing);
      case SkySize.small:
        return EdgeInsets.symmetric(horizontal: 14.scaleSpacing);
    }
  }
}
