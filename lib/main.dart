import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/app.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.brandBlue, // Your app's primary color
      statusBarIconBrightness: Brightness.light, // for dark icons
      // statusBarIconBrightness: Brightness.dark, // for light icons
    ),
  );
  runApp(
    const SafeArea(
      child: ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}
