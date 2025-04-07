import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/tag.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class FeedsHashtagCard extends StatelessWidget {
  final List<String> hashtags;
  const FeedsHashtagCard({
    super.key,
    required this.hashtags,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      width: 402,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 22,
          right: 30,
          bottom: 27,
          left: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trending Hashtags',
              style: TextStyle(
                fontFamily: customTypography.body2Bold.fontFamily,
                fontSize: customTypography.body2Bold.fontSize,
                fontWeight: customTypography.body2Bold.fontWeight,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: hashtags.map((hashtag) {
                return Tag(
                  text: '#$hashtag',
                  color: AppColors.brilliantWhite,
                  borderColor: AppColors.paleBlueViolet,
                  textStyle: TextStyle(
                      fontFamily: customTypography.caption1Regular.fontFamily,
                      fontSize: customTypography.caption1Regular.fontSize,
                      fontWeight: customTypography.caption1Regular.fontWeight,
                    ),
                );
              }).toList(),

            )
          ],
        ),
      ),
    );
  }
}
