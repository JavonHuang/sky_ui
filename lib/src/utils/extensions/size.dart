import 'package:flutter/material.dart';
import 'package:sky_ui/src/utils/utils.dart';

import '../../styles/styles.dart';

enum SkySize {
  large,
  medium,
  small,
  mini;

  double get height {
    switch (this) {
      case large:
        return 40.scaleSpacing;
      case medium:
        return 36.scaleSpacing;
      case small:
        return 32.scaleSpacing;
      case mini:
        return 28.scaleSpacing;
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
      case mini:
        return 4.scaleSpacing;
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
      case mini:
        return 8.scaleFontSize;
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
      case mini:
        return 12.scaleFontSize;
    }
  }

  double get textSize {
    switch (this) {
      case large:
        return SkyFontSizes().s14;
      case medium:
        return SkyFontSizes().s14;
      case small:
        return SkyFontSizes().s12;
      case mini:
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
      case SkySize.mini:
        return EdgeInsets.symmetric(horizontal: 14.scaleSpacing);
    }
  }

  EdgeInsets get boxPadding {
    switch (this) {
      case SkySize.large:
        return EdgeInsets.symmetric(horizontal: 12.scaleSpacing, vertical: 12.scaleSpacing);
      case SkySize.medium:
        return EdgeInsets.symmetric(horizontal: 10.scaleSpacing, vertical: 12.scaleSpacing);
      case SkySize.small:
        return EdgeInsets.symmetric(horizontal: 8.scaleSpacing, vertical: 8.scaleSpacing);
      case SkySize.mini:
        return EdgeInsets.symmetric(horizontal: 8.scaleSpacing, vertical: 8.scaleSpacing);
    }
  }
}
