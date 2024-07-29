import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
part 'sky_form_field.dart';

class SkyForm extends StatefulWidget {
  const SkyForm({
    super.key,
    required this.child,
    this.labelWidth,
  });
  final Widget child;
  final double? labelWidth;

  static SkyFormState? maybeOf(BuildContext context) {
    final _SkyFormScope? scope = context.dependOnInheritedWidgetOfExactType<_SkyFormScope>();
    return scope?._skyFormState;
  }

  @override
  State<SkyForm> createState() => SkyFormState();
}

typedef FutureBoolFunction = Future<bool> Function();

class SkyFormState extends State<SkyForm> {
  late int _count = 0;
  List<SkyFormFieldState> formFieldList = [];

  double? get labelWidth => widget.labelWidth;

  Future<SkyFormValidate> validate() async {
    List<Future<dynamic>> list = [];
    for (SkyFormFieldState item in formFieldList) {
      list.add(item.validate());
    }
    List<dynamic> results = await Future.wait(list);
    return Future.value(SkyFormValidate(result: true, fieldValidate: results));
  }

  Future<SkyFormValidate> validateField(String prop) async {
    List<Future<dynamic>> list = [];
    for (SkyFormFieldState item in formFieldList) {
      if (item.widget.prop == prop) {
        list.add(item.validate());
      }
    }
    List<dynamic> results = await Future.wait(list);
    return Future.value(SkyFormValidate(result: true, fieldValidate: results));
  }

  void clearValidate() {
    for (SkyFormFieldState item in formFieldList) {
      item.clearValidate();
    }
  }

  void resetField() {
    for (SkyFormFieldState item in formFieldList) {
      item.resetField();
    }
  }

  void _register(SkyFormFieldState e) {
    int index = formFieldList.indexWhere((item) => item.widget.prop == e.widget.prop);
    if (index > 0) {
      formFieldList[index] = e;
    } else {
      formFieldList.add(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _SkyFormScope(
      count: _count,
      skyFormState: this,
      child: widget.child,
    );
  }
}

class _SkyFormScope extends InheritedWidget {
  const _SkyFormScope({
    required super.child,
    required SkyFormState skyFormState,
    required int count,
  })  : _count = count,
        _skyFormState = skyFormState;

  final SkyFormState _skyFormState;
  final int? _count;
  SkyForm get skyForm => _skyFormState.widget;

  @override
  bool updateShouldNotify(_SkyFormScope old) => _count != old._count;
}

class SkyFormValidate {
  final bool result;
  final List<dynamic> fieldValidate;
  SkyFormValidate({
    required this.result,
    required this.fieldValidate,
  });
}
