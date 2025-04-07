import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/skill_provider.dart';

class SkillCard extends ConsumerWidget {
  final String skillName;
  final bool isActive;

  const SkillCard({
    super.key,
    required this.skillName,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final isHovered = ValueNotifier(false);
    const activeColor = AppColors.brandBlue;

    return ValueListenableBuilder(
      valueListenable: isHovered,
      builder: (context, hovered, child) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (__) => isHovered.value = true,
          onExit: (__) => isHovered.value = false,
          child: GestureDetector(
            onTap: () {
              final activeSkills = ref.read(activeSkillProvider.notifier).state;
              final updatedSkills = List<String>.from(activeSkills);
              updatedSkills.add(skillName);
              ref.read(activeSkillProvider.notifier).state = updatedSkills;
            },
            child: Container(
              height: 40,
              width: 373,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 1,
                  color: isActive || hovered ? activeColor : AppColors.platinum,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  skillName,
                  style: TextStyle(
                    fontFamily: customTypography.body3Regular.fontFamily,
                    fontSize: customTypography.body3Regular.fontSize,
                    fontWeight: customTypography.body3Regular.fontWeight,
                    color: isActive || hovered ? activeColor : Colors.black,
                    letterSpacing: 0,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
