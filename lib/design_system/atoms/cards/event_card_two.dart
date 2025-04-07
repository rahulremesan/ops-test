import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/icon_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/link_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/titledesc_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class EventCardTwo extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final List<IconCardData> iconCards;
  final List<LinkCardData> linkCards;
  final VoidCallback onEnrollPressed;

  const EventCardTwo({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.iconCards,
    required this.linkCards,
    required this.onEnrollPressed,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final textStyle = TextStyle(
      fontFamily: customTypography.button1Regular.fontFamily,
      fontSize: customTypography.button1Regular.fontSize,
      fontWeight: customTypography.button1Regular.fontWeight,
      height: customTypography.button1Regular.height,
      color: AppColors.neutral_400,
      letterSpacing: 0,
    );

    const iconColor = AppColors.lilacGray;

    return LayoutBuilder(builder: (context, constraints) {
      final isDesktop = constraints.maxWidth >= 830;

      return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isDesktop)
                _buildDesktopLayout(customTypography, textStyle, iconColor)
              else
                _buildMobileLayout(customTypography, textStyle, iconColor),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: TitleDescCard(
                  title: "Description",
                  description: description,
                  variant: "primary",
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(width: 1, color: AppColors.platinum),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Links",
                        style: TextStyle(
                          fontFamily: customTypography.body1Medium.fontFamily,
                          fontSize: customTypography.body1Medium.fontSize,
                          fontWeight: customTypography.body1Medium.fontWeight,
                          height: customTypography.body1Medium.height,
                          color: AppColors.neutral_500,
                          letterSpacing: 0,
                        ),
                      ),
                      ...linkCards.map((linkData) => Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: LinkCard(
                              iconColor: AppColors.nickel,
                              textStyle: textStyle,
                              text: linkData.text,
                              url: linkData.url,
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  Widget _buildDesktopLayout(
    CustomTypography customTypography,
    TextStyle textStyle,
    Color iconColor,
  ) {
    return SizedBox(
      height: 257,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  height: constraints.maxHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AspectRatio(
                      aspectRatio: 381 / 257,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _defaultImageIcon();
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: customTypography.h5Medium.fontSize,
                        fontWeight: customTypography.h5Medium.fontWeight,
                        fontFamily: customTypography.h5Medium.fontFamily,
                        letterSpacing: 0,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...iconCards.map((iconData) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: IconCard(
                            icon: iconData.icon,
                            text: iconData.text,
                            iconColor: iconColor,
                            iconSize: 15,
                            textStyle: textStyle,
                          ),
                        )),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: PrimaryButton(
                    buttonText: "Enroll",
                    onPressed: onEnrollPressed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(
    CustomTypography customTypography,
    TextStyle textStyle,
    Color iconColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
            aspectRatio: 381 / 257,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return _defaultImageIcon();
              },
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: TextStyle(
            fontSize: customTypography.h5Medium.fontSize,
            fontWeight: customTypography.h5Medium.fontWeight,
            fontFamily: customTypography.h5Medium.fontFamily,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 16),
        ...iconCards.map((iconData) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: IconCard(
                icon: iconData.icon,
                text: iconData.text,
                iconColor: iconColor,
                iconSize: 15,
                textStyle: textStyle,
              ),
            )),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            buttonText: "Enroll",
            onPressed: onEnrollPressed,
          ),
        ),
      ],
    );
  }

  Widget _defaultImageIcon() {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.grey,
      child: const Icon(
        Icons.image,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}

class IconCardData {
  final IconData icon;
  final String text;

  IconCardData({required this.icon, required this.text});
}

class LinkCardData {
  final String text;
  final String url;

  LinkCardData({required this.text, required this.url});
}
