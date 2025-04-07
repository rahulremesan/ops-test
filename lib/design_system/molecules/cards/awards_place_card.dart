import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/awards_place_tag.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/awards_tag.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class AwardsPlaceCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final int awardPlace;
  final int awardsCount;
  final int points;
  final int level;
  const AwardsPlaceCard({
    super.key,
    required this.profileImage,
    required this.name,
    required this.awardPlace,
    required this.awardsCount,
    required this.points,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 26,
          bottom: 26,
          left: 20,
          right: 40,
        ),
        child: SizedBox(
          height: screenWidth > 520 ? 58.5 : 99,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AwardsPlaceTag(place: awardPlace),
              const SizedBox(
                width: 18,
              ),
              ClipOval(
                child: SizedBox(
                  width: 56,
                  height: 56,
                  child: Image.network(profileImage),
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    screenWidth < 520
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 0.0),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              name,
                              style: TextStyle(
                                fontFamily:
                                    customTypography.body1Medium.fontFamily,
                                fontSize: customTypography.body1Medium.fontSize,
                                fontWeight:
                                    customTypography.body1Medium.fontWeight,
                                color: AppColors.lacqueredLiquorice,
                                letterSpacing: 0,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              name,
                              style: TextStyle(
                                fontFamily:
                                    customTypography.body1Medium.fontFamily,
                                fontSize: customTypography.body1Medium.fontSize,
                                fontWeight:
                                    customTypography.body1Medium.fontWeight,
                                color: AppColors.lacqueredLiquorice,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                    screenWidth > 520
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AwardsTag(
                                icon: Icons.emoji_events_outlined,
                                details: 'Awards',
                                count: awardsCount,
                                isReversed: false,
                              ),
                              AwardsTag(
                                icon: Icons.savings_outlined,
                                details: 'Points',
                                count: points,
                                isReversed: false,
                              ),
                              AwardsTag(
                                icon: Icons.star_border_outlined,
                                details: 'Level',
                                count: level,
                                isReversed: true,
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              AwardsTag(
                                icon: Icons.emoji_events_outlined,
                                details: 'Awards',
                                count: awardsCount,
                                isReversed: false,
                              ),
                              AwardsTag(
                                icon: Icons.savings_outlined,
                                details: 'Points',
                                count: points,
                                isReversed: false,
                              ),
                              AwardsTag(
                                icon: Icons.star_border_outlined,
                                details: 'Level',
                                count: level,
                                isReversed: true,
                              ),
                            ],
                          )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
