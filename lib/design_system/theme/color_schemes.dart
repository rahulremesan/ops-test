import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// The `AppColorScheme` class defines a set of color schemes for a Dart application, including various
/// color constants and light/dark themes.
class AppColors {
  static const Color brandBlue = Color(0xFF4D33B7);
  static const Color brandBlueSecondary = Color(0xFFF1F1F1);
  static const Color brilliantWhite = Color(0xFFE9EFFF);
  static const Color paleBlueViolet = Color(0xFFA1BBFF);
  static const Color coralRed = Color(0xFFFA3F3F);
  static const Color lacqueredLiquorice = Color(0xFF383838);
  static const Color luckyGrey = Color(0xFF767676);
  static const Color oilGreen = Color(0xFF64B529);
  static const Color capucineOrange = Color(0xFFFDAB61);
  static const Color paleCeruleanBlue = Color(0xFF82D1EF);
  static const Color scarletRed = Color(0xFFCB0000);
  static const Color cadmiumYellow = Color(0xFFFBBB00);
  static const Color grenadineRed = Color(0xFFFF481F);
  static const Color candlelightIvory = Color(0xFFFDF6E2);
  static const Color placeboMagenta = Color(0xFFFDEDF5);
  static const Color placeboGreen = Color(0xFFEBFDE6);
  static const Color yellowOcher = Color(0xFFD6A439);
  static const Color roseColor = Color(0xFFE14C8E);
  static const Color vividGreen = Color(0xFF36B37E);
  static const Color nickel = Color(0xFF929292);
  static const Color dreamyCloud = Color(0xFFE5E6EB);
  static const Color platinum = Color(0xFFE7E7E7);
  static const Color neutralGray = Color(0xFFF8F8F8);
  static const Color lilacGray = Color(0xFFB9B9B9);
  static const Color snowFlake = Color(0xFFF0F0F0);
  static const Color wolFrame = Color(0xFFB6B6B6);
  static const Color deepChicoryBlue = Color(0xFF8876CF);
  static const Color sailAway = Color(0xFF54B0DF);
  static const Color blackWash = Color.fromRGBO(13, 11, 11, 0.2);
  static const Color black06 = Color.fromRGBO(0, 0, 0, 0.6);
  static const Color primary_900 = Color(0xFF20154D);
  static const Color neutral_400 = Color(0xFF424242);
  static const Color neutral_500 = Color(0xFF131313);
  static const Color distantHorizon = Color(0xFFF1F6F9);
  static const Color placeboRGB = Color.fromRGBO(231, 231, 231, 1);
  static const Color rapunzelSilver = Color(0xFFD2D3D6);
  static const Color outrageousOrange = Color(0xFFFF6D4C);
  static const Color neutral_300 = Color(0xFF616161);
  static const Color primary_600 = Color(0xFF462EA7);
  static const Color primary_50 = Color(0xFFEDEBF8);
  static const Color blackV1 = Color(0xFF0B0E19);
  static const Color neutralGray3 = Color(0xFFFAFCFD);
  static const Color bleachedSilk = Color(0xFFF2F2F2);
  static const Color antarctica = Color.fromRGBO(185, 185, 185, 1);
  static const Color beluga = Color.fromRGBO(241, 241, 241, 1);
}

class AppColorScheme extends ColorScheme {
  final Color brandPrimary;
  final Color brandSecondary;
  final Color paleBlueViolet;
  final Color brilliantWhite;
  final Color coralRed;
  final Color lacqueredLiquorice;
  final Color luckyGrey;
  final Color oilGreen;
  final Color capucineOrange;
  final Color paleCeruleanBlue;
  final Color scarletRed;
  final Color cadmiumYellow;
  final Color grenadineRed;
  final Color candlelightIvory;
  final Color placeboMagenta;
  final Color placeboGreen;
  final Color yellowOcher;
  final Color roseColor;
  final Color vividGreen;
  final Color nickel;
  final Color dreamyCloud;
  final Color platinum;
  final Color neutralGray;
  final Color distantHorizon;
  final Color lilacGray;
  final Color blackWash;
  final Color black06;
  final Color wolFrame;
  final Color outrageousOrange;
  final Color neutral_300;
  final Color placeboRGB;
  final Color primary_600;
  final Color primary_50;
  final Color primary_900;
  final Color neutral_400;
  final Color neutral_500;
  final Color blackV1;
  final Color neutralGray3;

  const AppColorScheme({
    required super.brightness,
    required this.brandPrimary,
    required this.brandSecondary,
    required this.paleBlueViolet,
    required this.brilliantWhite,
    required this.lacqueredLiquorice,
    required this.luckyGrey,
    required this.coralRed,
    required this.oilGreen,
    required this.capucineOrange,
    required this.paleCeruleanBlue,
    required this.scarletRed,
    required this.cadmiumYellow,
    required this.grenadineRed,
    required this.candlelightIvory,
    required this.placeboMagenta,
    required this.placeboGreen,
    required this.yellowOcher,
    required this.roseColor,
    required this.vividGreen,
    required this.nickel,
    required this.dreamyCloud,
    required this.platinum,
    required this.distantHorizon,
    required this.lilacGray,
    required this.blackWash,
    required this.black06,
    required this.primary_600,
    required this.primary_900,
    required this.wolFrame,
    required this.outrageousOrange,
    required this.neutral_300,
    required this.placeboRGB,
    required this.primary_50,
    required this.neutral_400,
    required this.neutral_500,
    required super.primary,
    required super.onPrimary,
    required super.secondary,
    required super.onSecondary,
    required super.error,
    required super.onError,
    required Color super.background,
    required Color super.onBackground,
    required super.surface,
    required super.onSurface,
    required this.neutralGray,
    required this.blackV1,
    required this.neutralGray3,
  });

  static const AppColorScheme light = AppColorScheme(
    brightness: Brightness.light,
    brandPrimary: AppColors.brandBlue,
    paleBlueViolet: AppColors.paleBlueViolet,
    brilliantWhite: AppColors.brilliantWhite,
    brandSecondary: AppColors.brandBlueSecondary,
    coralRed: AppColors.coralRed,
    lacqueredLiquorice: AppColors.lacqueredLiquorice,
    luckyGrey: AppColors.luckyGrey,
    oilGreen: AppColors.oilGreen,
    capucineOrange: AppColors.capucineOrange,
    paleCeruleanBlue: AppColors.paleCeruleanBlue,
    scarletRed: AppColors.scarletRed,
    cadmiumYellow: AppColors.cadmiumYellow,
    grenadineRed: AppColors.grenadineRed,
    candlelightIvory: AppColors.candlelightIvory,
    placeboMagenta: AppColors.placeboMagenta,
    placeboGreen: AppColors.placeboGreen,
    yellowOcher: AppColors.yellowOcher,
    roseColor: AppColors.roseColor,
    vividGreen: AppColors.vividGreen,
    platinum: AppColors.platinum,
    distantHorizon: AppColors.distantHorizon,
    dreamyCloud: AppColors.dreamyCloud,
    nickel: AppColors.nickel,
    lilacGray: AppColors.lilacGray,
    blackWash: AppColors.blackWash,
    black06: AppColors.black06,
    placeboRGB: AppColors.placeboRGB,
    primary_50: AppColors.primary_50,
    primary: AppColors.brandBlue,
    onPrimary: CupertinoColors.lightBackgroundGray,
    secondary: Colors.blueAccent,
    onSecondary: CupertinoColors.darkBackgroundGray,
    error: Colors.red,
    onError: CupertinoColors.lightBackgroundGray,
    background: CupertinoColors.lightBackgroundGray,
    onBackground: CupertinoColors.darkBackgroundGray,
    surface: Colors.white,
    onSurface: CupertinoColors.darkBackgroundGray,
    wolFrame: AppColors.wolFrame,
    primary_600: AppColors.primary_600,
    primary_900: AppColors.primary_900,
    neutral_400: AppColors.neutral_400,
    neutral_500: AppColors.neutral_500,
    neutralGray: AppColors.neutralGray,
    outrageousOrange: AppColors.outrageousOrange,
    neutral_300: AppColors.neutral_300,
    blackV1: AppColors.blackV1,
    neutralGray3: AppColors.neutralGray3,
  );

  static const AppColorScheme dark = AppColorScheme(
    brightness: Brightness.light,
    brandPrimary: AppColors.brandBlue,
    paleBlueViolet: AppColors.paleBlueViolet,
    brilliantWhite: AppColors.brilliantWhite,
    brandSecondary: AppColors.brandBlueSecondary,
    coralRed: AppColors.coralRed,
    lacqueredLiquorice: AppColors.lacqueredLiquorice,
    luckyGrey: AppColors.luckyGrey,
    oilGreen: AppColors.oilGreen,
    capucineOrange: AppColors.capucineOrange,
    paleCeruleanBlue: AppColors.paleCeruleanBlue,
    scarletRed: AppColors.scarletRed,
    cadmiumYellow: AppColors.cadmiumYellow,
    grenadineRed: AppColors.grenadineRed,
    candlelightIvory: AppColors.candlelightIvory,
    placeboMagenta: AppColors.placeboMagenta,
    placeboGreen: AppColors.placeboGreen,
    yellowOcher: AppColors.yellowOcher,
    roseColor: AppColors.roseColor,
    vividGreen: AppColors.vividGreen,
    platinum: AppColors.platinum,
    neutralGray: AppColors.neutralGray,
    distantHorizon: AppColors.distantHorizon,
    dreamyCloud: AppColors.dreamyCloud,
    nickel: AppColors.nickel,
    wolFrame: AppColors.wolFrame,
    lilacGray: AppColors.lilacGray,
    blackWash: AppColors.blackWash,
    black06: AppColors.black06,
    placeboRGB: AppColors.placeboRGB,
    primary_50: AppColors.primary_50,
    primary: AppColors.brandBlue,
    onPrimary: CupertinoColors.lightBackgroundGray,
    secondary: Colors.blueAccent,
    onSecondary: CupertinoColors.darkBackgroundGray,
    error: Colors.red,
    onError: CupertinoColors.lightBackgroundGray,
    background: CupertinoColors.lightBackgroundGray,
    onBackground: CupertinoColors.darkBackgroundGray,
    surface: Colors.white,
    onSurface: CupertinoColors.darkBackgroundGray,
    primary_600: AppColors.primary_600,
    outrageousOrange: AppColors.outrageousOrange,
    neutral_300: AppColors.neutral_300,
    primary_900: AppColors.primary_900,
    neutral_400: AppColors.neutral_400,
    neutral_500: AppColors.neutral_500,
    blackV1: AppColors.blackV1,
    neutralGray3: AppColors.neutralGray3,
  );
}
