import 'package:flutter/material.dart';

/// The `CustomTypography` class in Dart defines a set of text styles for different typographic elements
/// with options for regular, medium, and bold weights.
class CustomTypography extends ThemeExtension<CustomTypography> {
  static const String _fontFamily = 'Roboto';
  static const String _fontFamily2 = 'Inter';
  static const String _fontFamily3 = 'Poppin';

  final TextStyle h1Regular;
  final TextStyle h1Medium;
  final TextStyle h1Bold;

  final TextStyle h2Regular;
  final TextStyle h2Medium;
  final TextStyle h2Bold;

  final TextStyle h3Medium;
  final TextStyle h3Regular;
  final TextStyle h3Bold;

  final TextStyle h4Medium;
  final TextStyle h4Regular;
  final TextStyle h4Bold;

  final TextStyle h5Medium;
  final TextStyle h5Regular;
  final TextStyle h5Bold;

  final TextStyle body1Medium;
  final TextStyle body1Regular;
  final TextStyle body1Bold;

  final TextStyle body2Medium;
  final TextStyle body2Regular;
  final TextStyle body2Bold;

  final TextStyle body3Medium;
  final TextStyle body3Regular;
  final TextStyle body3Bold;

  final TextStyle body4Medium;
  final TextStyle body4Regular;
  final TextStyle body4Bold;

  final TextStyle button1Regular;
  final TextStyle button1Medium;
  final TextStyle button1Bold;

  final TextStyle caption1Regular;
  final TextStyle caption1Medium;
  final TextStyle caption1Bold;

  final TextStyle caption2Regular;
  final TextStyle caption2Medium;
  final TextStyle caption2Bold;

  final TextStyle title1Bold;
  final TextStyle title1Regular;

  final TextStyle title2Bold;

  final TextStyle title3Bold;

  final TextStyle title4SemiBold;
  final TextStyle subTitle1;

  const CustomTypography({
    required this.h1Regular,
    required this.h1Medium,
    required this.h1Bold,
    required this.h2Regular,
    required this.h2Medium,
    required this.h2Bold,
    required this.h3Regular,
    required this.h3Medium,
    required this.h3Bold,
    required this.h4Medium,
    required this.h4Regular,
    required this.h4Bold,
    required this.h5Medium,
    required this.h5Regular,
    required this.h5Bold,
    required this.body1Medium,
    required this.body1Regular,
    required this.body1Bold,
    required this.body2Medium,
    required this.body2Regular,
    required this.body2Bold,
    required this.body3Medium,
    required this.body3Regular,
    required this.body3Bold,
    required this.body4Medium,
    required this.body4Regular,
    required this.body4Bold,
    required this.button1Regular,
    required this.button1Medium,
    required this.button1Bold,
    required this.caption1Regular,
    required this.caption1Medium,
    required this.caption1Bold,
    required this.caption2Regular,
    required this.caption2Medium,
    required this.caption2Bold,
    required this.title1Bold,
    required this.title1Regular,
    required this.title2Bold,
    required this.title3Bold,
    required this.title4SemiBold,
    required this.subTitle1,
  });

  @override
  CustomTypography copyWith({
    TextStyle? h1Regular,
    TextStyle? h1Medium,
    TextStyle? h1Bold,
    TextStyle? h2Regular,
    TextStyle? h2Medium,
    TextStyle? h2Bold,
    TextStyle? h3Medium,
    TextStyle? h3Regular,
    TextStyle? h3Bold,
    TextStyle? h4Medium,
    TextStyle? h4Regular,
    TextStyle? h4Bold,
    TextStyle? h5Medium,
    TextStyle? h5Regular,
    TextStyle? h5Bold,
    TextStyle? body1Medium,
    TextStyle? body1Regular,
    TextStyle? body1Bold,
    TextStyle? body2Medium,
    TextStyle? body2Regular,
    TextStyle? body2Bold,
    TextStyle? body3Medium,
    TextStyle? body3Regular,
    TextStyle? body3Bold,
    TextStyle? body4Medium,
    TextStyle? body4Regular,
    TextStyle? body4Bold,
    TextStyle? button1Regular,
    TextStyle? button1Medium,
    TextStyle? button1Bold,
    TextStyle? caption1Regular,
    TextStyle? caption1Medium,
    TextStyle? caption1Bold,
    TextStyle? caption2Regular,
    TextStyle? caption2Medium,
    TextStyle? caption2Bold,
    TextStyle? title1Bold,
    TextStyle? title1Regular,
    TextStyle? title2Bold,
    TextStyle? title3Bold,
    TextStyle? title4SemiBold,
    TextStyle? subTitle1,
  }) {
    return CustomTypography(
      h1Regular: h1Regular ?? this.h1Regular,
      h1Medium: h1Medium ?? this.h1Medium,
      h1Bold: h1Bold ?? this.h1Bold,
      h2Regular: h2Regular ?? this.h2Regular,
      h2Medium: h2Medium ?? this.h2Medium,
      h2Bold: h2Bold ?? this.h2Bold,
      h3Regular: h3Regular ?? this.h3Regular,
      h3Medium: h3Medium ?? this.h3Medium,
      h3Bold: h3Bold ?? this.h3Bold,
      h4Medium: h4Medium ?? this.h4Medium,
      h4Regular: h4Regular ?? this.h4Regular,
      h4Bold: h4Bold ?? this.h4Bold,
      h5Medium: h5Medium ?? this.h5Medium,
      h5Regular: h5Regular ?? this.h5Regular,
      h5Bold: h5Bold ?? this.h5Bold,
      body1Medium: body1Medium ?? this.body1Medium,
      body1Regular: body1Regular ?? this.body1Regular,
      body1Bold: body1Bold ?? this.body1Bold,
      body2Medium: body2Medium ?? this.body2Medium,
      body2Regular: body2Regular ?? this.body2Regular,
      body2Bold: body2Bold ?? this.body2Bold,
      body3Medium: body3Medium ?? this.body3Medium,
      body3Regular: body3Regular ?? this.body3Regular,
      body3Bold: body3Bold ?? this.body3Bold,
      body4Medium: body4Medium ?? this.body4Medium,
      body4Regular: body4Regular ?? this.body4Regular,
      body4Bold: body4Bold ?? this.body4Bold,
      button1Regular: button1Regular ?? this.button1Regular,
      button1Medium: button1Medium ?? this.button1Medium,
      button1Bold: button1Regular ?? this.button1Regular,
      caption1Regular: caption1Regular ?? this.caption1Regular,
      caption1Medium: caption1Medium ?? this.caption1Medium,
      caption1Bold: caption1Bold ?? this.caption2Bold,
      caption2Regular: caption2Regular ?? this.caption2Regular,
      caption2Medium: caption2Medium ?? this.caption2Medium,
      caption2Bold: caption2Bold ?? this.caption2Bold,
      title1Bold: title1Bold ?? this.title1Bold,
      title1Regular: title1Regular ?? this.title1Regular,
      title2Bold: title2Bold ?? this.title2Bold,
      title3Bold: title3Bold ?? this.title3Bold,
      title4SemiBold: title4SemiBold ?? this.title4SemiBold,
      subTitle1: subTitle1 ?? this.subTitle1,
    );
  }

  @override
  CustomTypography lerp(ThemeExtension<CustomTypography>? other, double t) {
    if (other is! CustomTypography) {
      return this;
    }

    return CustomTypography(
      h1Regular: TextStyle.lerp(h1Regular, other.h1Regular, t)!,
      h1Medium: TextStyle.lerp(h1Medium, other.h1Medium, t)!,
      h1Bold: TextStyle.lerp(h1Bold, other.h1Bold, t)!,
      h2Regular: TextStyle.lerp(h2Regular, other.h2Regular, t)!,
      h2Medium: TextStyle.lerp(h2Medium, other.h2Medium, t)!,
      h2Bold: TextStyle.lerp(h2Bold, other.h2Bold, t)!,
      h3Regular: TextStyle.lerp(h3Regular, other.h3Regular, t)!,
      h3Medium: TextStyle.lerp(h3Medium, other.h3Medium, t)!,
      h3Bold: TextStyle.lerp(h3Bold, other.h3Bold, t)!,
      h4Medium: TextStyle.lerp(h4Medium, other.h4Medium, t)!,
      h4Regular: TextStyle.lerp(h4Regular, other.h4Regular, t)!,
      h4Bold: TextStyle.lerp(h4Bold, other.h4Bold, t)!,
      h5Medium: TextStyle.lerp(h5Medium, other.h5Medium, t)!,
      h5Regular: TextStyle.lerp(h5Regular, other.h5Regular, t)!,
      h5Bold: TextStyle.lerp(h5Bold, other.h5Bold, t)!,
      body1Medium: TextStyle.lerp(body1Medium, other.body1Medium, t)!,
      body1Regular: TextStyle.lerp(body1Regular, other.body1Regular, t)!,
      body1Bold: TextStyle.lerp(body1Bold, other.body1Bold, t)!,
      body2Medium: TextStyle.lerp(body2Medium, other.body2Medium, t)!,
      body2Regular: TextStyle.lerp(body2Regular, other.body2Regular, t)!,
      body2Bold: TextStyle.lerp(body2Bold, other.body2Bold, t)!,
      body3Medium: TextStyle.lerp(body3Medium, other.body3Medium, t)!,
      body3Regular: TextStyle.lerp(body3Regular, other.body3Regular, t)!,
      body3Bold: TextStyle.lerp(body3Bold, other.body3Bold, t)!,
      body4Medium: TextStyle.lerp(body4Medium, other.body4Medium, t)!,
      body4Regular: TextStyle.lerp(body4Regular, other.body4Regular, t)!,
      body4Bold: TextStyle.lerp(body4Bold, other.body4Bold, t)!,
      button1Regular: TextStyle.lerp(button1Regular, other.button1Regular, t)!,
      button1Medium: TextStyle.lerp(button1Medium, other.button1Medium, t)!,
      button1Bold: TextStyle.lerp(button1Bold, other.button1Bold, t)!,
      caption1Regular:
          TextStyle.lerp(caption1Regular, other.caption1Regular, t)!,
      caption1Medium: TextStyle.lerp(caption1Medium, other.caption1Medium, t)!,
      caption1Bold: TextStyle.lerp(caption1Bold, other.caption1Bold, t)!,
      caption2Regular:
          TextStyle.lerp(caption2Regular, other.caption2Regular, t)!,
      caption2Medium: TextStyle.lerp(caption2Medium, other.caption2Medium, t)!,
      caption2Bold: TextStyle.lerp(caption2Bold, other.caption2Bold, t)!,
      title1Bold: TextStyle.lerp(title1Bold, other.title1Bold, t)!,
      title1Regular: TextStyle.lerp(title1Regular, other.title1Regular, t)!,
      title2Bold: TextStyle.lerp(title2Bold, other.title2Bold, t)!,
      title3Bold: TextStyle.lerp(title3Bold, other.title3Bold, t)!,
      title4SemiBold: TextStyle.lerp(title4SemiBold, other.title4SemiBold, t)!,
      subTitle1: TextStyle.lerp(subTitle1, other.subTitle1, t)!,
    );
  }

  static const CustomTypography light = CustomTypography(
    h1Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 48,
      fontWeight: FontWeight.w400,
    ),
    h1Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 48.0,
      fontWeight: FontWeight.w500,
    ),
    h1Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 48.0,
      fontWeight: FontWeight.w700,
    ),
    h2Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 40.0,
      fontWeight: FontWeight.w400,
    ),
    h2Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 40.0,
      fontWeight: FontWeight.w500,
    ),
    h2Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 40.0,
      fontWeight: FontWeight.w700,
    ),
    h3Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 33.0,
      fontWeight: FontWeight.w400,
    ),
    h3Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 33.0,
      fontWeight: FontWeight.w500,
    ),
    h3Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 33.0,
      fontWeight: FontWeight.w700,
    ),
    h4Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 28.0,
      fontWeight: FontWeight.w500,
    ),
    h4Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 28.0,
      fontWeight: FontWeight.w400,
    ),
    h4Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    ),
    h5Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 23.0,
      fontWeight: FontWeight.w500,
    ),
    h5Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 23.0,
      fontWeight: FontWeight.w400,
    ),
    h5Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 23.0,
      fontWeight: FontWeight.w700,
      height: 32.2,
    ),
    body1Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 19.0,
      fontWeight: FontWeight.w500,
    ),
    body1Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 19.0,
      fontWeight: FontWeight.w400,
    ),
    body1Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 19.0,
      fontWeight: FontWeight.w700,
    ),
    body2Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    body2Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    body2Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),
    body3Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    body3Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    body3Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    body4Medium: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    body4Regular: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    body4Bold: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    button1Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    button1Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    button1Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    caption1Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
    caption1Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
    ),
    caption1Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
    caption2Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
    ),
    caption2Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 10.0,
      fontWeight: FontWeight.w500,
    ),
    caption2Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 10.0,
      fontWeight: FontWeight.w700,
    ),
    title1Bold: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    ),
    title1Regular: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
    ),
    title2Bold: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 13,
      fontWeight: FontWeight.w700,
    ),
    title3Bold: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 7.58,
      fontWeight: FontWeight.w700,
    ),
    title4SemiBold: TextStyle(
      fontFamily: _fontFamily3,
      fontSize: 32.0,
      fontWeight: FontWeight.w600,
    ),
    subTitle1: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
  );

  static const CustomTypography dark = CustomTypography(
    h1Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 48,
      fontWeight: FontWeight.w400,
    ),
    h1Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 48.0,
      fontWeight: FontWeight.w500,
    ),
    h1Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 48.0,
      fontWeight: FontWeight.w700,
    ),
    h2Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 40.0,
      fontWeight: FontWeight.w400,
    ),
    h2Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 40.0,
      fontWeight: FontWeight.w500,
    ),
    h2Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 40.0,
      fontWeight: FontWeight.w700,
    ),
    h3Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 33.0,
      fontWeight: FontWeight.w400,
    ),
    h3Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 33.0,
      fontWeight: FontWeight.w500,
    ),
    h3Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 33.0,
      fontWeight: FontWeight.w700,
    ),
    h4Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 28.0,
      fontWeight: FontWeight.w500,
    ),
    h4Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 28.0,
      fontWeight: FontWeight.w400,
    ),
    h4Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    ),
    h5Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 23.0,
      fontWeight: FontWeight.w500,
    ),
    h5Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 23.0,
      fontWeight: FontWeight.w400,
    ),
    h5Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 23.0,
      fontWeight: FontWeight.w700,
    ),
    body1Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 19.0,
      fontWeight: FontWeight.w500,
    ),
    body1Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 19.0,
      fontWeight: FontWeight.w400,
    ),
    body1Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 19.0,
      fontWeight: FontWeight.w700,
    ),
    body2Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    body2Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    body2Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16.0,
      fontWeight: FontWeight.w700,
    ),
    body3Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    body3Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    body3Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    body4Medium: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    body4Regular: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    body4Bold: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    button1Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    button1Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    button1Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    caption1Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
    caption1Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
    ),
    caption1Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
    caption2Regular: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
    ),
    caption2Medium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 10.0,
      fontWeight: FontWeight.w500,
    ),
    caption2Bold: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 10.0,
      fontWeight: FontWeight.w700,
    ),
    title1Bold: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 20.0,
      fontWeight: FontWeight.w700,
    ),
    title1Regular: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 20.0,
      fontWeight: FontWeight.w400,
    ),
    title2Bold: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 13,
      fontWeight: FontWeight.w700,
    ),
    title3Bold: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 7.58,
      fontWeight: FontWeight.w700,
    ),
    title4SemiBold: TextStyle(
      fontFamily: _fontFamily3,
      fontSize: 32.0,
      fontWeight: FontWeight.w600,
    ),
    subTitle1: TextStyle(
      fontFamily: _fontFamily2,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
  );
}
