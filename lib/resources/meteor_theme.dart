import 'dart:math';

import 'package:flutter/material.dart';

class MeteorTheme extends InheritedWidget {
  final bool isDarkTheme;

  const MeteorTheme({
    Key? key,
    required Widget child,
    required this.isDarkTheme,
  }) : super(key: key, child: child);

  Gradient get primaryGradient => isDarkTheme
      ? const LinearGradient(
          transform: GradientRotation(pi / 3),
          colors: [
            Color(0xFF4FACFE),
            Color(0xFF00F2FE),
          ],
        )
      : const LinearGradient(
          transform: GradientRotation(pi / 3),
          colors: [
            Color(0xFF005BEA),
            Color(0xFF00C6FB),
          ],
        );

  Gradient get errorGradient => isDarkTheme
      ? const LinearGradient(
          transform: GradientRotation(pi / 3),
          colors: [
            Color(0xFFFA709A),
            Color(0xFFFF0844),
          ],
        )
      : const LinearGradient(
          transform: GradientRotation(pi / 3),
          colors: [
            Color(0xFFF83F77),
            Color(0xFFD40033),
          ],
        );

  Gradient get extendedGradient => isDarkTheme
      ? const LinearGradient(
          colors: [
            Color(0xFF4FACFE),
            Color(0xFF02F0FE),
            Color(0xFFA240E0),
            Color(0xFFF9709A),
            Color(0xFFFEE041),
          ],
        )
      : const LinearGradient(
          colors: [
            Color(0xFF005BEA),
            Color(0xFF00C6FB),
            Color(0xFF8A21CC),
            Color(0xFFF83F77),
            Color(0xFFFED80E),
          ],
        );

  Color get scaffoldBackground =>
      isDarkTheme ? const Color(0xFF141414) : const Color(0xFFFFFFFF);

  Color get containerBackground =>
      isDarkTheme ? const Color(0xFF1F1F1F) : const Color(0xFFF6F6F6);

  Color get outline =>
      isDarkTheme ? const Color(0xFF6F797A) : const Color(0xFF5F6768);

  TextStyle get textStyle => isDarkTheme
      ? const TextStyle(color: Color(0xFFFBFBFB))
      : const TextStyle(color: Color(0xFF111111));

  static MeteorTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MeteorTheme>();
  }

  @override
  bool updateShouldNotify(covariant MeteorTheme oldWidget) {
    return isDarkTheme != oldWidget.isDarkTheme;
  }
}
