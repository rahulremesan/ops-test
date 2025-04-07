import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/start_rating/star_rating_with_number.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class RatingWidget extends StatelessWidget {
  final String label;
  final dynamic id;
  final int starCount;
  final double starSize;
  final double spaceBetweenStars;
  final double textSize;
  final double spaceBetweenStarsAndLabel;
  final bool hasBorder;

  const RatingWidget({
    super.key,
    required this.label,
    required this.id,
    this.starCount = 5,
    this.starSize = 16.0,
    this.spaceBetweenStars = 8.0,
    this.textSize = 16.0,
    this.spaceBetweenStarsAndLabel = 16.0,
    this.hasBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return LayoutBuilder(
      builder: (context, constraints) {
        final decoration = BoxDecoration(
          color: Colors.white,
          border: hasBorder
              ? Border.all(color: AppColors.wolFrame, width: 1.0)
              : null,
          borderRadius: BorderRadius.circular(8),
        );

        if (constraints.maxWidth < 500) {
          return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.5),
            height: 85,
            alignment: Alignment.center,
            decoration: decoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: customTypography.body1Regular.fontFamily,
                    fontSize: customTypography.body1Regular.fontSize,
                    fontWeight: customTypography.body1Regular.fontWeight,
                  ),
                ),
                StarRatingWithLabel(
                  id: id,
                  starCount: starCount,
                  starSize: starSize,
                  spaceBetweenStars: spaceBetweenStars,
                  spaceBetweenStarsAndLabel: spaceBetweenStarsAndLabel,
                ),
              ],
            ),
          );
        } else {
          return Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.5),
            height: 57,
            decoration: decoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: customTypography.body1Regular.fontFamily,
                    fontSize: customTypography.body1Regular.fontSize,
                    fontWeight: customTypography.body1Regular.fontWeight,
                    letterSpacing: 0,
                    color: AppColors.neutral_500,
                  ),
                ),
                StarRatingWithLabel(
                  id: id,
                  starCount: starCount,
                  starSize: starSize,
                  spaceBetweenStars: spaceBetweenStars,
                  spaceBetweenStarsAndLabel: spaceBetweenStarsAndLabel,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
