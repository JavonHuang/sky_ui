import 'package:flutter/material.dart';
import 'space.dart';
import 'text_style.dart';

class DemoTitle extends StatelessWidget {
  final String title;
  final String? descr;
  const DemoTitle({
    super.key,
    required this.title,
    this.descr,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: DemoSpace.vlarge,
          child: Text(title, style: DemoStyle().largeTitle),
        ),
        if (descr != null)
          Container(
            padding: DemoSpace.vMain,
            child: Text(
              descr!,
              style: const TextStyle(
                color: Color(0xFF5e6d82),
              ).merge(DemoStyle().text),
            ),
          )
      ],
    );
    ;
  }
}
