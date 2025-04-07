import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ProjectDescriptionCard extends StatelessWidget {
  final String projectLogo;
  final String title;
  final String description;
  final IconData healthIcon;
  final Color iconColor;

  const ProjectDescriptionCard(
      {super.key,
      required this.projectLogo,
      required this.title,
      required this.description,
      required this.healthIcon,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: AppColors.neutralGray,
      width: 1254,
      height: 167,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Image.network(
                projectLogo,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  screenWidth < 600
                      ? Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontFamily: customTypography.h5Bold.fontFamily,
                                fontSize: customTypography.h5Bold.fontSize,
                                fontWeight: customTypography.h5Bold.fontWeight,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Project Health:',
                                  style: TextStyle(
                                    fontFamily: customTypography
                                        .body3Regular.fontFamily,
                                    fontSize:
                                        customTypography.body3Regular.fontSize,
                                    fontWeight: customTypography
                                        .body3Regular.fontWeight,
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  healthIcon,
                                  size: 18,
                                  color: iconColor,
                                )
                              ],
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontFamily: customTypography.h5Bold.fontFamily,
                                fontSize: customTypography.h5Bold.fontSize,
                                fontWeight: customTypography.h5Bold.fontWeight,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Project Health:',
                                  style: TextStyle(
                                    fontFamily: customTypography
                                        .body3Regular.fontFamily,
                                    fontSize:
                                        customTypography.body3Regular.fontSize,
                                    fontWeight: customTypography
                                        .body3Regular.fontWeight,
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  healthIcon,
                                  size: 18,
                                  color: iconColor,
                                )
                              ],
                            ),
                          ],
                        ),
                  const SizedBox(height: 10),
                  screenWidth < 600
                      ? Text(
                          description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily:
                                customTypography.body3Regular.fontFamily,
                            fontSize: customTypography.body3Regular.fontSize,
                            fontWeight:
                                customTypography.body3Regular.fontWeight,
                          ),
                        )
                      : Text(
                          description,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily:
                                customTypography.body3Regular.fontFamily,
                            fontSize: customTypography.body3Regular.fontSize,
                            fontWeight:
                                customTypography.body3Regular.fontWeight,
                          ),
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
