import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class PendingTasksCard extends StatelessWidget {
  final String taskName;
  final DateTime date;
  final String assignee;
  const PendingTasksCard({
    super.key,
    required this.taskName,
    required this.date,
    required this.assignee,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final screenWidth = MediaQuery.of(context).size.width;

    final formattedDate = DateFormat('dd/MM/yyyy').format(date);

    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            taskName,
            style: TextStyle(
              fontFamily: customTypography.body2Medium.fontFamily,
              fontSize: customTypography.body2Medium.fontSize,
              fontWeight: customTypography.body2Medium.fontWeight,
              color: AppColors.lacqueredLiquorice,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          screenWidth > 375
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formattedDate,
                      style: TextStyle(
                        fontFamily: customTypography.body3Regular.fontFamily,
                        fontSize: customTypography.body3Regular.fontSize,
                        fontWeight: customTypography.body3Regular.fontWeight,
                        color: AppColors.lacqueredLiquorice,
                        letterSpacing: 0,
                      ),
                    ),
                    Text(
                      'Assigned by: $assignee',
                      style: TextStyle(
                        fontFamily: customTypography.body3Regular.fontFamily,
                        fontSize: customTypography.body3Regular.fontSize,
                        fontWeight: customTypography.body3Regular.fontWeight,
                        color: AppColors.lacqueredLiquorice,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formattedDate,
                      style: TextStyle(
                        fontFamily: customTypography.body3Regular.fontFamily,
                        fontSize: customTypography.body3Regular.fontSize,
                        fontWeight: customTypography.body3Regular.fontWeight,
                        color: AppColors.lacqueredLiquorice,
                        letterSpacing: 0,
                      ),
                    ),
                    Text(
                      'Assigned by: $assignee',
                      style: TextStyle(
                        fontFamily: customTypography.body3Regular.fontFamily,
                        fontSize: customTypography.body3Regular.fontSize,
                        fontWeight: customTypography.body3Regular.fontWeight,
                        color: AppColors.lacqueredLiquorice,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
