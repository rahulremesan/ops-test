import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';

/// The `CustomColors` class in Dart defines a set of custom color properties with methods for copying
/// and interpolating colors.
class CustomColors extends ThemeExtension<CustomColors> {
  final Color? brandBlue;
  final Color? brandBlueSecondary;
  final Color? coralRed;
  final Color? lacqueredLiquorice;
  final Color? luckyGrey;
  final Color? oilGreen;
  final Color? capucineOrange;
  final Color? paleCeruleanBlue;
  final Color? scarletRed;
  final Color? cadmiumYellow;
  final Color? grenadineRed;
  final Color? candlelightIvory;
  final Color? placeboMagenta;
  final Color? placeboGreen;
  final Color? yellowOcher;
  final Color? roseColor;
  final Color? vividGreen;
  final Color? blackWash;
  final Color? black06;

  CustomColors({
    required this.brandBlue,
    required this.brandBlueSecondary,
    required this.coralRed,
    required this.lacqueredLiquorice,
    required this.luckyGrey,
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
    required this.blackWash,
    required this.black06,
  });

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? brandBlue,
    Color? brandBlueSecondary,
    Color? coralRed,
    Color? lacqueredLiquorice,
    Color? luckyGrey,
    Color? oilGreen,
    Color? capucineOrange,
    Color? paleCeruleanBlue,
    Color? scarletRed,
    Color? cadmiumYellow,
    Color? grenadineRed,
    Color? candlelightIvory,
    Color? placeboMagenta,
    Color? placeboGreen,
    Color? yellowOcher,
    Color? roseColor,
    Color? vividGreen,
    Color? blackWash,
    Color? black06,
  }) {
    return CustomColors(
      brandBlue: brandBlue ?? this.brandBlue,
      brandBlueSecondary: brandBlueSecondary ?? this.brandBlueSecondary,
      coralRed: coralRed ?? this.coralRed,
      lacqueredLiquorice: lacqueredLiquorice ?? this.lacqueredLiquorice,
      luckyGrey: luckyGrey ?? this.luckyGrey,
      oilGreen: oilGreen ?? this.oilGreen,
      capucineOrange: capucineOrange ?? this.capucineOrange,
      paleCeruleanBlue: paleCeruleanBlue ?? this.paleCeruleanBlue,
      scarletRed: scarletRed ?? this.scarletRed,
      cadmiumYellow: cadmiumYellow ?? this.cadmiumYellow,
      grenadineRed: grenadineRed ?? this.grenadineRed,
      candlelightIvory: candlelightIvory ?? this.candlelightIvory,
      placeboMagenta: placeboMagenta ?? this.placeboMagenta,
      placeboGreen: placeboGreen ?? this.placeboGreen,
      yellowOcher: yellowOcher ?? this.yellowOcher,
      roseColor: roseColor ?? this.roseColor,
      vividGreen: vividGreen ?? this.vividGreen,
      blackWash: blackWash ?? this.blackWash,
      black06: black06 ?? this.black06,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
      ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }

    return CustomColors(
      brandBlue: Color.lerp(brandBlue, other.brandBlue, t),
      brandBlueSecondary:
          Color.lerp(brandBlueSecondary, other.brandBlueSecondary, t),
      coralRed: Color.lerp(coralRed, other.coralRed, t),
      lacqueredLiquorice:
          Color.lerp(lacqueredLiquorice, other.lacqueredLiquorice, t),
      luckyGrey: Color.lerp(luckyGrey, other.luckyGrey, t),
      oilGreen: Color.lerp(oilGreen, other.oilGreen, t),
      capucineOrange: Color.lerp(capucineOrange, other.capucineOrange, t),
      paleCeruleanBlue: Color.lerp(paleCeruleanBlue, other.paleCeruleanBlue, t),
      scarletRed: Color.lerp(scarletRed, other.scarletRed, t),
      cadmiumYellow: Color.lerp(cadmiumYellow, other.cadmiumYellow, t),
      grenadineRed: Color.lerp(grenadineRed, other.grenadineRed, t),
      candlelightIvory: Color.lerp(candlelightIvory, other.candlelightIvory, t),
      placeboMagenta: Color.lerp(placeboMagenta, other.placeboMagenta, t),
      placeboGreen: Color.lerp(placeboGreen, other.placeboGreen, t),
      yellowOcher: Color.lerp(yellowOcher, other.yellowOcher, t),
      roseColor: Color.lerp(roseColor, other.roseColor, t),
      vividGreen: Color.lerp(vividGreen, other.vividGreen, t),
      blackWash: Color.lerp(blackWash, other.blackWash, t),
      black06: Color.lerp(black06, other.black06, t),
    );
  }

  static var light = CustomColors(
    brandBlue: AppColors.brandBlue,
    brandBlueSecondary: AppColors.brandBlueSecondary,
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
    blackWash: AppColors.blackWash,
    black06: AppColors.black06,
  );

  static var dark = CustomColors(
    brandBlue: AppColors.brandBlue,
    brandBlueSecondary: AppColors.brandBlueSecondary,
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
    blackWash: AppColors.blackWash,
    black06: AppColors.black06,
  );
}
