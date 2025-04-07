import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/design_system/theme/theme_extensions.dart';

/// This Dart code snippet is defining two themes, `lightTheme` and `darkTheme`, using the `ThemeData`
/// class from the Flutter framework.
final ThemeData lightTheme = ThemeData(
  colorScheme: AppColorScheme.light,
  extensions: [CustomColors.light, CustomTypography.light],
  fontFamily: 'Roboto',
);

final ThemeData darkTheme = ThemeData(
  colorScheme: AppColorScheme.dark,
  extensions: [CustomColors.dark, CustomTypography.dark],
  fontFamily: 'Roboto',
);

enum AppTheme { light, dark }
