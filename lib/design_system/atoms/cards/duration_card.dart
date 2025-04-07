import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class DurationCard extends StatelessWidget {
  const DurationCard({
    super.key,
    required this.duration,
  });
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final int hours = duration.inHours;
    final int minutes = duration.inMinutes % 60;
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Text(
      '$hours:${minutes.toString().padLeft(2, '0')} hrs',
      style: TextStyle(
        fontFamily: customTypography.h4Bold.fontFamily,
        fontSize: customTypography.h4Bold.fontSize,
        fontWeight: customTypography.h4Bold.fontWeight,
        color: AppColors.neutral_500,
        letterSpacing: 0,
      ),
    );
  }
}
