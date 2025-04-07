import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/icon_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class UserCard2 extends StatelessWidget {
  final String name;
  final String? image;
  final double? imageSize;
  final String? designation;
  final String? department;
  final TextStyle? nameStyling;

  const UserCard2({
    super.key,
    required this.name,
    this.image,
    this.designation,
    this.department,
    this.nameStyling,
    this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: imageSize ?? 30,
              backgroundImage: image != null
                  ? AssetImage(image!)
                  : const AssetImage(
                      'assets/images/profileImage.jpeg'),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: nameStyling ??
                      TextStyle(
                        fontFamily: customTypography.h4Medium.fontFamily,
                        fontSize: customTypography.h4Medium.fontSize,
                        fontWeight: customTypography.h4Medium.fontWeight,
                        color: AppColors.lacqueredLiquorice,
                        letterSpacing: 0,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                IconCard(
                  icon: Icons.work_outline,
                  text: designation ?? 'N/A',
                  space: 5,
                  iconColor: AppColors.wolFrame,
                ),
                const SizedBox(
                  height: 10,
                ),
                IconCard(
                  icon: Icons.device_hub_outlined,
                  text: department ?? 'N/A',
                  space: 5,
                  iconColor: AppColors.wolFrame,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.share,
                      color: AppColors.luckyGrey,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: AppColors.luckyGrey,
                    ),
                  ],
                )
              ],
            )
          ],
        );
      } else {
        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: imageSize ?? 30,
              backgroundImage: image != null
                  ? AssetImage(image!)
                  : const AssetImage(
                      'assets/images/profileImage.jpeg'),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: nameStyling ??
                      TextStyle(
                        fontFamily: customTypography.h4Medium.fontFamily,
                        fontSize: customTypography.h4Medium.fontSize,
                        fontWeight: customTypography.h4Medium.fontWeight,
                        color: AppColors.lacqueredLiquorice,
                        letterSpacing: 0,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconCard(
                      icon: Icons.work_outline,
                      text: designation ?? 'NA',
                      space: 5,
                      iconColor: AppColors.wolFrame,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    IconCard(
                      icon: Icons.device_hub_outlined,
                      text: department ?? 'NA',
                      space: 5,
                      iconColor: AppColors.wolFrame,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.share,
                      color: AppColors.luckyGrey,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                     FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: AppColors.luckyGrey,
                    ),
                  ],
                )
              ],
            )
          ],
        );
      }
    });
  }
}
