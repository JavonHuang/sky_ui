import 'package:flutter/material.dart';
part 'sky_form_field.dart';

class SkyForm extends StatefulWidget {
  const SkyForm({super.key});

  @override
  State<SkyForm> createState() => SkyFormState();
}

class SkyFormState extends State<SkyForm> {
  late int _count = 0;
  @override
  Widget build(BuildContext context) {
    return _SkyFormScope(
      count: _count,
      skyFormState: this,
      child: Text("889"),
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
