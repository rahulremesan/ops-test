import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class SecondaryInputField extends StatelessWidget {
  final String? labelText;
  final String placeholder;
  final String? initialValue;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType keyboardType;

  const SecondaryInputField({
    super.key,
    this.labelText,
    required this.placeholder,
    this.controller,
    this.onChanged,
    this.obscureText = true,
    this.keyboardType = TextInputType.text,
    this.initialValue
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return TextFormField(
      maxLines: 1,
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      initialValue: initialValue,
      style: TextStyle(
        fontFamily: customTypography.body2Regular.fontFamily,
        fontSize: customTypography.body2Regular.fontSize,
        color: Colors.black87,
        letterSpacing: 0,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20.0),
        labelText: labelText,
        labelStyle: TextStyle(
          fontFamily: customTypography.body2Regular.fontFamily,
          fontSize: customTypography.body2Regular.fontSize,
          letterSpacing: 0,
        ),
        hintText: placeholder,
        hintStyle: TextStyle(
          fontFamily: customTypography.body3Regular.fontFamily,
          fontSize: customTypography.body3Regular.fontSize,
          color: AppColors.black06,
          letterSpacing: 0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.platinum, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.platinum, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.platinum, width: 2),
        ),
        filled: false,
      ),
    );
  }
}
