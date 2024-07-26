import 'package:flutter/material.dart';

import 'buttons.dart';

mixin MyMixin on State<SkyButton> {
  void sayHello() {
    print('Hello from MyMixin');
  }
}
