import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/status_button.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/icon_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ExpenseCard extends StatelessWidget {
  final List<Map<String, dynamic>> iconData;
  final VoidCallback onPressed;
  final String buttonText, projectStatus, projectTitle;
  const ExpenseCard({
    super.key,
    required this.iconData,
    required this.onPressed,
    required this.buttonText,
    required this.projectStatus,
    required this.projectTitle,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Container(
      width: 405,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StatusButton(
                  status: projectStatus,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    projectTitle,
                    style: TextStyle(
                      fontFamily: customTypography.body1Medium.fontFamily,
                      fontSize: customTypography.body1Medium.fontSize,
                      fontWeight: customTypography.body1Medium.fontWeight,
                      letterSpacing: 0,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                ...iconData.map((data) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: IconCard(
                          icon: data['icon'],
                          text: data['text'],
                          iconColor: AppColors.nickel,
                          textStyle: TextStyle(
                            fontFamily:
                                customTypography.body2Regular.fontFamily,
                            fontSize: customTypography.body2Regular.fontSize,
                            fontWeight:
                                customTypography.body2Regular.fontWeight,
                            letterSpacing: 0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  );
                }),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: Colors.grey[300]),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TertiaryButton(
                buttonText: buttonText,
                onPressed: onPressed,
              ),
            ),
          )
        ],
      ),
    );
  }
}
