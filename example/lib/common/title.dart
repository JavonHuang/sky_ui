import 'package:flutter/material.dart';
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
          margin: const EdgeInsets.only(top: 55),
          child: Text(title, style: DemoStyle().largeTitle),
        ),
        if (descr != null)
          Container(
            // padding: DemoSpace.vMain,
            margin: const EdgeInsets.symmetric(vertical: 14),
            child: Text(
              descr!,
              style: const TextStyle().merge(DemoStyle().text),
            ),
          )
      ],
    );
  }
}
