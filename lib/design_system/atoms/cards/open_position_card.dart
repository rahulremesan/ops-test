import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class OpenPositionCard extends StatelessWidget {
  final String jobTitle;
  final String experience;
  final String location;
  final String jobType;
  final bool isUrgent;
  final String postedTime;

  const OpenPositionCard({
    super.key,
    required this.jobTitle,
    required this.experience,
    required this.location,
    required this.jobType,
    this.isUrgent = false,
    required this.postedTime,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: AppColors.platinum,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            jobTitle,
                            style: TextStyle(
                              fontFamily:
                                  customTypography.body1Medium.fontFamily,
                              fontSize: customTypography.body1Medium.fontSize,
                              fontWeight:
                                  customTypography.body1Medium.fontWeight,
                              color: AppColors.neutral_500,
                              letterSpacing: 0,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isUrgent)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.outrageousOrange,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Urgent',
                                style: TextStyle(
                                  fontFamily: customTypography
                                      .caption2Medium.fontFamily,
                                  fontSize:
                                      customTypography.caption2Medium.fontSize,
                                  fontWeight: customTypography
                                      .caption2Medium.fontWeight,
                                  color: Colors.white,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  Text(
                    postedTime,
                    style: TextStyle(
                      fontFamily: customTypography.caption1Regular.fontFamily,
                      fontSize: customTypography.caption1Regular.fontSize,
                      fontWeight: customTypography.caption1Regular.fontWeight,
                      color: AppColors.neutral_400,
                      letterSpacing: 0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text.rich(
                TextSpan(
                  text: 'Experience: ',
                  style: TextStyle(
                    fontFamily: customTypography.body3Regular.fontFamily,
                    fontSize: customTypography.body3Regular.fontSize,
                    fontWeight: customTypography.body3Regular.fontWeight,
                    letterSpacing: 0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: experience,
                      style: TextStyle(
                        fontFamily: customTypography.button1Medium.fontFamily,
                        fontSize: customTypography.button1Medium.fontSize,
                        fontWeight: customTypography.button1Medium.fontWeight,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  text: 'Location: ',
                  style: TextStyle(
                    fontFamily: customTypography.body3Regular.fontFamily,
                    fontSize: customTypography.body3Regular.fontSize,
                    fontWeight: customTypography.body3Regular.fontWeight,
                    letterSpacing: 0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: location,
                      style: TextStyle(
                        fontFamily: customTypography.button1Medium.fontFamily,
                        fontSize: customTypography.button1Medium.fontSize,
                        fontWeight: customTypography.button1Medium.fontWeight,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                jobType,
                style: TextStyle(
                  fontFamily: customTypography.button1Medium.fontFamily,
                  fontSize: customTypography.button1Medium.fontSize,
                  fontWeight: customTypography.button1Medium.fontWeight,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
