import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/skill_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
// import 'package:styria_flutter_web/shared/providers/skill_provider.dart';

final isSearchVisibleProvider = StateProvider<bool>((ref) => false);
final searchQueryProvider = StateProvider<String>((ref) => '');
final activeSkillProvider = StateProvider<List<String>>((ref) => []);

class AllSkillsCard extends ConsumerWidget {
  final List<String> skills;
  final FocusNode _searchFocusNode = FocusNode();

  AllSkillsCard({
    super.key,
    required this.skills,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final activeSkills = ref.watch(activeSkillProvider);
    final isSearchVisible = ref.watch(isSearchVisibleProvider);
    final searchQuery = ref.watch(searchQueryProvider);

    // Get screen width to determine if we're on mobile
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile =
        screenWidth < 768.0; // Common breakpoint for mobile devices

    if (isSearchVisible) {
      _searchFocusNode.requestFocus();
    }

    final filteredSkills = skills
        .where(
            (skill) => skill.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    // Container dimensions based on device type
    final containerWidth = isMobile ? screenWidth * 0.9 : 405.0;
    final containerHeight =
        isMobile ? MediaQuery.of(context).size.height * 0.5 : 776.0;

    return Center(
      child: Container(
        width: containerWidth,
        height: containerHeight,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 12 : 16),
          child: Column(
            children: [
              Row(
                children: [
                  if (!isSearchVisible) ...[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('All Skills',
                              style: TextStyle(
                                fontFamily:
                                    customTypography.body1Medium.fontFamily,
                                fontSize: customTypography.body1Medium.fontSize,
                                fontWeight:
                                    customTypography.body1Medium.fontWeight,
                                letterSpacing: 0,
                                color: Colors.black,
                              )),
                          IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              ref.read(isSearchVisibleProvider.notifier).state =
                                  !isSearchVisible;
                            },
                          ),
                        ],
                      ),
                    ),
                  ] else ...[
                    Expanded(
                      child: SizedBox(
                        height: 36,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                textAlignVertical: TextAlignVertical.bottom,
                                focusNode: _searchFocusNode,
                                decoration: InputDecoration(
                                  hintText: 'All Skills',
                                  hintStyle: customTypography.body1Medium
                                      .copyWith(color: AppColors.luckyGrey),
                                  border: const OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  ref.read(searchQueryProvider.notifier).state =
                                      value;
                                },
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                ref
                                    .read(isSearchVisibleProvider.notifier)
                                    .state = false;
                                ref.read(searchQueryProvider.notifier).state =
                                    '';
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(width: 8),
                  TertiaryButton(
                    buttonText: 'Add',
                    onPressed: () {},
                    icon: Icons.add,
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredSkills.length,
                  itemBuilder: (context, index) {
                    final skillName = filteredSkills[index];
                    return SkillCard(
                      skillName: skillName,
                      isActive: activeSkills.contains(skillName),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
