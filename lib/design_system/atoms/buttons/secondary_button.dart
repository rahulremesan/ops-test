import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

final buttonTextProvider =
    StateProvider.family<String, String>((ref, buttonText) => buttonText);

final class SecondaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isSecondary;

  const SecondaryButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.icon,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        buttonTextProvider(buttonText).overrideWith((ref) => buttonText)
      ],
      child: _SecondaryButtonContent(
        buttonText: buttonText,
        onPressed: onPressed,
        icon: icon,
        isSecondary: isSecondary,
      ),
    );
  }
}

class _SecondaryButtonContent extends ConsumerWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isSecondary;

  const _SecondaryButtonContent({
    required this.buttonText,
    required this.onPressed,
    this.icon,
    this.isSecondary = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.transparent;
            } else if (states.contains(WidgetState.hovered)) {
              return AppColors.brandBlue;
            } else if (states.contains(WidgetState.focused)) {
              return AppColors.brandBlue;
            }
            return Colors.white;
          }),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: isSecondary
                  ? BorderRadius.circular(8)
                  : BorderRadius.circular(8),
              side: BorderSide(
                color: isSecondary ? AppColors.platinum : AppColors.brandBlue,
              ),
            ),
          ),
          overlayColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            return Colors.transparent;
          }),
          foregroundColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered) ||
                states.contains(WidgetState.focused)) {
              return Colors.white;
            }
            return AppColors.brandBlue;
          }),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 16,
                color: AppColors.brandBlue,
              ),
            if (icon != null) const SizedBox(width: 8),
            Text(
              buttonText,
              style: TextStyle(
                fontFamily: isSecondary
                    ? customTypography.button1Regular.fontFamily
                    : isSecondary
                        ? customTypography.button1Regular.fontFamily
                        : customTypography.button1Medium.fontFamily,
                fontSize: isSecondary
                    ? customTypography.button1Regular.fontSize
                    : isSecondary
                        ? customTypography.button1Regular.fontSize
                        : customTypography.button1Medium.fontSize,
                fontWeight: isSecondary
                    ? customTypography.button1Regular.fontWeight
                    : customTypography.button1Medium.fontWeight,
                // color: AppColors.primary_600,
                letterSpacing: 0,
              ),
            ),
          ],
        ));
  }
}
