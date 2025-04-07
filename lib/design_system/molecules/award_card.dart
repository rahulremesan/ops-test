import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class AwardCard extends StatelessWidget {
  final String extraImageUrl,
      title,
      profileUrl,
      profileName,
      description,
      awardedBy,
      date;

  const AwardCard({
    super.key,
    required this.extraImageUrl,
    required this.profileUrl,
    required this.profileName,
    required this.awardedBy,
    required this.date,
    required this.description,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 798 / 126,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/Banner.png',
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      extraImageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return _defaultBannerIcon();
                      },
                    ),
                    Positioned(
                      left: 16,
                      top: 0,
                      bottom: 0,
                      right: 16,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double fontSize = screenWidth < 500
                              ? 14
                              : screenWidth > 900
                                  ? 28
                                  : 18;
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              title,
                              style: TextStyle(
                                fontFamily: customTypography.h4Bold.fontFamily,
                                fontSize: fontSize,
                                fontWeight: customTypography.h4Bold.fontWeight,
                                height: customTypography.h4Bold.height,
                                color: Colors.white,
                                letterSpacing: 0,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          description,
                          style: TextStyle(
                            fontFamily: customTypography.body2Medium.fontFamily,
                            fontSize: customTypography.body2Medium.fontSize,
                            fontWeight: customTypography.body2Medium.fontWeight,
                            height: customTypography.body2Medium.height,
                            letterSpacing: 0,
                            color: AppColors.neutral_500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          date,
                          style: TextStyle(
                            fontFamily:
                                customTypography.body3Regular.fontFamily,
                            fontSize: customTypography.body3Regular.fontSize,
                            fontWeight:
                                customTypography.body3Regular.fontWeight,
                            height: customTypography.body3Regular.height,
                            color: AppColors.neutral_500,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            description,
                            style: TextStyle(
                              fontFamily:
                                  customTypography.body2Medium.fontFamily,
                              fontSize: customTypography.body2Medium.fontSize,
                              fontWeight:
                                  customTypography.body2Medium.fontWeight,
                              height: customTypography.body2Medium.height,
                              color: AppColors.neutral_500,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          date,
                          style: TextStyle(
                            fontFamily:
                                customTypography.body3Regular.fontFamily,
                            fontSize: customTypography.body3Regular.fontSize,
                            fontWeight:
                                customTypography.body3Regular.fontWeight,
                            height: customTypography.body3Regular.height,
                            color: AppColors.nickel,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                profileUrl,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return _defaultProfileIcon();
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                profileName,
                                style: TextStyle(
                                  fontFamily:
                                      customTypography.body3Medium.fontFamily,
                                  fontSize:
                                      customTypography.body3Medium.fontSize,
                                  fontWeight:
                                      customTypography.body3Medium.fontWeight,
                                  height: customTypography.body3Medium.height,
                                  color: AppColors.neutral_500,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Awarded by $awardedBy",
                          style: TextStyle(
                            fontFamily:
                                customTypography.body3Regular.fontFamily,
                            fontSize: customTypography.body3Regular.fontSize,
                            fontWeight:
                                customTypography.body3Regular.fontWeight,
                            height: customTypography.body3Regular.height,
                            color: AppColors.neutral_500,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipOval(
                              child: Image.network(
                                profileUrl,
                                width: 40.0,
                                height: 40.0,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return _defaultProfileIcon();
                                },
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              profileName,
                              style: TextStyle(
                                fontFamily:
                                    customTypography.body3Medium.fontFamily,
                                fontSize: customTypography.body3Medium.fontSize,
                                fontWeight:
                                    customTypography.body3Medium.fontWeight,
                                height: customTypography.body3Medium.height,
                                color: AppColors.neutral_500,
                                letterSpacing: 0,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Awarded by $awardedBy",
                          style: TextStyle(
                            fontFamily:
                                customTypography.body3Regular.fontFamily,
                            fontSize: customTypography.body3Regular.fontSize,
                            fontWeight:
                                customTypography.body3Regular.fontWeight,
                            height: customTypography.body3Regular.height,
                            color: AppColors.neutral_500,
                            letterSpacing: 0,
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _defaultBannerIcon() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.grey,
      ),
      child: const Center(
        child: Icon(
          Icons.image,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }

  Widget _defaultProfileIcon() {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.person,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
