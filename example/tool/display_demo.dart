class DisplayDemo {
  final String filePath;
  final String code;
  final String name;
  const DisplayDemo({
    required this.filePath,
    required this.code,
    required this.name,
  });

  String get getCode => code.replaceAll("import 'package:flutter/material.dart';", '').replaceAll("import 'package:sky_ui/sky_ui.dart';", "").replaceAll("import '../common/space.dart';", "").trim();
}
