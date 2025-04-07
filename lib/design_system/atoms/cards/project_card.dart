import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ProjectCard extends StatelessWidget {
  final IconData projectHealthIcon;
  final String imageUrl;
  final String title;
  final String domain;
  final String department;
  final String estimatedHours;
  final VoidCallback onPress;

  const ProjectCard({
    super.key,
    required this.projectHealthIcon,
    required this.imageUrl,
    required this.title,
    required this.domain,
    required this.department,
    required this.estimatedHours,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final textStyle = TextStyle(
      fontFamily: customTypography.body3Regular.fontFamily,
      fontSize: customTypography.body3Regular.fontSize,
      fontWeight: customTypography.body3Regular.fontWeight,
      height: customTypography.body3Regular.height,
      letterSpacing: 0,
      color: AppColors.neutral_500,
    );
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 405,
        height: 370,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 195,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Project Health:',
                        style: TextStyle(
                          fontFamily: customTypography.body3Regular.fontFamily,
                          fontSize: customTypography.body3Regular.fontSize,
                          fontWeight: customTypography.body3Regular.fontWeight,
                          height: customTypography.body3Regular.height,
                          letterSpacing: 0,
                          color: AppColors.neutral_400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Icon(
                          projectHealthIcon,
                          color: Colors.green,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey[300],
            ),
            Container(
              height: 174,
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: customTypography.body1Medium.fontFamily,
                      fontSize: customTypography.body1Medium.fontSize,
                      fontWeight: customTypography.body1Medium.fontWeight,
                      height: customTypography.body1Medium.height,
                      letterSpacing: 0,
                      color: AppColors.primary_900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.domain,
                          size: 20, color: AppColors.neutral_500),
                      const SizedBox(width: 8),
                      Text(
                        'Domain: $domain',
                        style: textStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.account_tree_outlined,
                          size: 20, color: AppColors.neutral_500),
                      const SizedBox(width: 8),
                      Text(
                        'Department: $department',
                        style: textStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          size: 20, color: AppColors.neutral_500),
                      const SizedBox(width: 8),
                      Text(
                        'Estimated hours: $estimatedHours',
                        style: textStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
