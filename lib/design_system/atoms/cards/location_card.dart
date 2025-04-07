import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class LocationCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const LocationCard({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 400;

    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minWidth: isSmallScreen ? 110 : 120,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.brandBlue : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColors.brandBlue : AppColors.nickel,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : AppColors.nickel,
              size: isSmallScreen ? 18 : 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.nickel,
                fontFamily: isSmallScreen
                    ? customTypography.body3Medium.fontFamily
                    : customTypography.body2Medium.fontFamily,
                fontSize: isSmallScreen
                    ? customTypography.body3Medium.fontSize
                    : customTypography.body2Medium.fontSize,
                fontWeight: isSmallScreen
                    ? customTypography.body3Medium.fontWeight
                    : customTypography.body2Medium.fontWeight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
