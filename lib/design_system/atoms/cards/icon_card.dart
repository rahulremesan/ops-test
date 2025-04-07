import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class IconCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle? textStyle;
  final Color? iconColor;
  final double? iconSize;
  final double? space;
  final bool isBackgrounded;
  final Color? backgroundColor;

  const IconCard({
    super.key,
    required this.icon,
    required this.text,
    this.textStyle,
    this.iconColor,
    this.iconSize,
    this.space,
    this.isBackgrounded = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: isBackgrounded
              ? BoxDecoration(
                  color: backgroundColor ?? AppColors.primary_50,
                  borderRadius: BorderRadius.circular(4),
                )
              : null,
          padding: isBackgrounded ? const EdgeInsets.all(6.0) : null,
          child: Icon(
            icon,
            color: iconColor ?? AppColors.neutral_400,
            size: iconSize ?? 24.0,
          ),
        ),
        SizedBox(width: space ?? 8.0),
        Flexible(
          child: Text(
            overflow: TextOverflow.ellipsis,
            text,
            maxLines: 1,
            style: textStyle ??
                TextStyle(
                  fontFamily: customTypography.body2Regular.fontFamily,
                  fontSize: customTypography.body2Regular.fontSize,
                  fontWeight: customTypography.body2Regular.fontWeight,
                  color: AppColors.neutral_500,
                  letterSpacing: 0,
                ),
          ),
        ),
      ],
    );
  }
}
