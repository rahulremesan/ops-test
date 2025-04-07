import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class LoginWithButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String variant;

  const LoginWithButton({
    super.key,
    required this.onPressed,
    required this.variant,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    // Determine asset and text based on the variant
    String assetPath;
    String buttonText;
    switch (variant.toLowerCase()) {
      case 'microsoft':
        assetPath = 'assets/logo/microsoft.svg';
        buttonText = 'Sign in with Microsoft';
        break;
      case 'google':
      default:
        assetPath = 'assets/logo/google.svg';
        buttonText = 'Sign in with Google';
        break;
    }

    return SizedBox(
      width: 540,
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.lacqueredLiquorice,
          shape: const RoundedRectangleBorder(
            side:  BorderSide(color: AppColors.dreamyCloud, width: 1),
            borderRadius: BorderRadius.zero,
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(assetPath),
            const SizedBox(width: 16),
            Text(
              buttonText,
              style: TextStyle(
                fontFamily: customTypography.body4Regular.fontFamily,
                fontSize: customTypography.body4Regular.fontSize,
                fontWeight: customTypography.body4Regular.fontWeight,
                color: AppColors.lacqueredLiquorice,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
