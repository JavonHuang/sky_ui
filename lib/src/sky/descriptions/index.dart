import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
part 'models/descriptions_item.dart';

class SkyDescriptions extends StatefulWidget {
  final bool border;
  final int column;
  final Axis scrollDirection;
  final SkySize size;
  final String? title;
  final String? extra;
  final bool colon;
  final List<DescriptionsItem> children;
  const SkyDescriptions({
    super.key,
    this.border = false,
    this.column = 3,
    this.scrollDirection = Axis.horizontal,
    this.size = SkySize.medium,
    this.title,
    this.extra,
    this.colon = true,
    required this.children,
  });

  @override
  State<SkyDescriptions> createState() => _SkyDescriptionsState();
}

class _SkyDescriptionsState extends State<SkyDescriptions> {
  double get span => 24 / widget.column;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.title ?? "",
                style: TextStyle(
                  fontSize: SkyFontSizes().titleSmallFont,
                  color: SkyColors().primaryText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(widget.extra ?? ""),
          ],
        ),
        SkyRow(
          children: widget.children.map((e) => Text("898989")).toList(),
        )
      ],
    );
  }
}
