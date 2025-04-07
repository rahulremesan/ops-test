import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ProjectUpdateTextField extends StatelessWidget {
  final String title;
  final DateTime? date;
  final String? description;
  final bool withDescription;

  const ProjectUpdateTextField({
    super.key,
    required this.title,
    this.date,
    this.description,
    required this.withDescription,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final formattedDate = DateFormat('dd/MM/yyyy').format(date!);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.platinum,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
          right: 16,
          left: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: withDescription
                        ? TextStyle(
                            fontFamily: customTypography.body2Medium.fontFamily,
                            fontSize: customTypography.body2Medium.fontSize,
                            fontWeight: customTypography.body2Medium.fontWeight,
                            color: Colors.black,
                            letterSpacing: 0,
                          )
                        : TextStyle(
                            fontFamily:
                                customTypography.body3Regular.fontFamily,
                            fontSize: customTypography.body3Regular.fontSize,
                            fontWeight:
                                customTypography.body3Regular.fontWeight,
                            color: Colors.black,
                            letterSpacing: 0,
                          ),
                  ),
                  if (description != null && description!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        description!,
                        style: TextStyle(
                          fontFamily: customTypography.body3Regular.fontFamily,
                          fontSize: customTypography.body3Regular.fontSize,
                          fontWeight: customTypography.body3Regular.fontWeight,
                          color: AppColors.neutral_400,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Flexible(
              child: Text(formattedDate,
                  style: withDescription
                      ? TextStyle(
                          fontFamily:
                              customTypography.caption1Regular.fontFamily,
                          fontSize: customTypography.caption1Regular.fontSize,
                          fontWeight:
                              customTypography.caption1Regular.fontWeight,
                          color: AppColors.neutral_400,
                          letterSpacing: 0,
                        )
                      : TextStyle(
                          fontFamily: customTypography.body3Regular.fontFamily,
                          fontSize: customTypography.body3Regular.fontSize,
                          fontWeight: customTypography.body3Regular.fontWeight,
                          color: AppColors.neutral_400,
                          letterSpacing: 0,
                        )),
            ),
          ],
        ),
      ),
    );
  }
}
