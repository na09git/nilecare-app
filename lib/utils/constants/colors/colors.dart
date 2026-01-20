import 'package:flutter/material.dart';

class AppColor {
  static const light = _LightColors();
  static const dark = _DarkColors();
}

class _LightColors {
  const _LightColors();
  final Color themeColor = const Color.fromARGB(255, 237, 251, 251);
  final Color background = const Color.fromARGB(255, 37, 150, 190);
}

class _DarkColors {
  const _DarkColors();
  final Color themeColor = const Color.fromARGB(255, 14, 21, 40);
  final Color background = const Color.fromARGB(255, 31, 79, 79);
}
