import 'package:flutter/material.dart';

Color darkenColor(Color color, [double percent = 0.1]) {
  assert(percent > 0 && percent <= 1);
  return Color.fromARGB(
    color.alpha,
    (color.red * (1 - percent)).round(),
    (color.green * (1 - percent)).round(),
    (color.blue * (1 - percent)).round(),
  );
}
