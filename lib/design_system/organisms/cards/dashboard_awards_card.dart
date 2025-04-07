import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/awards_place_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class DashboardAwardsCard extends StatelessWidget {
  final String profileImage1;
  final String name1;
  final int awardsCount1;
  final int points1;
  final int level1;
  final String profileImage2;
  final String name2;
  final int awardsCount2;
  final int points2;
  final int level2;
  final String profileImage3;
  final String name3;
  final int awardsCount3;
  final int points3;
  final int level3;
  const DashboardAwardsCard({
    super.key,
    required this.profileImage1,
    required this.name1,
    required this.awardsCount1,
    required this.points1,
    required this.level1,
    required this.profileImage2,
    required this.name2,
    required this.awardsCount2,
    required this.points2,
    required this.level2,
    required this.profileImage3,
    required this.name3,
    required this.awardsCount3,
    required this.points3,
    required this.level3,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 20, right: 18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Awards',
                  style: TextStyle(
                    fontFamily: customTypography.h5Bold.fontFamily,
                    fontSize: customTypography.h5Bold.fontSize,
                    fontWeight: customTypography.h5Bold.fontWeight,
                  ),
                ),
                TertiaryButton(buttonText: 'View all', onPressed: () {}),
              ],
            ),
            Column(
              children: [
                AwardsPlaceCard(
                  profileImage: profileImage1,
                  name: name1,
                  awardPlace: 1,
                  awardsCount: awardsCount1,
                  points: points1,
                  level: level1,
                ),
                const Divider(
                  color: AppColors.dreamyCloud,
                  height: 1,
                ),
                AwardsPlaceCard(
                  profileImage: profileImage2,
                  name: name2,
                  awardPlace: 2,
                  awardsCount: awardsCount2,
                  points: points2,
                  level: level2,
                ),
                const Divider(
                  color: AppColors.dreamyCloud,
                  height: 1,
                ),
                AwardsPlaceCard(
                  profileImage: profileImage3,
                  name: name3,
                  awardPlace: 3,
                  awardsCount: awardsCount3,
                  points: points3,
                  level: level3,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
