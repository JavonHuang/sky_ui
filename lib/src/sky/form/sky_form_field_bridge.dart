import 'package:flutter/material.dart';

import 'sky_form.dart';

class SkyFormFieldBridge<T> extends StatefulWidget {
  const SkyFormFieldBridge({super.key, required this.itemType});
  final SkyFormType itemType;

  @override
  SkyFormFieldBridgeState<T> createState() => SkyFormFieldBridgeState<T>();
}

class SkyFormFieldBridgeState<T> extends State<SkyFormFieldBridge<T>> with RestorationMixin implements SkyFormFieldBridgeStateAbstract {
  final RestorableStringN _errorText = RestorableStringN(null);
  final RestorableBool _hasInteractedByUser = RestorableBool(false);

  late bool _hasRegister = false;
  late dynamic _con;

  void setControll(dynamic c) {
    _con = c;
  }

  @override
  Widget build(BuildContext context) {
    if (!_hasRegister) {
      SkyFormField.maybeOf(context)?.register(super.widget, widget.itemType, _con, setValue);
      _hasRegister = true;
    }
    return const SizedBox();
  }

  @override
  String? get restorationId => SkyFormField.maybeOf(context)?.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_errorText, 'error_text');
    registerForRestoration(_hasInteractedByUser, 'has_interacted_by_user');
  }

  @override
  void dispose() {
    _errorText.dispose();
    _hasInteractedByUser.dispose();
    super.dispose();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

abstract class SkyFormFieldBridgeStateAbstract {
  void setValue(String e);
}
