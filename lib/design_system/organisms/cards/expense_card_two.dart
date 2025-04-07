import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/status_button.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/icon_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/titledesc_card.dart';
import 'package:styria_flutter_web/design_system/atoms/file_picker/file_picker.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ExpenseCardTwo extends StatelessWidget {
  final List<Map<String, dynamic>> iconData;
  final VoidCallback onPressed, onPressedTwo;

  final String buttonTextOne,
      buttonTextTwo,
      projectStatus,
      projectTitle,
      imageUrl,
      descTitle,
      description,
      attachmentCount;

  const ExpenseCardTwo({
    super.key,
    required this.iconData,
    required this.projectStatus,
    required this.projectTitle,
    required this.buttonTextOne,
    required this.buttonTextTwo,
    required this.imageUrl,
    required this.onPressed,
    required this.onPressedTwo,
    required this.descTitle,
    required this.description,
    required this.attachmentCount,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        width: 830,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
              Wrap(
                spacing: 16.0,
                runSpacing: 8.0,
                children: iconData.map((data) {
                  return IconCard(
                    icon: data['icon'],
                    text: data['text'],
                    iconColor: AppColors.nickel,
                    textStyle: TextStyle(
                      fontFamily: customTypography.body2Regular.fontFamily,
                      fontSize: customTypography.body2Regular.fontSize,
                      fontWeight: customTypography.body2Regular.fontWeight,
                      letterSpacing: 0,
                      color: Colors.black,
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: TitleDescCard(
                    title: descTitle,
                    description: description,
                    variant: "secondary",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: AppColors.platinum)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "Attachment ($attachmentCount)",
                              style: TextStyle(
                                fontFamily:
                                    customTypography.body2Medium.fontFamily,
                                fontSize: customTypography.body2Medium.fontSize,
                                fontWeight:
                                    customTypography.body2Medium.fontWeight,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            child: FilePickerWidget(
                              allowedExtensions: [
                                'png',
                                'svg',
                                'jpeg',
                                'jpg',
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child:
                    Divider(height: 1, thickness: 1, color: Colors.grey[300]),
              ),
              screenWidth > 500
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TertiaryButton(
                          buttonText: buttonTextOne,
                          onPressed: onPressed,
                          icon: Icons.edit,
                          iconSize: 18,
                        ),
                        const SizedBox(width: 16),
                        TertiaryButton(
                          buttonText: buttonTextTwo,
                          onPressed: onPressedTwo,
                          icon: Icons.notifications_active,
                          iconSize: 18,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: TertiaryButton(
                            buttonText: buttonTextOne,
                            onPressed: onPressed,
                            icon: Icons.edit,
                            iconSize: 18,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: TertiaryButton(
                            buttonText: buttonTextTwo,
                            onPressed: onPressedTwo,
                            icon: Icons.notifications_active,
                            iconSize: 18,
                          ),
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
