import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/dashboard_actions_date_tag.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class DashboardActionsField extends StatelessWidget {
  final Color bgColor;
  final DateTime date;
  final String title;
  final String description;
  const DashboardActionsField({
    super.key,
    required this.bgColor,
    required this.date,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      height: 78,
      decoration: BoxDecoration(
        color: AppColors.brandBlueSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardActionsDateTag(
              bgColor: bgColor,
              date: date,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    title,
                    style: TextStyle(
                      fontFamily: customTypography.body2Medium.fontFamily,
                      fontSize: customTypography.body2Medium.fontSize,
                      fontWeight: customTypography.body2Medium.fontWeight,
                      color: AppColors.lacqueredLiquorice,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    description,
                    style: TextStyle(
                      fontFamily: customTypography.body3Regular.fontFamily,
                      fontSize: customTypography.body3Regular.fontSize,
                      fontWeight: customTypography.body3Regular.fontWeight,
                      color: AppColors.lacqueredLiquorice,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
