import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Icon icon;

  const CustomIconButton(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 64,
      decoration: BoxDecoration(
        color: AppColors.brandBlueSecondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.dreamyCloud,
        ),
      ),
      child: IconButton(
        icon: icon,
        iconSize: 24,
        color: AppColors.lacqueredLiquorice,
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}
