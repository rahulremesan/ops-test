import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class NewsSecondaryCard extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String content;
  final String time;
  final VoidCallback? onTap;

  const NewsSecondaryCard(
      {super.key,
      this.imageUrl,
      required this.title,
      required this.content,
      required this.time,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final screenWidth = MediaQuery.of(context).size.width;

    final isSmallScreen = screenWidth < 600;

    if (isSmallScreen) {
      return GestureDetector(
        onTap: onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 668 / 300,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        child: imageUrl != null
                            ? Image.network(
                                imageUrl!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                                  return _defaultImageIcon();
                                },
                              )
                            : _defaultImageIcon(),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize:
                                      customTypography.body1Medium.fontSize,
                                  fontWeight:
                                      customTypography.body1Medium.fontWeight,
                                  color: AppColors.neutral_500),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              content,
                              style: TextStyle(
                                  fontSize:
                                      customTypography.body3Regular.fontSize,
                                  fontWeight:
                                      customTypography.body3Regular.fontWeight,
                                  color: AppColors.neutral_400),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              time,
                              style: TextStyle(
                                  fontSize:
                                      customTypography.caption2Regular.fontSize,
                                  fontWeight: customTypography
                                      .caption2Regular.fontWeight,
                                  color: AppColors.neutral_400),
                            )
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: onTap,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              height: 164,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 197 / 163,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                      child: imageUrl != null
                          ? Image.network(
                              imageUrl!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                                return _defaultImageIcon();
                              },
                            )
                          : _defaultImageIcon(),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontFamily:
                                  customTypography.body1Medium.fontFamily,
                              fontSize: customTypography.body1Medium.fontSize,
                              fontWeight:
                                  customTypography.body1Medium.fontWeight,
                              color: AppColors.neutral_500,
                              letterSpacing: 0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            content,
                            style: TextStyle(
                              fontFamily:
                                  customTypography.body2Regular.fontFamily,
                              fontSize: customTypography.body2Regular.fontSize,
                              fontWeight:
                                  customTypography.body2Regular.fontWeight,
                              color: AppColors.neutral_400,
                              letterSpacing: 0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            time,
                            style: TextStyle(
                              fontFamily:
                                  customTypography.caption1Regular.fontFamily,
                              fontSize:
                                  customTypography.caption1Regular.fontSize,
                              fontWeight:
                                  customTypography.caption1Regular.fontWeight,
                              color: AppColors.neutral_300,
                              letterSpacing: 0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget _defaultImageIcon() {
    return Container(
      width: double.infinity,
      color: Colors.grey,
      child: const Icon(
        Icons.image,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
