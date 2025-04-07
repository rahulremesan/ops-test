import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

final labelTextProvider =
    StateProvider.family<String, String>((ref, labelText) => labelText);

class PrimaryTextAreaField extends StatelessWidget {
  final String labelText;

  const PrimaryTextAreaField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        labelTextProvider(labelText).overrideWith((ref) => labelText)
      ],
      child: _PrimaryTextAreaFieldContent(
        labelText: labelText,
      ),
    );
  }
}

class _PrimaryTextAreaFieldContent extends ConsumerWidget {
  final String labelText;

  const _PrimaryTextAreaFieldContent({required this.labelText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 300.0),
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontFamily: customTypography.body2Regular.fontFamily,
            fontSize: customTypography.body2Regular.fontSize,
            letterSpacing: 0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.blackWash, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.blackWash, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.brandBlue, width: 2),
          ),
          filled: false,
        ),
      ),
    );
  }
}
