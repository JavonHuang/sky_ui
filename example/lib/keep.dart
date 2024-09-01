import 'package:flutter/material.dart';

class KeepValue extends StatefulWidget {
  final Widget child;
  const KeepValue({super.key, required this.child});

  @override
  State<KeepValue> createState() => _KeepValueState();
}

class _KeepValueState extends State<KeepValue> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
