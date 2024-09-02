import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import 'sky_form.dart';

class SkyFormFieldBridge<T> extends StatefulWidget {
  const SkyFormFieldBridge({
    super.key,
    required this.itemType,
    required this.fieldSize,
    required this.fieldDisabled,
  });
  final SkyFormType itemType;
  final SkySize fieldSize;
  final bool fieldDisabled;

  @override
  SkyFormFieldBridgeState<T> createState() => SkyFormFieldBridgeState<T>();
}

class SkyFormFieldBridgeState<T> extends State<SkyFormFieldBridge<T>> with RestorationMixin implements SkyFormFieldBridgeStateAbstract {
  final RestorableStringN _errorText = RestorableStringN(null);
  final RestorableBool _hasInteractedByUser = RestorableBool(false);

  SkySize get size {
    SkyForm? skyForm = SkyFormField.maybeOf(context)?.skyForm;

    if (skyForm != null && skyForm!.size != null) {
      return skyForm!.size!;
    } else {
      return widget.fieldSize;
    }
  }

  bool get disabled {
    SkyForm? skyForm = SkyFormField.maybeOf(context)?.skyForm;

    if (skyForm != null && skyForm!.disabled != null) {
      return skyForm!.disabled!;
    } else {
      return widget.fieldDisabled;
    }
  }

  late bool _hasRegister = false;

  @override
  Widget build(BuildContext context) {
    if (!_hasRegister) {
      SkyFormField.maybeOf(context)?.register(super.widget, widget.itemType, setValue, getValue);
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
  void setValue(dynamic e);
  dynamic getValue();
}
