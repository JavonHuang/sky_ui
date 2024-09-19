import 'dart:math';

import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';

class GenerateUuid {
  GenerateUuid._privateConstructor();

  static final GenerateUuid _instance = GenerateUuid._privateConstructor();

  factory GenerateUuid() => _instance;

  static const Uuid _uuid = Uuid();

  static String keyV1() {
    return _uuid.v1(
      config: V1Options(
        Random().nextInt(10),
        DateTime.now().millisecondsSinceEpoch,
        Random().nextInt(4),
        [
          Random().nextInt(10),
          Random().nextInt(9),
          Random().nextInt(8),
          Random().nextInt(7),
          Random().nextInt(6),
          Random().nextInt(5),
        ],
        null,
      ),
    );
  }
}
