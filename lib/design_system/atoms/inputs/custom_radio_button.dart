import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:styria_flutter_web/design_system/atoms/carousel/login_carousel.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/custom_radio_button.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_input_field.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class CustomRadioButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onChanged;

  const CustomRadioButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: customTypography.body1Bold,
            ),
          ],
        ),
      ),
    );
  }
}
