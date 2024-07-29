import 'package:flutter/material.dart';

import 'sky_form.dart';

class SkyFormFieldBridge<T> extends StatefulWidget {
  const SkyFormFieldBridge({super.key, required this.itemType});
  final String itemType;

  @override
  SkyFormFieldBridgeState<T> createState() => SkyFormFieldBridgeState<T>();
}

class SkyFormFieldBridgeState<T> extends State<SkyFormFieldBridge<T>> {
  // int get size => SkyFormField.maybeOf(context)?.size ?? 0;
  late bool _hasRegister = false;
  late dynamic _con;
  void setControll(dynamic c) {
    _con = c;
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasRegister) {
      SkyFormField.maybeOf(context)?.register(super.widget, widget.itemType, _con);
      _hasRegister = true;
    }
    return const SizedBox();
  }
}
