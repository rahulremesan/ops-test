import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

final buttonTextProvider =
    StateProvider.family<String, String>((ref, buttonText) => buttonText);

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final IconData? icon;

  final bool? isSecondary;

  const PrimaryButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.icon,
    this.isSecondary,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        buttonTextProvider(buttonText).overrideWith((ref) => buttonText),
      ],
      child: _PrimaryButtonContent(
        buttonText: buttonText,
        onPressed: onPressed,
        icon: icon,
        isSecondary: isSecondary ?? false,
      ),
    );
  }
}

class _PrimaryButtonContent extends ConsumerWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final IconData? icon;

  final bool isSecondary;

  const _PrimaryButtonContent({
    required this.buttonText,
    required this.onPressed,
    this.icon,
    required this.isSecondary,
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
          if (isSecondary) {
            return Colors.white;
          }
          if (states.contains(WidgetState.disabled)) {
            return AppColors.brandBlue.withOpacity(0.5);
          } else if (states.contains(WidgetState.hovered) ||
              states.contains(WidgetState.focused)) {
            return Colors.indigo[900]!;
          }
          return AppColors.brandBlue;
        }),
        
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: isSecondary ? AppColors.platinum : Colors.transparent,
              width: 1.0,
            ),
          ),
        ),
        overlayColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          return isSecondary
              ? AppColors.brandBlue.withOpacity(0.2)
              : AppColors.brandBlue.withOpacity(0.2);
        }),
        foregroundColor: WidgetStateProperty.all<Color>(
          isSecondary ? AppColors.brandBlue : Colors.white,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Row(
                children: [
                  Icon(
                    icon,
                    size: 16,
                    color: isSecondary ? AppColors.neutral_500 : Colors.white,
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            Text(
              buttonText,
              style: TextStyle(
                fontFamily: customTypography.button1Medium.fontFamily,
                fontSize: customTypography.button1Medium.fontSize,
                color: isSecondary ? AppColors.neutral_500 : Colors.white,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
