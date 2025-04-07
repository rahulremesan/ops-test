import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/atoms/rating_card.dart/rating_card.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/all_skills_card.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

final isSearchVisibleProvider = StateProvider<bool>((ref) => false);
final searchQueryProvider = StateProvider<String>((ref) => '');

class SkillsLayout extends ConsumerWidget {
  final List<Map<String, dynamic>> mySkills;
  final List<String> allSkills;
  bool showBreadcrumbs;

  SkillsLayout({
    super.key,
    List<Map<String, dynamic>>? mySkills,
    List<String>? allSkills,
    this.showBreadcrumbs = true,
  })  : mySkills = mySkills ??
            const [
              {'label': 'Adobe XD', 'id': 1, 'rating': 4},
              {'label': 'Client interaction', 'id': 3, 'rating': 3},
              {'label': 'Requirement analysis', 'id': 4, 'rating': 4},
              {'label': 'Requirement gathering', 'id': 5, 'rating': 3},
              {'label': 'Sketch App', 'id': 6, 'rating': 2},
            ],
        allSkills = allSkills ??
            const [
              'Adobe XD',
              'Adobe Creative Suite',
              'Client Interaction',
              'Requirement Analysis',
              'Requirement Gathering',
              'Sketch App',
              'Team Leading',
              'UX Research',
              'Figma',
              'Prototyping',
            ];

  List<Map<String, dynamic>> _getFilteredSkills(String query) {
    if (query.isEmpty) return mySkills;
    return mySkills
        .where((skill) => skill['label']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final screenWidth = MediaQuery.of(context).size.width;
    const breakpoint = 1600.0;
    final isMobile = ref.watch(isMobileProvider);

    final isSearchVisible = ref.watch(isSearchVisibleProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final filteredSkills = _getFilteredSkills(searchQuery);

    return Container(
      padding:
          EdgeInsets.fromLTRB(isMobile ? 20 : 40, 20, isMobile ? 20 : 40, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Breadcrumbs Row
          Row(
            children: [
              if (!isMobile && showBreadcrumbs) ...[
                Expanded(
                  child: PageBreadcrumbs(
                    items: [
                      BreadcrumbData(
                        label: 'Apps',
                        link: AppRoute.apps,
                        isActive: true,
                      ),
                      BreadcrumbData(
                        label: 'Skills',
                        link: AppRoute.skills,
                        isActive: false,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ],
          ),
          Text(
            'Skills',
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
            child: screenWidth > breakpoint
                ? // Desktop Layout
                Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSkillsHeader(context, customTypography, ref,
                                isSearchVisible),
                            if (isSearchVisible) _buildSearchBar(ref),
                            const SizedBox(height: 20),
                            Expanded(
                              child: _buildSkillsList(filteredSkills),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: AllSkillsCard(
                          skills: allSkills,
                        ),
                      ),
                    ],
                  )
                : // Mobile Layout
                LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: isMobile ? 0 : 16),
                                child: AllSkillsCard(
                                  skills: allSkills,
                                ),
                              ),
                              const SizedBox(height: 24),
                              _buildSkillsHeader(context, customTypography, ref,
                                  isSearchVisible),
                              const SizedBox(height: 16),
                              if (isSearchVisible)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: _buildSearchBar(ref),
                                ),
                              _buildSkillsListNonScrollable(filteredSkills),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsHeader(BuildContext context,
      CustomTypography customTypography, WidgetRef ref, bool isSearchVisible) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'My skills',
            style: TextStyle(
              fontFamily: customTypography.body1Medium.fontFamily,
              fontSize: customTypography.body1Medium.fontSize,
              fontWeight: customTypography.body1Medium.fontWeight,
              letterSpacing: 0,
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            ref.read(isSearchVisibleProvider.notifier).state = !isSearchVisible;
            if (!isSearchVisible) {
              ref.read(searchQueryProvider.notifier).state = '';
            }
          },
          icon: Icon(isSearchVisible ? Icons.close : Icons.search),
        ),
      ],
    );
  }

  Widget _buildSearchBar(WidgetRef ref) {
    return TextField(
      onChanged: (value) {
        ref.read(searchQueryProvider.notifier).state = value;
      },
      decoration: InputDecoration(
        hintText: 'Search skills...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _buildSkillsList(List<Map<String, dynamic>> skills) {
    return ListView.separated(
      itemCount: skills.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final skill = skills[index];
        return RatingWidget(
          label: skill['label'],
          id: skill['id'],
          hasBorder: false,
          starSize: 23.0,
        );
      },
    );
  }

  Widget _buildSkillsListNonScrollable(List<Map<String, dynamic>> skills) {
    return Column(
      children: skills.map((skill) {
        return Column(
          children: [
            RatingWidget(
              label: skill['label'],
              id: skill['id'],
              hasBorder: false,
              starSize: 23.0,
            ),
            const SizedBox(height: 16),
          ],
        );
      }).toList(),
    );
  }
}
