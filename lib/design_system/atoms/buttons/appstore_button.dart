import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class AppstoreButton extends ConsumerWidget {
  final VoidCallback onTap;
  final String iconPath;
  final String iconName;

  const AppstoreButton({
    super.key,
    required this.onTap,
    required this.iconPath,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final isMobile = ref.watch(isMobileProvider);

    return SizedBox(
      width: isMobile ? double.infinity : null,
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black, // Text color (black)
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColors.platinum, width: 1),
          ),
          backgroundColor: Colors.transparent, // No background initially
        ),
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 4),
              Text(
                iconName,
                style: TextStyle(
                  fontFamily: customTypography.body3Medium.fontFamily,
                  fontSize: customTypography.body3Medium.fontSize,
                  fontWeight: customTypography.body3Medium.fontWeight,
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
