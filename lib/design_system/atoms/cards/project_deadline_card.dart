import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ProjectDeadlineCard extends StatelessWidget {
  final String projectName;
  final DateTime startDate;
  final DateTime endDate;

  const ProjectDeadlineCard({
    super.key,
    required this.projectName,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return LayoutBuilder(
      builder: (context, constraints) {
        String formattedStartDate = DateFormat('dd/MM/yyy').format(startDate);
        String formattedEndDate = DateFormat('dd/MM/yyy').format(endDate);
        if (constraints.maxWidth < 500) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            height: 70,
            decoration: BoxDecoration(
              border:
                  Border.all(color: AppColors.wolFrame, width: 1.0),
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8.0,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(
                      Icons.folder_copy_outlined,
                      size: 16.0,
                    ),
                    Text(
                      projectName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: customTypography.body3Medium.fontFamily,
                        fontSize: customTypography.body3Medium.fontSize,
                        fontWeight: customTypography.body3Medium.fontWeight,
                        fontStyle: customTypography.body3Medium.fontStyle,
                      ),
                    ),
                  ],
                ),
                Text(
                  '$formattedStartDate - $formattedEndDate',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: customTypography.body3Regular.fontFamily,
                    fontSize: customTypography.body3Regular.fontSize,
                    fontWeight: customTypography.body3Regular.fontWeight,
                    fontStyle: customTypography.body3Regular.fontStyle,
                  ),
                )
              ],
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            height: 70,
            decoration: BoxDecoration(
              border:
                  Border.all(color: AppColors.wolFrame, width: 1.0),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 4.0,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.folder_copy_outlined,
                      size: customTypography.body3Medium.fontSize,
                    ),
                    Text(
                      projectName,
                      style: TextStyle(
                        fontFamily: customTypography.body3Medium.fontFamily,
                        fontSize: customTypography.body3Medium.fontSize,
                        fontWeight: customTypography.body3Medium.fontWeight,
                        fontStyle: customTypography.body3Medium.fontStyle,
                      ),
                    )
                  ],
                ),
                Text(
                  '$formattedStartDate - $formattedEndDate',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: customTypography.body3Regular.fontFamily,
                    fontSize: customTypography.body3Regular.fontSize,
                    fontWeight: customTypography.body3Regular.fontWeight,
                    fontStyle: customTypography.body3Regular.fontStyle,
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
