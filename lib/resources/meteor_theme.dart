import 'dart:math';

import 'package:flutter/material.dart';

class MeteorTheme extends ThemeExtension<MeteorTheme> {
  const MeteorTheme({
    required this.primaryGradient,
    required this.errorGradient,
    required this.extendedGradient,
    required this.scaffoldBackgroundColor,
    required this.containerBackgroundColor,
    required this.outlineColor,
    required this.contentColor,
    required this.textTheme,
  });

  final LinearGradient? primaryGradient;
  final LinearGradient? errorGradient;
  final LinearGradient? extendedGradient;
  final Color? scaffoldBackgroundColor;
  final Color? containerBackgroundColor;
  final Color? outlineColor;
  final Color? contentColor;
  final TextTheme? textTheme;

  @override
  ThemeExtension<MeteorTheme> copyWith({
    LinearGradient? primaryGradient,
    LinearGradient? errorGradient,
    LinearGradient? extendedGradient,
    Color? scaffoldBackgroundColor,
    Color? containerBackgroundColor,
    Color? outlineColor,
    Color? contentColor,
    TextTheme? textTheme,
  }) {
    return MeteorTheme(
      primaryGradient: primaryGradient ?? this.primaryGradient,
      errorGradient: errorGradient ?? this.errorGradient,
      extendedGradient: extendedGradient ?? this.extendedGradient,
      scaffoldBackgroundColor:
          scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      containerBackgroundColor:
          containerBackgroundColor ?? this.containerBackgroundColor,
      outlineColor: outlineColor ?? this.outlineColor,
      contentColor: contentColor ?? this.contentColor,
      textTheme: textTheme ?? this.textTheme,
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
      scaffoldBackgroundColor:
          Color.lerp(scaffoldBackgroundColor, other.scaffoldBackgroundColor, t),
      containerBackgroundColor: Color.lerp(
          containerBackgroundColor, other.containerBackgroundColor, t),
      outlineColor: Color.lerp(outlineColor, other.outlineColor, t),
      contentColor: Color.lerp(contentColor, other.contentColor, t),
      textTheme: other.textTheme,
    );
  }

  static const light = MeteorTheme(
    primaryGradient: LinearGradient(
      transform: GradientRotation(pi / 3),
      colors: [
        Color(0xFF2F62DD),
        Color(0xFF159FEF),
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
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    containerBackgroundColor: Color(0xFFF6F6F6),
    outlineColor: Color(0xFF5F6768),
    contentColor: Color(0xFF111111),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: "Rubik",
        color: Colors.black,
        fontSize: 60,
      ),
      displayMedium: TextStyle(
        fontFamily: "Rubik",
        color: Colors.black,
        fontSize: 48,
      ),
      displaySmall: TextStyle(
        fontFamily: "Rubik",
        color: Colors.black,
        fontSize: 36,
      ),
      titleLarge: TextStyle(
        color: Color(0xFF111111),
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF111111),
        fontSize: 22,
      ),
      titleSmall: TextStyle(
        color: Color(0xFF111111),
        fontSize: 20,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFF111111),
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFF111111),
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: Color(0xFF111111),
        fontSize: 12,
      ),
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
    scaffoldBackgroundColor: Color(0xFF141414),
    containerBackgroundColor: Color(0xFF1E1E1E),
    outlineColor: Color(0xFF808080),
    contentColor: Color(0xFFFBFBFB),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: "Rubik",
        color: Colors.white,
        fontSize: 60,
      ),
      displayMedium: TextStyle(
        fontFamily: "Rubik",
        color: Colors.white,
        fontSize: 48,
      ),
      displaySmall: TextStyle(
        fontFamily: "Rubik",
        color: Colors.white,
        fontSize: 36,
      ),
      titleLarge: TextStyle(
        color: Color(0xFFFBFBFB),
        fontSize: 24,
      ),
      titleMedium: TextStyle(
        color: Color(0xFFFBFBFB),
        fontSize: 22,
      ),
      titleSmall: TextStyle(
        color: Color(0xFFFBFBFB),
        fontSize: 20,
      ),
      bodyLarge: TextStyle(
        color: Color(0xFFFBFBFB),
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        color: Color(0xFFFBFBFB),
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        color: Color(0xFFFBFBFB),
        fontSize: 12,
      ),
    ),
  );
}
