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
        return 24.scaleSpacing;
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
        return 18.scaleIconSize;
      case medium:
        return 16.scaleIconSize;
      case small:
        return 14.scaleIconSize;
      case mini:
        return 12.scaleIconSize;
    }
  }

  double get textSize {
    switch (this) {
      case large:
        return SkyIconSizes().mediumFont;
      case medium:
        return SkyIconSizes().mediumFont;
      case small:
        return SkyIconSizes().smallFont;
      case mini:
        return SkyIconSizes().smallFont;
    }
  }

  EdgeInsets padding({
    bool circle = false,
  }) {
    if (circle) {
      switch (this) {
        case SkySize.large:
          return const EdgeInsets.all(8);
        case SkySize.medium:
          return const EdgeInsets.all(6);
        case SkySize.small:
          return const EdgeInsets.all(4);
        case SkySize.mini:
          return const EdgeInsets.all(2);
      }
    }
    switch (this) {
      case SkySize.large:
        return EdgeInsets.symmetric(horizontal: 20.scaleSpacing, vertical: 10.scaleSpacing);
      case SkySize.medium:
        return EdgeInsets.symmetric(horizontal: 20.scaleSpacing, vertical: 8.scaleSpacing);
      case SkySize.small:
        return EdgeInsets.symmetric(horizontal: 15.scaleSpacing, vertical: 7.scaleSpacing);
      case SkySize.mini:
        return EdgeInsets.symmetric(horizontal: 15.scaleSpacing, vertical: 5.scaleSpacing);
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

  EdgeInsets descriptionsPadding({bool border = true}) {
    if (border) {
      switch (this) {
        case SkySize.large:
          return EdgeInsets.symmetric(horizontal: 12.scaleSpacing, vertical: 12.scaleSpacing);
        case SkySize.medium:
          return EdgeInsets.symmetric(horizontal: 10.scaleSpacing, vertical: 10.scaleSpacing);
        case SkySize.small:
          return EdgeInsets.symmetric(horizontal: 8.scaleSpacing, vertical: 8.scaleSpacing);
        case SkySize.mini:
          return EdgeInsets.symmetric(horizontal: 6.scaleSpacing, vertical: 4.scaleSpacing);
      }
    } else {
      switch (this) {
        case SkySize.large:
          return EdgeInsets.only(bottom: 12.scaleSpacing, right: 4.scaleSpacing);
        case SkySize.medium:
          return EdgeInsets.only(bottom: 10.scaleSpacing, right: 4.scaleSpacing);
        case SkySize.small:
          return EdgeInsets.only(bottom: 8.scaleSpacing, right: 4.scaleSpacing);
        case SkySize.mini:
          return EdgeInsets.only(bottom: 6.scaleSpacing, right: 4.scaleSpacing);
      }
    }
  }
}
