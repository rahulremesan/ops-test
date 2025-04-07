import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ProjectInfo extends StatelessWidget {
  final IconData infoIcon;
  final String infoTitle;
  final String infoType;
  final dynamic infoDescription;

  const ProjectInfo({
    super.key,
    required this.infoIcon,
    required this.infoTitle,
    required this.infoType,
    required this.infoDescription,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    String formatDescription(dynamic description, String type) {
      if (type == 'String') {
        return description.toString();
      } else if (type == 'Date') {
        return DateFormat.yMMMd().format(description);
      } else if (type == 'Time') {
        return DateFormat.jm().format(description);
      } else {
        return description.toString();
      }
    }

    return Container(
      color: Colors.white,
      height: 40,
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                infoIcon,
                size: 20,
                color: AppColors.neutral_300,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                infoTitle,
                style: TextStyle(
                  color: AppColors.neutral_300,
                  fontFamily: customTypography.caption1Regular.fontFamily,
                  fontSize: customTypography.caption1Regular.fontSize,
                  fontWeight: customTypography.caption1Regular.fontWeight,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              overflow: TextOverflow.ellipsis,
              formatDescription(infoDescription, infoType),
              style: TextStyle(
                fontFamily: customTypography.body3Medium.fontFamily,
                fontSize: customTypography.body3Medium.fontSize,
                fontWeight: customTypography.body3Medium.fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
