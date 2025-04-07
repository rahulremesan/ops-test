import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class TitleDescCard extends StatelessWidget {
  final String title;
  final String description;
  final String variant;

  const TitleDescCard({
    super.key,
    required this.title,
    required this.description,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final double paddingValue = variant == 'primary' ? 24.0 : 16.0;
    final double spacingValue = variant == 'primary' ? 16.0 : 8.0;

    return Container(
      constraints: const BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: AppColors.platinum)),
      child: Padding(
        padding: EdgeInsets.all(paddingValue),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to the left
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: spacingValue),
              child: Text(
                title,
                style: customTypography.body1Medium,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                color: AppColors.neutral_400,
                fontFamily: customTypography.body3Regular.fontFamily,
                fontSize: customTypography.body3Regular.fontSize,
                fontWeight: customTypography.body3Regular.fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
