import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class Tag extends StatelessWidget {
  final String? text;
  final Color? color;
  final TextStyle? textStyle;
  final Color? borderColor;
  const Tag(
      {super.key, this.text, this.color, this.textStyle, this.borderColor});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20.0),
            border:
                Border.all(width: 1, color: borderColor ?? Colors.transparent)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
          child: Row(
            children: [
              Text(
                text ?? '',
                style: textStyle ??
                    TextStyle(
                      fontFamily: customTypography.button1Regular.fontFamily,
                      fontSize: customTypography.button1Regular.fontSize,
                      fontWeight: customTypography.button1Regular.fontWeight,
                      fontStyle: customTypography.button1Regular.fontStyle,
                      color: AppColors.neutral_400,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
