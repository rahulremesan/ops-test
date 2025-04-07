import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/icon_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class FeedsEventDetailsCard extends StatelessWidget {
  final String heading;
  final String? description;
  final String? coordinator;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime date;
  final String buttonText;
  final bool isPrimary;

  const FeedsEventDetailsCard({
    super.key,
    required this.heading,
    this.description,
    required this.date,
    this.coordinator,
    required this.startTime,
    required this.endTime,
    required this.buttonText,
    required this.isPrimary,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final screenWidth = MediaQuery.of(context).size.width;

    final formattedStartTime = DateFormat('hh:mm a').format(startTime);
    final formattedEndTime = DateFormat('hh:mm a').format(endTime);
    final formattedDate = DateFormat('dd, MMM yyyy').format(date);

    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding:
            isPrimary ? const EdgeInsets.all(24) : const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: isPrimary ? 1 : 2,
              heading,
              style: isPrimary
                  ? TextStyle(
                      fontFamily: customTypography.h5Medium.fontFamily,
                      fontSize: customTypography.h5Medium.fontSize,
                      fontWeight: customTypography.h5Medium.fontWeight,
                      letterSpacing: 0,
                    )
                  : TextStyle(
                      fontFamily: customTypography.body1Regular.fontFamily,
                      fontSize: customTypography.body1Regular.fontSize,
                      fontWeight: customTypography.body1Regular.fontWeight,
                      letterSpacing: 0,
                    ),
            ),
            if (description != null && description!.isNotEmpty)
              Text(
                description!,
                style: TextStyle(
                  fontFamily: customTypography.body2Regular.fontFamily,
                  fontSize: customTypography.body2Regular.fontSize,
                  fontWeight: customTypography.body2Regular.fontWeight,
                  letterSpacing: 0,
                ),
              ),
            SizedBox(
              height: isPrimary ? 24 : 16,
            ),
            screenWidth > 540
                ? Row(
                    children: [
                      if (isPrimary)
                        IconCard(
                          icon: Icons.person_outline,
                          text: coordinator!,
                          iconSize: 24,
                          iconColor: AppColors.brandBlue,
                          space: 3,
                          textStyle: TextStyle(
                            fontFamily:
                                customTypography.body2Regular.fontFamily,
                            fontSize: customTypography.body2Regular.fontSize,
                            fontWeight:
                                customTypography.body2Regular.fontWeight,
                            letterSpacing: 0,
                          ),
                        ),
                      if (isPrimary)
                        const SizedBox(
                          width: 40,
                        ),
                      IconCard(
                        icon: Icons.query_builder,
                        text: '$formattedStartTime - $formattedEndTime',
                        iconSize: 24,
                        iconColor: AppColors.brandBlue,
                        space: 3,
                        textStyle: TextStyle(
                          fontFamily: customTypography.body2Regular.fontFamily,
                          fontSize: customTypography.body2Regular.fontSize,
                          fontWeight: customTypography.body2Regular.fontWeight,
                          letterSpacing: 0,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      IconCard(
                        icon: Icons.calendar_today_outlined,
                        text: formattedDate,
                        iconColor: AppColors.brandBlue,
                        space: 3,
                        iconSize: 24,
                        textStyle: TextStyle(
                          fontFamily: customTypography.body2Regular.fontFamily,
                          fontSize: customTypography.body2Regular.fontSize,
                          fontWeight: customTypography.body2Regular.fontWeight,
                          letterSpacing: 0,
                        ),
                      )
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isPrimary)
                        IconCard(
                          icon: Icons.person_outline,
                          text: coordinator!,
                          iconSize: 24,
                          iconColor: AppColors.brandBlue,
                          space: 3,
                          textStyle: TextStyle(
                            fontFamily:
                                customTypography.body2Regular.fontFamily,
                            fontSize: customTypography.body2Regular.fontSize,
                            fontWeight:
                                customTypography.body2Regular.fontWeight,
                            letterSpacing: 0,
                          ),
                        ),
                      if (isPrimary)
                        const SizedBox(
                          height: 10,
                        ),
                      IconCard(
                        icon: Icons.query_builder,
                        text: '$formattedStartTime - $formattedEndTime',
                        iconSize: 24,
                        iconColor: AppColors.brandBlue,
                        space: 3,
                        textStyle: TextStyle(
                          fontFamily: customTypography.body2Regular.fontFamily,
                          fontSize: customTypography.body2Regular.fontSize,
                          fontWeight: customTypography.body2Regular.fontWeight,
                          letterSpacing: 0,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      IconCard(
                        icon: Icons.calendar_today_outlined,
                        text: formattedDate,
                        iconSize: 24,
                        iconColor: AppColors.brandBlue,
                        space: 3,
                        textStyle: TextStyle(
                          fontFamily: customTypography.body2Regular.fontFamily,
                          fontSize: customTypography.body2Regular.fontSize,
                          fontWeight: customTypography.body2Regular.fontWeight,
                          letterSpacing: 0,
                        ),
                      )
                    ],
                  ),
            SizedBox(
              height: isPrimary ? 24 : 32,
            ),
            PrimaryButton(
              buttonText: buttonText,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
