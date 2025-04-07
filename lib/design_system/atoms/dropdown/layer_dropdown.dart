import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class LayerDropdown extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String> onChanged;
  final List<String> options;

  const LayerDropdown({
    super.key,
    required this.selectedValue,
    required this.onChanged,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return DropdownButton<String>(
      value: selectedValue,
      elevation: 16,
      style: TextStyle(
          fontFamily: customTypography.body1Medium.fontFamily,
          fontSize: customTypography.body1Medium.fontSize,
          fontWeight: customTypography.body1Medium.fontWeight,
          height: customTypography.body1Medium.height,
          color: AppColors.primary_900),
      underline: const SizedBox.shrink(),
      onChanged: (String? newValue) {
        if (newValue != null) {
          onChanged(newValue);
        }
      },
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
