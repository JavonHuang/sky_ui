import 'dart:io';

import 'package:flutter/services.dart';

class ReadFile {
  static Future<String> read(String path) async {
    return await rootBundle.loadString(path);

    // return await File(path).readAsString();
  }
}
