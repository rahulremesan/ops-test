import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class AwardsTag extends StatelessWidget {
  final IconData icon;
  final String details;
  final int count;
  final bool isReversed;
  const AwardsTag({
    super.key,
    required this.icon,
    required this.details,
    required this.count,
    required this.isReversed,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Row(
      children: [
        Icon(
          icon,
          size: 24,
          color: AppColors.lilacGray,
        ),
        const SizedBox(
          width: 10,
        ),
        isReversed
            ? Row(
                children: [
                  Text(
                    details,
                    style: TextStyle(
                      color: AppColors.lacqueredLiquorice,
                      fontFamily: customTypography.body3Medium.fontFamily,
                      fontSize: customTypography.body3Medium.fontSize,
                      fontWeight: customTypography.body3Medium.fontWeight,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    '$count',
                    style: TextStyle(
                      fontFamily: customTypography.body3Medium.fontFamily,
                      fontSize: customTypography.body3Medium.fontSize,
                      fontWeight: customTypography.body3Medium.fontWeight,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Text(
                    '$count',
                    style: TextStyle(
                      fontFamily: customTypography.body3Medium.fontFamily,
                      fontSize: customTypography.body3Medium.fontSize,
                      fontWeight: customTypography.body3Medium.fontWeight,
                    ),
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    details,
                    style: TextStyle(
                      color: AppColors.lacqueredLiquorice,
                      fontFamily: customTypography.body3Medium.fontFamily,
                      fontSize: customTypography.body3Medium.fontSize,
                      fontWeight: customTypography.body3Medium.fontWeight,
                    ),
                  ),
                ],
              )
      ],
    );
  }
}
