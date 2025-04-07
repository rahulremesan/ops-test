import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class TertiaryInputField extends StatelessWidget {
  final String label;
  final String message;
  final String initialValue;
  final Function(String)? onChanged;

  const TertiaryInputField({
    super.key,
    required this.label,
    required this.message,
    required this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return TextFormField(
      style: TextStyle(
        fontFamily: customTypography.body2Medium.fontFamily,
        fontSize: customTypography.body2Medium.fontSize,
        fontWeight: customTypography.body2Medium.fontWeight,
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontFamily: customTypography.body2Regular.fontFamily,
          fontSize: customTypography.body2Regular.fontSize,
          fontWeight: customTypography.body2Regular.fontWeight,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      initialValue: initialValue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return message;
        }
        return null;
      },
      onChanged: onChanged,
    );
  }
}
