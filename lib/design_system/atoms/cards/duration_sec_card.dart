import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class DurationSecCard extends StatelessWidget {
  const DurationSecCard({
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
    return SizedBox(
      height: 32,
      child: Text(
        '$hours:${minutes.toString().padLeft(2, '0')} hrs',
        style: TextStyle(
          fontFamily: customTypography.h5Medium.fontFamily,
          fontSize: customTypography.h5Medium.fontSize,
          fontWeight: customTypography.h5Medium.fontWeight,
          color: AppColors.lacqueredLiquorice,
          letterSpacing: 0,
        ),
      ),
    );
  }
}
