import 'package:flutter/material.dart';

import '../buttons/buttons.dart';

class ButtonGroup extends StatefulWidget {
  const ButtonGroup({
    super.key,
    required this.children,
  });
  final List<SkyButton> children;

  @override
  State<ButtonGroup> createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  @override
  void initState() {
    for (SkyButton item in widget.children) {
      print(item.toStringShort());
      SkyButton();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.children,
    );
  }
}
