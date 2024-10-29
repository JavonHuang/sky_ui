import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sky_ui/src/src.dart';

class SkyEmpty extends StatelessWidget {
  final String? description;
  final Widget? child;
  const SkyEmpty({super.key, this.description, this.child});

  @override
  Widget build(BuildContext context) {
    final parentSize = ParentSizeProvider.of(context).size;
    return Column(
      children: [
        Center(
          child: SvgPicture.asset(
            'lib/asset/empty.svg',
            width: parentSize.width,
            height: parentSize.height,
          ),
        ),
        Text(
          description ?? "暂无数据",
          style: TextStyle(
            fontSize: SkyFontSizes().textFont,
            color: SkyColors().primaryText,
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}
