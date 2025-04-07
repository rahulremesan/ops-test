import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/feeds_profile_tag.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class FeedsEventCardHeader extends StatelessWidget {
  final String profileImage;
  final String name;
  final int lastSeen;
  final bool isPrimary;
  final String? channel;

  const FeedsEventCardHeader({
    super.key,
    required this.profileImage,
    required this.name,
    required this.lastSeen,
    required this.isPrimary,
    this.channel,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      height: isPrimary ? 98 : 77,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding:
            isPrimary ? const EdgeInsets.all(24) : const EdgeInsets.all(15),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FeedsProfileTag(
                profileImage: profileImage,
                name: name,
                lastSeen: lastSeen,
                isPrimary: isPrimary,
              ),
              if (isPrimary)
                Text(
                  channel!,
                  style: TextStyle(
                    fontFamily: customTypography.body2Medium.fontFamily,
                    fontSize: customTypography.body2Medium.fontSize,
                    fontWeight: customTypography.body2Medium.fontWeight,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
