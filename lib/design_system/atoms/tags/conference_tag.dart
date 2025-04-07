import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';

class ConferenceTag extends StatelessWidget {
  final Icon icon;
  final String item;
  final bool isSelected;

  const ConferenceTag({
    super.key,
    required this.icon,
    required this.item,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE9EEFB) : AppColors.platinum,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            children: isSelected
                ? [
                    Icon(
                      icon.icon,
                      size: 16,
                      color: AppColors.brandBlue,
                    ),
                  ]
                : [
                    Icon(
                      icon.icon,
                      size: 16,
                      color: AppColors.neutral_500,
                    ),
                  ]),
      ),
    );
  }
}
