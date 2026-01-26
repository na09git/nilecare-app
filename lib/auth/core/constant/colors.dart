import 'package:flutter/material.dart';

class AppColor {
  static const light = _LightColors();
  static const dark = _DarkColors();
}

class _LightColors {
  const _LightColors();
  final Color themeColor = const Color(0xFF0F172A); // Primary
  final Color background = const Color(0xFFFFFFFF);
  final Color text = const Color(0xFF010816);
  final Color secondary = const Color(0xFFF1F5F9);
  final Color accent = const Color(0xFFF1F5F9);
  final Color border = const Color(0xFFE2E8F0);
  final Color error = const Color(0xFFEE4444);
  final Color primary = const Color(0xFF0F172A);
}

class _DarkColors {
  const _DarkColors();
  final Color themeColor = const Color(0xFFF7F9FB); // Primary
  final Color background = const Color(0xFF010816); // Very dark blue
  final Color text = const Color(0xFFF7F9FB);
  final Color secondary = const Color(0xFF1E293B);
  final Color accent = const Color(0xFF1E293B);
  final Color border = const Color(0xFF1E293B);
  final Color error = const Color(0xFF7F1D1D);
  final Color primary = const Color(0xFFF7F9FB);
}
