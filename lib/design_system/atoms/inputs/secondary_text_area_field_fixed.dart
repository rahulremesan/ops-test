import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

final labelTextProvider =
    StateProvider.family<String, String>((ref, labelText) => labelText);

class SecondaryTextAreaFieldFixed extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const SecondaryTextAreaFieldFixed({
    super.key,
    required this.labelText,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        labelTextProvider(labelText).overrideWith((ref) => labelText)
      ],
      child: _SecondaryTextAreaFieldFixedContent(
        labelText: labelText,
        controller: controller,
        onChanged: onChanged,
      ),
    );
  }
}

class _SecondaryTextAreaFieldFixedContent extends ConsumerWidget {
  final String labelText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const _SecondaryTextAreaFieldFixedContent({
    required this.labelText,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return TextField(
      maxLines: 5,
      minLines: 5,
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.multiline,
      style: TextStyle(
        fontFamily: customTypography.body2Regular.fontFamily,
        fontSize: customTypography.body2Regular.fontSize,
        color: Colors.black87,
        letterSpacing: 0,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        alignLabelWithHint: true,
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
    );
  }
}
