import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class TimePeriodTag extends StatelessWidget {
  final String startTime;
  final String endTime;
  final bool isSelected;

  const TimePeriodTag({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary_50 : AppColors.platinum,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          isSelected
              ? const Icon(
                  Icons.check,
                  size: 16,
                  color: AppColors.brandBlue,
                )
              : const Icon(Icons.error_outline,
                  size: 16, color: AppColors.neutral_500),
          const SizedBox(
            width: 4,
          ),
          Text(
            '$startTime -$endTime',
            style: TextStyle(
                fontFamily: customTypography.body4Regular.fontFamily,
                fontSize: customTypography.body4Regular.fontSize,
                fontWeight: customTypography.body4Regular.fontWeight,
                color:
                    isSelected ? AppColors.brandBlue : AppColors.neutral_500),
          ),
        ]),
      ),
    );
  }
}
