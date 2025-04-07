import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

final labelTextProvider =
    StateProvider.family<String, String>((ref, labelText) => labelText);

class PrimaryTextAreaFieldFixed extends StatelessWidget {
  final String labelText;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const PrimaryTextAreaFieldFixed({super.key, required this.labelText, this.initialValue, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        labelTextProvider(labelText).overrideWith((ref) => labelText)
      ],
      child: _PrimaryTextAreaFieldFixedContent(
        labelText: labelText,
        onChanged: onChanged,
        initialValue: initialValue
      ),
    );
  }
}

class _PrimaryTextAreaFieldFixedContent extends ConsumerWidget {
  final String labelText;
  final String? initialValue;
  final ValueChanged<String>? onChanged;


  const _PrimaryTextAreaFieldFixedContent({this.onChanged, this.initialValue, required this.labelText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return TextFormField(
      maxLines: 5,
      minLines: 5,
      initialValue: initialValue,
      keyboardType: TextInputType.multiline,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
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
