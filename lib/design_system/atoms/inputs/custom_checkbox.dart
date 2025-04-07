import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class CustomCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: customTypography.body4Regular.fontFamily,
            fontSize: customTypography.body4Regular.fontSize,
            fontWeight: customTypography.body4Regular.fontWeight,
            color: AppColors.lacqueredLiquorice,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }
}
