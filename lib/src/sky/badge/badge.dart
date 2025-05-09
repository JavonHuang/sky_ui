import 'package:flutter/material.dart';
import 'package:sky_ui/src/utils/utils.dart';

import '../../styles/styles.dart';

part 'badge_enum.dart';

class SkyBadge extends StatefulWidget {
  const SkyBadge({
    super.key,
    this.text = "",
    required this.child,
    this.type = SkyBadgeType.primary,
  });
  final String text;
  final Widget child;
  final SkyBadgeType type;

  @override
  State<SkyBadge> createState() => _SkyBadgeState();
}

class _SkyBadgeState extends State<SkyBadge> {
  BorderRadiusGeometry? get borderRadius {
    return BorderRadius.circular(10.scaleSpacing);
  }

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(4.scaleSpacing),
            child: widget.child,
          ),
          if (widget.text.isEmpty)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.scaleSpacing, vertical: 4.scaleSpacing),
                decoration: BoxDecoration(
                  color: widget.type.getBackgroundColor(context: context),
                  borderRadius: BorderRadius.circular(4.scaleSpacing),
                ),
              ),
            ),
          if (widget.text.isNotEmpty)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.scaleSpacing, vertical: 1.scaleSpacing),

                constraints: BoxConstraints(minWidth: 18.scaleSpacing), // 最小宽度为100
                decoration: BoxDecoration(
                  color: widget.type.getBackgroundColor(context: context),
                  borderRadius: borderRadius,
                ),
                child: Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                      fontSize: SkyFontSizes().auxiliaryFont,
                      color: SkyColors().white,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
