import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

final starRatingProvider = StateProvider.family<int, dynamic>((ref, id) => 0);

class StarRatingWithLabel extends ConsumerWidget {
  final dynamic id; // Unique identifier for each usage
  final int starCount;
  final double starSize;
  final double spaceBetweenStars;
  final double textSize;
  final double spaceBetweenStarsAndLabel;

  const StarRatingWithLabel({
    super.key,
    required this.id,
    this.starCount = 5,
    this.starSize = 16.0,
    this.spaceBetweenStars = 16.0,
    this.textSize = 16.0,
    this.spaceBetweenStarsAndLabel = 10.0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(starRatingProvider(id));
    print(rating);
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(starCount * 2 - 1, (index) {
            if (index.isOdd) {
              return SizedBox(width: spaceBetweenStars);
            }
            final int starIndex = index ~/ 2;

            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  final currentRating =
                      ref.read(starRatingProvider(id).notifier).state;
                  ref.read(starRatingProvider(id).notifier).state =
                      currentRating == starIndex + 1
                          ? starIndex
                          : starIndex + 1;
                },
                child: Icon(
                  starIndex < rating
                      ? Icons.star_rounded
                      : Icons.star_border_rounded,
                  color: starIndex < rating
                      ? AppColors.brandBlue
                      : AppColors.nickel,
                  size: starSize,
                ),
              ),
            );
          }),
        ),
        SizedBox(width: spaceBetweenStarsAndLabel),
        Text(
          '$rating/$starCount',
          style: TextStyle(
            fontFamily: customTypography.body1Regular.fontFamily,
            fontWeight: customTypography.body1Regular.fontWeight,
            fontSize: customTypography.body1Regular.fontSize,
            color: AppColors.neutral_400,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
