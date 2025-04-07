import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/duration_sec_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class TimeReportDetailsCard extends StatelessWidget {
  final String projectTitle;
  final String taskTitle;
  final Duration duration;
  final Color color;

  const TimeReportDetailsCard({
    super.key,
    required this.projectTitle,
    required this.color,
    required this.duration,
    required this.taskTitle,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;

        return Container(
          width: isMobile ? double.infinity : 200,
          height: 118,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                projectTitle,
                style: TextStyle(
                  fontSize: customTypography.body3Bold.fontSize,
                  fontFamily: customTypography.body3Bold.fontFamily,
                  fontWeight: customTypography.body3Bold.fontWeight,
                  color: color,
                  letterSpacing: 0,
                ),
              ),
              const Divider(
                thickness: 1,
                height: 17,
                color: AppColors.platinum,
              ),
              Text(
                taskTitle,
                style: TextStyle(
                  fontSize: customTypography.body3Regular.fontSize,
                  fontWeight: customTypography.body3Regular.fontWeight,
                  fontFamily: customTypography.body3Regular.fontFamily,
                  color: AppColors.luckyGrey,
                  letterSpacing: 0,
                ),
              ),
              DurationSecCard(duration: duration),
            ],
          ),
        );
      },
    );
  }
}
