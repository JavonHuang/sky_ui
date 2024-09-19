part of 'index.dart';

extension SkyInputSize on SkySize {
  EdgeInsets get contentPadding {
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
