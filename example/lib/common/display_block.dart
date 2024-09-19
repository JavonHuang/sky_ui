import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

class DisplayBlock extends StatelessWidget {
  final List<Widget> children;
  final String? description;
  const DisplayBlock({super.key, required this.children, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: SkyColors().defaultBg,
        border: Border.all(
          width: 1,
          color: SkyColors().baseBorder,
        ),
        borderRadius: SkyBorderRadius().normalBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: SkyColors().white,
              border: description != null
                  ? Border(
                      bottom: BorderSide(
                        width: 1,
                        color: SkyColors().baseBorder,
                      ),
                    )
                  : null,
              borderRadius: SkyBorderRadius().normalBorderRadius,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
          if (description != null)
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: SkyColors().white,
                border: Border.all(
                  width: 1,
                  color: SkyColors().baseBorder,
                ),
                borderRadius: SkyBorderRadius().normalBorderRadius,
              ),
              child: Text(
                description!,
                style: const TextStyle(color: Color(0xFF5e6d82)),
              ),
            )
        ],
      ),
    );
  }
}
