import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class FeedsProfileTag extends StatelessWidget {
  final String profileImage;
  final String name;
  final int lastSeen;
  final bool isPrimary;
  const FeedsProfileTag({
    super.key,
    required this.profileImage,
    required this.name,
    required this.lastSeen,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    String lastSeenText;
    if (lastSeen < 60) {
      lastSeenText = '$lastSeen minute${lastSeen > 1 ? 's' : ''} ago';
    } else {
      int hours = lastSeen ~/ 60; // Use integer division for hours
      lastSeenText = '$hours hour${hours > 1 ? 's' : ''} ago';
    }
    return Row(
      children: [
        ClipOval(
          child: SizedBox(
            height: isPrimary ? 50 : 45,
            width: isPrimary ? 50 : 45,
            child: Image.network(
              profileImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: isPrimary
                  ? TextStyle(
                      color: AppColors.neutral_500,
                      fontFamily: customTypography.body2Medium.fontFamily,
                      fontSize: customTypography.body2Medium.fontSize,
                      fontWeight: customTypography.body2Medium.fontWeight,
                    )
                  : TextStyle(
                      color: AppColors.neutral_500,
                      fontFamily: customTypography.body1Regular.fontFamily,
                      fontSize: customTypography.body1Regular.fontSize,
                      fontWeight: customTypography.body1Regular.fontWeight,
                    ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              lastSeenText,
              style: isPrimary
                  ? TextStyle(
                      color: AppColors.wolFrame,
                      fontFamily: customTypography.caption1Regular.fontFamily,
                      fontSize: customTypography.caption1Regular.fontSize,
                      fontWeight: customTypography.caption1Regular.fontWeight,
                    )
                  : TextStyle(
                      color: AppColors.wolFrame,
                      fontFamily: customTypography.caption2Regular.fontFamily,
                      fontSize: customTypography.caption2Regular.fontSize,
                      fontWeight: customTypography.caption2Regular.fontWeight,
                    ),
            )
          ],
        )
      ],
    );
  }
}
