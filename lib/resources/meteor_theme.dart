import 'dart:math';

import 'package:flutter/material.dart';

class MeteorTheme extends ThemeExtension<MeteorTheme> {
  const MeteorTheme({
    required this.primaryGradient,
    required this.errorGradient,
    required this.extendedGradient,
    required this.scaffoldBackground,
    required this.containerBackground,
    required this.outline,
    required this.textStyle,
  });

  final LinearGradient? primaryGradient;
  final LinearGradient? errorGradient;
  final LinearGradient? extendedGradient;
  final Color? scaffoldBackground;
  final Color? containerBackground;
  final Color? outline;
  final TextStyle? textStyle;

  @override
  ThemeExtension<MeteorTheme> copyWith({
    LinearGradient? primaryGradient,
    LinearGradient? errorGradient,
    LinearGradient? extendedGradient,
    Color? scaffoldBackground,
    Color? containerBackground,
    Color? outline,
    TextStyle? textStyle,
  }) {
    return MeteorTheme(
      primaryGradient: primaryGradient ?? this.primaryGradient,
      errorGradient: errorGradient ?? this.errorGradient,
      extendedGradient: extendedGradient ?? this.extendedGradient,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      containerBackground: containerBackground ?? this.containerBackground,
      outline: outline ?? this.outline,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  ThemeExtension<MeteorTheme> lerp(
      ThemeExtension<MeteorTheme>? other, double t) {
    if (other is! MeteorTheme) {
      return this;
    }

    return MeteorTheme(
      primaryGradient:
          LinearGradient.lerp(primaryGradient, other.primaryGradient, t),
      errorGradient: LinearGradient.lerp(errorGradient, other.errorGradient, t),
      extendedGradient:
          LinearGradient.lerp(extendedGradient, other.extendedGradient, t),
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t),
      containerBackground:
          Color.lerp(containerBackground, other.containerBackground, t),
      outline: Color.lerp(outline, other.outline, t),
      textStyle: other.textStyle,
    );
  }

  static const light = MeteorTheme(
    primaryGradient: LinearGradient(
      transform: GradientRotation(pi / 3),
      colors: [
        Color(0xFF005BEA),
        Color(0xFF00C6FB),
      ],
    ),
    errorGradient: LinearGradient(
      transform: GradientRotation(pi / 3),
      colors: [
        Color(0xFFf77062),
        Color(0xFFfe5196),
      ],
    ),
    extendedGradient: LinearGradient(
      colors: [
        Color(0xFF005BEA),
        Color(0xFF00C6FB),
        Color(0xFF8A21CC),
        Color(0xFFF83F77),
        Color(0xFFFED80E),
      ],
    ),
    scaffoldBackground: Color(0xFFFFFFFF),
    containerBackground: Color(0xFFF6F6F6),
    outline: Color(0xFF5F6768),
    textStyle: TextStyle(
      color: Color(0xFF111111),
    ),
  );

  static const dark = MeteorTheme(
    primaryGradient: LinearGradient(
      transform: GradientRotation(pi / 3),
      colors: [
        Color(0xFF4FACFE),
        Color(0xFF00F2FE),
      ],
    ),
    errorGradient: LinearGradient(
      transform: GradientRotation(pi / 3),
      colors: [
        Color(0xFFFA709A),
        Color(0xFFFF0844),
      ],
    ),
    extendedGradient: LinearGradient(
      colors: [
        Color(0xFF4FACFE),
        Color(0xFF02F0FE),
        Color(0xFFA240E0),
        Color(0xFFF9709A),
        Color(0xFFFEE041),
      ],
    ),
    scaffoldBackground: Color(0xFF141414),
    containerBackground: Color(0xFF1F1F1F),
    outline: Color(0xFF6F797A),
    textStyle: TextStyle(
      color: Color(0xFFFBFBFB),
    ),
  );
}
