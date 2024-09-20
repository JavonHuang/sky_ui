import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';

import 'models/compute.dart';
part 'models/descriptions_item.dart';

class SkyDescriptions extends StatefulWidget {
  final bool border;
  final int column;
  final Axis axis;
  final SkySize size;
  final String? title;
  final String? extra;
  final bool colon;
  final List<DescriptionsItem> children;
  const SkyDescriptions({
    super.key,
    this.border = false,
    this.column = 3,
    this.axis = Axis.horizontal,
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
  List<Widget> renderItem() {
    Compute compute = Compute(children: widget.children, column: widget.column, size: widget.size);
    compute.axis = widget.axis;
    List<Widget> result = [];
    for (List<DescriptionsItem> row in compute.renderRow) {
      Color borderColor = widget.border ? SkyColors().lighterBorder : SkyColors().transparent;
      List<Widget> colList = [];
      int colIndex = 0;
      for (DescriptionsItem col in row) {
        double labelWidth = compute.columnLabelWidth(colIndex);
        colList.add(
          Flexible(
            flex: col.span,
            child: Container(
              decoration: BoxDecoration(
                color: SkyColors().white,
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: borderColor,
                  ),
                  right: BorderSide(
                    width: 1,
                    color: borderColor,
                  ),
                ),
              ),
              child: widget.axis == Axis.horizontal
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          color: col.bgLabelColor,
                          child: compute.createLable(labelWidth, col.label ?? col.labelWidget, widget.border, col),
                        ),
                        Expanded(
                          child: Container(
                            color: col.bgValueColor,
                            child: Padding(
                              padding: widget.size.descriptionsPadding(border: widget.border),
                              child: col.value != null ? Text(col.value ?? '') : col.valueWidget,
                            ),
                          ),
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                            child: Container(
                          color: col.bgLabelColor,
                          child: compute.createLable(labelWidth, col.label ?? col.labelWidget, widget.border, col),
                        )),
                        Expanded(
                          child: Container(
                            color: col.bgValueColor,
                            child: Padding(
                              padding: widget.size.descriptionsPadding(border: widget.border),
                              child: col.value != null ? Text(col.value ?? '') : col.valueWidget,
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        );
        colIndex++;
      }
      result.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: colList,
          ),
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = widget.border ? SkyColors().lighterBorder : SkyColors().transparent;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.title != null)
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
                color: borderColor,
              ),
              left: BorderSide(
                width: 1,
                color: borderColor,
              ),
            ),
          ),
          child: Column(
            children: renderItem(),
          ),
        )
      ],
    );
  }
}
