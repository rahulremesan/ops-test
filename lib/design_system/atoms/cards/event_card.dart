import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/icon_card.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/tag.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class EventCard extends ConsumerWidget {
  final List<Map<String, dynamic>> iconData;
  final String imageUrl, cardTitle;
  final VoidCallback onPressOne, onPressTwo;
  final String tagText;
  final Color tagColor;

  const EventCard({
    super.key,
    required this.imageUrl,
    required this.iconData,
    required this.cardTitle,
    required this.onPressOne,
    required this.onPressTwo,
    required this.tagText,
    required this.tagColor,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    // Use provider instead of local variable
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isMobile = MediaQuery.of(context).size.width <= 600;
      ref.read(isMobileProvider.notifier).state = isMobile;
    });

    // Watch the mobile state
    final isMobile = ref.watch(isMobileProvider);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 405,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: SizedBox(
                        height: 180,
                        child: Image.network(
                          imageUrl,
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
              Positioned(
                top: 16,
                right: 16,
                child: Tag(
                  text: tagText,
                  color: tagColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(isMobile ? 8 : 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    cardTitle,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: customTypography.body1Bold.fontFamily,
                      fontSize: customTypography.body1Bold.fontSize,
                      fontWeight: customTypography.body1Bold.fontWeight,
                      height: customTypography.body1Bold.height,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                ...iconData.map((data) {
                  return Column(
                    children: [
                      IconCard(
                        iconSize: 14,
                        icon: data['icon'],
                        text: data['text'],
                        iconColor: AppColors.nickel,
                        textStyle: TextStyle(
                          fontFamily:
                              customTypography.button1Regular.fontFamily,
                          fontSize: customTypography.button1Regular.fontSize,
                          fontWeight:
                              customTypography.button1Regular.fontWeight,
                          color: Colors.black,
                          letterSpacing: 0,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  );
                }),
                Padding(
                  padding: EdgeInsets.only(bottom: isMobile ? 8 : 16, top: 8),
                  child:
                      Divider(height: 1, thickness: 1, color: Colors.grey[300]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PrimaryButton(
                      buttonText: "Yes",
                      onPressed: onPressOne,
                    ),
                    TertiaryButton(
                        buttonText: "More Info", onPressed: onPressTwo),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _defaultImageIcon() {
    return Container(
      width: double.infinity,
      height: 180,
      color: Colors.grey,
      child: const Icon(
        Icons.image,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
