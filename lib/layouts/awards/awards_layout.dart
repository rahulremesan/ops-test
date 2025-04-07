import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/atoms/tabs/tabs.dart';
import 'package:styria_flutter_web/design_system/molecules/award_card.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class Award {
  final String extraImageUrl;
  final String profileUrl;
  final String profileName;
  final String awardedBy;
  final String date;
  final String description;
  final String title;

  Award({
    required this.extraImageUrl,
    required this.profileUrl,
    required this.profileName,
    required this.awardedBy,
    required this.date,
    required this.description,
    required this.title,
  });
}

final List<Award> awards = [
  Award(
      extraImageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_9rdI1Wq9vvBVoO_P0LN8iAOpstgn4eoVSg&s',
      profileUrl:
          'https://www.profilebakery.com/wp-content/uploads/2023/04/LINKEDIN-Profile-Picture-AI.jpg',
      profileName: 'John',
      awardedBy: 'Tarento',
      date: '21/04/2024',
      description: 'Thank you for helping in inspire project',
      title: 'Awesome addition to team'),
  Award(
      extraImageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_9rdI1Wq9vvBVoO_P0LN8iAOpstgn4eoVSg&s',
      profileUrl:
          'https://www.profilebakery.com/wp-content/uploads/2023/04/LINKEDIN-Profile-Picture-AI.jpg',
      profileName: 'John',
      awardedBy: 'Tarento',
      date: '21/04/2024',
      description: 'Thank you for helping in inspire project',
      title: 'Awesome addition to team'),
  Award(
      extraImageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_9rdI1Wq9vvBVoO_P0LN8iAOpstgn4eoVSg&s',
      profileUrl:
          'https://www.profilebakery.com/wp-content/uploads/2023/04/LINKEDIN-Profile-Picture-AI.jpg',
      profileName: 'John',
      awardedBy: 'Tarento',
      date: '21/04/2024',
      description: 'Thank you for helping in inspire project',
      title: 'Awesome addition to team'),
  Award(
      extraImageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_9rdI1Wq9vvBVoO_P0LN8iAOpstgn4eoVSg&s',
      profileUrl:
          'https://www.profilebakery.com/wp-content/uploads/2023/04/LINKEDIN-Profile-Picture-AI.jpg',
      profileName: 'John',
      awardedBy: 'Tarento',
      date: '21/04/2024',
      description: 'Thank you for helping in inspire project',
      title: 'Awesome addition to team')
];

class AwardsLayout extends ConsumerWidget {
  final bool showBreadcrumbs;

  const AwardsLayout({
    super.key,
    this.showBreadcrumbs = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final isMobile = ref.watch(isMobileProvider);
    return Padding(
      padding: isMobile
          ? const EdgeInsets.fromLTRB(0, 0, 0, 0)
          : const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showBreadcrumbs && !isMobile) ...[
            PageBreadcrumbs(
              items: [
                BreadcrumbData(
                  label: 'Apps',
                  link: AppRoute.apps,
                  isActive: true,
                ),
                BreadcrumbData(
                  label: 'Awards',
                  link: AppRoute.awards,
                  isActive: false,
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
          ],
          Text(
            'Awards',
            style: TextStyle(
              fontFamily: customTypography.h3Bold.fontFamily,
              fontSize: customTypography.h3Bold.fontSize,
              fontWeight: customTypography.h3Bold.fontWeight,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: Tabs(
              tabTitles: const [
                'All awards',
                'Awards I\'ve Given',
                'Awards I\'ve Received',
                'Leaderboard'
              ],
              tabViews: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: _buildAllAwardsTab(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: _buildGivenAwardsTab(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: _buildReceivedAwardsTab(context),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: _buildLeaderboardTab(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAllAwardsTab(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 830,
          child: Column(
            children: awards.map((award) {
              return Column(
                children: [
                  AwardCard(
                    extraImageUrl: award.extraImageUrl,
                    profileUrl: award.profileUrl,
                    profileName: award.profileName,
                    awardedBy: award.awardedBy,
                    date: award.date,
                    description: award.description,
                    title: award.title,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildGivenAwardsTab(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 830,
          child: Column(
            children: awards.map((award) {
              return Column(
                children: [
                  AwardCard(
                    extraImageUrl: award.extraImageUrl,
                    profileUrl: award.profileUrl,
                    profileName: award.profileName,
                    awardedBy: award.awardedBy,
                    date: award.date,
                    description: award.description,
                    title: award.title,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildReceivedAwardsTab(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 830,
          child: Column(
            children: awards.map((award) {
              return Column(
                children: [
                  AwardCard(
                    extraImageUrl: award.extraImageUrl,
                    profileUrl: award.profileUrl,
                    profileName: award.profileName,
                    awardedBy: award.awardedBy,
                    date: award.date,
                    description: award.description,
                    title: award.title,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboardTab(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SizedBox(
          width: 830,
          child: Column(
            children: awards.map((award) {
              return Column(
                children: [
                  AwardCard(
                    extraImageUrl: award.extraImageUrl,
                    profileUrl: award.profileUrl,
                    profileName: award.profileName,
                    awardedBy: award.awardedBy,
                    date: award.date,
                    description: award.description,
                    title: award.title,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
