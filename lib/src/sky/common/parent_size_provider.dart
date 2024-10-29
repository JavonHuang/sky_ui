import 'package:flutter/material.dart';

class ParentSizeProvider extends InheritedWidget {
  final Size size;

  const ParentSizeProvider({super.key, required this.size, required super.child});

  static ParentSizeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ParentSizeProvider>()!;
  }

  @override
  bool updateShouldNotify(ParentSizeProvider oldWidget) {
    return size != oldWidget.size;
  }
}
