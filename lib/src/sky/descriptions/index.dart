import 'dart:ffi';

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
  int get span => (24 / widget.column).floor();
  int get fill {
    int count = (widget.children.length * span);
    if (count < 24) {
      return 24 - count;
    } else {
      int num = count % 24;
      if (num == 0) {
        return 0;
      } else {
        return 24 - num;
      }
    }
  }

  List<Widget> renderItem() {
    List<Widget> result = [];
    int i = 0;
    for (DescriptionsItem item in widget.children) {
      i++;
      result.add(
        SkyCol(
          span: i == widget.children.length ? (span + fill) : span,
          height: 36,
          child: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                color: SkyColors().white,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: SkyColors().lighterBorder,
                  ),
                  right: BorderSide(
                    width: 1,
                    color: SkyColors().lighterBorder,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: SkyColors().tableRowBg,
                      border: Border(
                        right: BorderSide(
                          width: 1,
                          color: SkyColors().lighterBorder,
                        ),
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(item.label ?? ""),
                  ),
                  Expanded(
                    child: Text(item.value ?? ''),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                color: SkyColors().lighterBorder,
              ),
              left: BorderSide(
                width: 1,
                color: SkyColors().lighterBorder,
              ),
            ),
          ),
          child: SkyRow(
            alignment: WrapAlignment.start,
            children: renderItem(),
          ),
        )
      ],
    );
  }
}
