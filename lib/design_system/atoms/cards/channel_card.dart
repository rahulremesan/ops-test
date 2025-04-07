import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ChannelCard extends StatelessWidget {
  final String text;
  final bool isSubscribed;
  final String title;
  final IconData? icon;
  final Color? iconColor;
  final double? iconSize;
  final TextStyle? textStyle;

  const ChannelCard(
      {super.key,
      required this.text,
      required this.isSubscribed,
      required this.title,
      this.icon,
      this.iconColor,
      this.iconSize,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.brandBlueSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: icon != null
            ? Icon(
                icon,
                color: iconColor ?? AppColors.black06,
                size: iconSize ?? 24,
              )
            : null,
        tileColor: AppColors.brandBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: Text(
          text,
          style: textStyle ??
              TextStyle(
                fontSize: customTypography.body2Medium.fontSize,
                fontWeight: customTypography.body2Medium.fontWeight,
                color: AppColors.black06,
                letterSpacing: 0,
              ),
        ),
        trailing: title == "Channels"
            ? Text(
                isSubscribed ? "Following" : "Follow",
              )
            : null,
      ),
    );
  }
}
