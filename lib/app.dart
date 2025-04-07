import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/app_theme.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'routing/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Styria - Web app',
      routerConfig: goRouter,
      // themeMode: currentTheme,
      theme: ThemeData(
          colorScheme: AppColorScheme.light,
          fontFamily: 'Roboto',
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.brandBlue,
              foregroundColor: Colors.white)),

      darkTheme: ThemeData(
        colorScheme: AppColorScheme.dark,
        fontFamily: 'Roboto',
      ),
    );
  }
}
