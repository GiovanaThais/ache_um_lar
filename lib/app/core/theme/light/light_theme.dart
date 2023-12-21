import 'package:ache_um_lar/app/core/theme/light/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:ache_um_lar/app/core/theme/color_extension.dart';

class LightTheme {
  static final theme = ThemeData(
      iconTheme: IconThemeData(color: Colors.black),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(0, 189, 49, 152),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
      dividerColor: Color.fromRGBO(198, 87, 194, 1),
      textTheme: const TextTheme(
        titleSmall: TextStyle(color: LightColors.gray),
        bodyMedium: TextStyle(color: LightColors.gray),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: LightColors.lightPurple,
          foregroundColor: LightColors.purple,
          shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      extensions: [
        ColorExtension(
            doneBackgroundColor: LightColors.deeppink,
            drawerBackgroundColor: LightColors.lightPurple,
            focusedBadgeColor: LightColors.purple,
            unfocusedBadgeColor: Colors.grey.shade200,
            shimmerBaseColor: Colors.grey.shade200,
            shimmerHighLightColor: Colors.grey.shade300)
      ]);
}
