import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

final buttonTextProvider =
    StateProvider.family<String, String>((ref, buttonText) => buttonText);

class TertiaryButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool? variant2;
  final double? iconSize;
  final bool? variant3;

  const TertiaryButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.icon,
    this.variant2,
    this.iconSize,
    this.variant3,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        buttonTextProvider(buttonText).overrideWith((ref) => buttonText)
      ],
      child: _TertiaryButtonContent(
        buttonText: buttonText,
        onPressed: onPressed,
        icon: icon,
        variant2: variant2,
        iconSize: iconSize,
        variant3: variant3,
      ),
    );
  }
}

class _TertiaryButtonContent extends ConsumerWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool? variant2;
  final double? iconSize;
  final bool? variant3;

  const _TertiaryButtonContent({
    required this.buttonText,
    required this.onPressed,
    this.icon,
    this.variant2,
    this.iconSize,
    this.variant3,
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
            return Colors.transparent;
          } else if (states.contains(WidgetState.focused)) {
            return Colors.transparent;
          }
          return Colors.transparent;
        }),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: variant3 == true
                ? BorderSide.none
                : const BorderSide(
                    color: AppColors.dreamyCloud,
                  ),
          ),
        ),
        overlayColor:
            WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
          return Colors.transparent;
        }),
        foregroundColor:
            WidgetStateProperty.all<Color>(AppColors.brandBlueSecondary),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: (variant2 == true) ? AppColors.nickel : Colors.black,
                size: iconSize,
              ),
            if (icon != null) const SizedBox(width: 8),
            Flexible(
              child: Text(
                overflow: TextOverflow.ellipsis,
                buttonText,
                style: TextStyle(
                  fontFamily: (variant3 == true)
                      ? customTypography.caption1Medium.fontFamily
                      : customTypography.button1Medium.fontFamily,
                  fontSize: (variant3 == true)
                      ? customTypography.caption1Medium.fontSize
                      : customTypography.button1Medium.fontSize,
                  fontWeight: (variant3 == true)
                      ? customTypography.caption1Medium.fontWeight
                      : customTypography.button1Medium.fontWeight,
                  letterSpacing: 0,
                  color: (variant2 == true) ? AppColors.nickel : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
