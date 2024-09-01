import 'package:flutter/material.dart';
import 'package:sky_ui/sky_ui.dart';
part 'sky_form_field.dart';
part 'sky_form_type.dart';

class SkyForm extends StatefulWidget {
  const SkyForm({
    super.key,
    required this.children,
    this.model,
    this.labelWidth,
    this.rules,
    this.inline = false,
    this.size,
    this.disabled,
    this.formFiledWidth,
    this.spaceWidth = 0,
    this.spaceHeight = 0,
  }) : assert(!(inline && formFiledWidth == null), 'please set formFiledWidth initValue');
  final List<Widget> children;
  final Map<String, dynamic>? model;
  final double? labelWidth;
  final Map<String, Rules>? rules;
  final bool inline;
  final SkySize? size;
  final bool? disabled;
  final double? formFiledWidth;
  final double spaceWidth;
  final double spaceHeight;

  static SkyFormState? maybeOf(BuildContext context) {
    final _SkyFormScope? scope = context.dependOnInheritedWidgetOfExactType<_SkyFormScope>();
    return scope?._skyFormState;
  }

  static SkyForm? maybeOfSkyForm(BuildContext context) {
    final _SkyFormScope? scope = context.dependOnInheritedWidgetOfExactType<_SkyFormScope>();
    return scope?.skyForm;
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
    bool result = true;
    Map<String, dynamic> obj = {};
    for (dynamic item in results) {
      if (item['result'] == false) {
        result = false;
      }
      obj[item['prop']] = item['value'];
    }
    return Future.value(SkyFormValidate(result: result, fieldValidate: results, obj: obj));
  }

  Future<SkyFormValidate> validateField(String prop) async {
    List<Future<dynamic>> list = [];
    for (SkyFormFieldState item in formFieldList) {
      if (item.widget.prop == prop) {
        list.add(item.validate());
      }
    }
    List<dynamic> results = await Future.wait(list);
    bool result = true;
    Map<String, dynamic> obj = {};
    for (dynamic item in results) {
      if (item['result'] == false) {
        result = false;
      }
      obj[item['prop']] = item['value'];
    }
    return Future.value(SkyFormValidate(result: result, fieldValidate: results, obj: obj));
  }

  void clearValidate({String? prop}) {
    for (SkyFormFieldState item in formFieldList) {
      if (prop != null && item.widget.prop == prop) {
        item.clearValidate();
      } else {
        item.clearValidate();
      }
    }
  }

  void resetFields() {
    for (SkyFormFieldState item in formFieldList) {
      item.resetField();
    }
  }

  void resetField(String prop) {
    for (SkyFormFieldState item in formFieldList) {
      if (item.widget.prop == prop) {
        item.resetField();
      }
    }
  }

  void setValidate(Map<String, dynamic> obj) {
    for (String key in obj.keys) {
      for (SkyFormFieldState item in formFieldList) {
        if (item.widget.prop == key) {
          item.setField(obj[key]);
        }
      }
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

  void _unregister(SkyFormFieldState e) {
    int index = formFieldList.indexWhere((item) => item.widget.prop == e.widget.prop);
    if (index > -1) {
      formFieldList.removeAt(index);
    }
  }

  List<Widget> _renderItem() {
    List<Widget> result = [];
    for (int i = 0; i < widget.children.length; i++) {
      Widget item = widget.children[i];
      result.add(Container(
        width: widget.inline && item.runtimeType == SkyFormField ? widget.formFiledWidth : null,
        padding: widget.inline || i == widget.children.length - 1 ? null : EdgeInsets.only(bottom: widget.spaceHeight),
        child: item,
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return _SkyFormScope(
      count: _count,
      skyFormState: this,
      // child: Column(children: widget.children),
      child: widget.inline
          ? Wrap(
              spacing: widget.spaceWidth, // 主轴(水平)方向间距
              runSpacing: widget.spaceHeight, // 纵轴（垂直）方向间距
              // alignment: WrapAlignment.center, //沿主轴方向居中
              // crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.horizontal,
              children: _renderItem(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _renderItem(),
            ),
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
  final dynamic obj;
  SkyFormValidate({
    required this.result,
    required this.fieldValidate,
    required this.obj,
  });
}
