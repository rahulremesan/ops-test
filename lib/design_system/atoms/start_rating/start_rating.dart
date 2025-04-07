import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';

final starRatingProvider = StateProvider.family<int, dynamic>((ref, id) => 0);

class StarRating extends ConsumerWidget {
  final dynamic id; // Unique identifier for each usage
  final int starCount;
  final double starSize;
  final double spaceBetweenStars;

  const StarRating({
    super.key,
    required this.id,
    this.starCount = 5,
    this.starSize = 16,
    this.spaceBetweenStars = 32.0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rating = ref.watch(starRatingProvider(id));

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount * 2 - 1, (index) {
        if (index.isOdd) {
          return SizedBox(width: spaceBetweenStars);
        }
        final int starIndex = index ~/ 2;

        return GestureDetector(
          onTap: () {
            final currentRating =
                ref.read(starRatingProvider(id).notifier).state;
            ref.read(starRatingProvider(id).notifier).state =
                currentRating == starIndex + 1 ? starIndex : starIndex + 1;
          },
          child: Icon(
            starIndex < rating ? Icons.star_rounded : Icons.star_border_rounded,
            color: starIndex < rating
                ? AppColors.brandBlue
                : AppColors.nickel,
            size: starSize,
          ),
        );
      }),
    );
  }
}
