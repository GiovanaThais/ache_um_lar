import 'package:flutter/material.dart';

class ColorExtension extends ThemeExtension<ColorExtension> {
  const ColorExtension({
    required this.doneBackgroundColor,
    required this.focusedBadgeColor,
    required this.unfocusedBadgeColor,
    required this.shimmerBaseColor,
    required this.shimmerHighLightColor,
    required this.drawerBackgroundColor,
  });

  final Color focusedBadgeColor;
  final Color unfocusedBadgeColor;
  final Color doneBackgroundColor;
  final Color shimmerBaseColor;
  final Color shimmerHighLightColor;
  final Color drawerBackgroundColor;

  @override
  ThemeExtension<ColorExtension> copyWith({
    Color? focusedBadgeColor,
    Color? unfocusedBadgeColor,
    Color? doneBackgroundColor,
    Color? shimmerBaseColor,
    Color? shimmerHighLight,
    Color? drawerBackgroundColor,
  }) {
    return ColorExtension(
      doneBackgroundColor: doneBackgroundColor ?? this.doneBackgroundColor,
      focusedBadgeColor: focusedBadgeColor ?? this.focusedBadgeColor,
      unfocusedBadgeColor: unfocusedBadgeColor ?? this.unfocusedBadgeColor,
      shimmerBaseColor: shimmerBaseColor ?? this.shimmerBaseColor,
      shimmerHighLightColor: shimmerHighLight ?? this.shimmerHighLightColor,
      drawerBackgroundColor:
          drawerBackgroundColor ?? this.drawerBackgroundColor,
    );
  }

  @override
  ThemeExtension<ColorExtension> lerp(
      covariant ThemeExtension<ColorExtension>? other, double t) {
    if (other == null || t < 0.5) return this;
    return other;
  }
}
