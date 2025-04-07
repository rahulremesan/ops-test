import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class Channels extends StatelessWidget {
  final Icon icon;
  final String channel;
  final GestureTapCallback? onClick;
  final bool isSelected;
  final bool isPrimary;
  const Channels({
    super.key,
    required this.icon,
    required this.channel,
    this.onClick,
    this.isPrimary = false,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? AppColors.brilliantWhite : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 6,
              right: 12,
              top: 12,
              bottom: 12,
            ),
            child: Row(
              children: [
                if (isPrimary) icon,
                const SizedBox(
                  width: 15,
                ),
                Text(
                  channel,
                  style: isPrimary
                      ? TextStyle(
                          fontFamily: customTypography.body2Medium.fontFamily,
                          fontSize: customTypography.body2Medium.fontSize,
                          fontWeight: customTypography.body2Medium.fontWeight,
                        )
                      : TextStyle(
                          fontFamily: customTypography.body3Regular.fontFamily,
                          fontSize: customTypography.body3Regular.fontSize,
                          fontWeight: customTypography.body3Regular.fontWeight,
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
