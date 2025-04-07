import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkCard extends StatelessWidget {
  final String text;
  final String url;
  final TextStyle? textStyle;
  final Color? iconColor;
  final double? iconSize;

  const LinkCard({
    super.key,
    required this.text,
    required this.url,
    this.textStyle,
    this.iconColor,
    this.iconSize,
  });

  // Method to launch the URL
  Future<void> _launchURL(BuildContext context) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch the link')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.attachment,
          color: iconColor ?? AppColors.neutral_400,
          size: iconSize ?? 24.0,
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => _launchURL(context),
          child: Text(
            text,
            style: textStyle ?? TextStyle(
              fontFamily: customTypography.body1Regular.fontFamily,
              fontSize: customTypography.body1Regular.fontSize,
              fontWeight: customTypography.body1Regular.fontWeight,
              color: AppColors.neutral_400,
              decoration: TextDecoration.underline
            ),
          ),
        ),
      ],
    );
  }
}
