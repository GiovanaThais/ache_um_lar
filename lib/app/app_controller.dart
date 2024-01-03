import 'dart:developer';

import 'package:ache_um_lar/app/app_state.dart';
import 'package:flutter/material.dart';

class AppController extends ValueNotifier<AppState> {
  AppController() : super(AppState.empty());

  void changeThemeMode() {
    final state = value;
    final isDark = !state.isDarkMode;
    value = state.copyWith(isDarkMode: isDark);
    log("change color ${value.isDarkMode}");
  }
}
