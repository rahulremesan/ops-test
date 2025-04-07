import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class NewsDetailsCard extends StatelessWidget {
  final String? cardTitle;
  final String? imageUrl;
  final String? timeData;
  final VoidCallback? onPress;
  final String? description;

  const NewsDetailsCard(
      {super.key,
      required this.imageUrl,
      required this.timeData,
      required this.onPress,
      required this.description,
      this.cardTitle});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 830 / 300,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Image.network(
                        imageUrl!,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return _defaultImageIcon();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardTitle!,
                    style: TextStyle(
                      fontSize: customTypography.h3Medium.fontSize,
                      fontWeight: customTypography.h3Medium.fontWeight,
                      fontFamily: customTypography.h3Medium.fontFamily,
                      letterSpacing: 0,
                      color: AppColors.neutral_500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "2 Hours Ago",
                            style: TextStyle(
                              fontSize:
                                  customTypography.caption1Regular.fontSize,
                              fontWeight:
                                  customTypography.caption1Regular.fontWeight,
                              fontFamily:
                                  customTypography.caption1Regular.fontFamily,
                              color: AppColors.neutral_400,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        TertiaryButton(
                          buttonText: "Share",
                          onPressed: () {},
                          icon: Icons.share,
                          iconSize: 16,
                          variant3: true,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: Colors.grey[300],
                    ),
                  ),
                  Text(
                    description!,
                    style: TextStyle(
                      fontSize: customTypography.body2Regular.fontSize,
                      fontWeight: customTypography.body2Regular.fontWeight,
                      fontFamily: customTypography.body2Regular.fontFamily,
                      color: AppColors.neutral_400,
                      letterSpacing: 0,
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

  Widget _defaultImageIcon() {
    return Container(
      width: double.infinity,
      height: 300,
      color: Colors.grey,
      child: const Icon(
        Icons.image,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
