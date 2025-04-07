import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/theme_data.dart';

/// The below Dart code defines a StateNotifier class for managing themes in a Flutter application.
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(lightTheme);

  void setTheme(AppTheme theme) {
    switch (theme) {
      case AppTheme.light:
        state = lightTheme;
        break;
      case AppTheme.dark:
        state = darkTheme;
        break;
    }
  }
}
