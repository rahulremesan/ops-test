import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class UserCard1 extends StatelessWidget {
  final String name;
  final String? image;
  final double? imageSize;
  final String? email;
  final String? phone;
  final TextStyle? nameStyling;
  final TextStyle? emailStyling;
  final TextStyle? phoneStyling;

  const UserCard1({
    super.key,
    required this.name,
    this.image,
    this.email,
    this.phone,
    this.nameStyling,
    this.emailStyling,
    this.phoneStyling,
    this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: imageSize ?? 30,
          backgroundImage: image != null
              ? AssetImage(image!)
              : const AssetImage('assets/images/profileImage.jpeg'),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: nameStyling ??
                  TextStyle(
                    fontFamily: customTypography.body1Medium.fontFamily,
                    fontSize: customTypography.body1Medium.fontSize,
                    fontWeight: customTypography.body1Medium.fontWeight,
                    color: AppColors.lacqueredLiquorice,
                  ),
            ),
            if (email != null)
              Text(
                email!,
                style: emailStyling ??
                    TextStyle(
                      fontFamily: customTypography.body3Regular.fontFamily,
                      fontWeight: customTypography.body3Regular.fontWeight,
                      fontSize: customTypography.body3Regular.fontSize,
                      color: AppColors.luckyGrey,
                    ),
              ),
            if (phone != null)
              Text(
                phone!,
                style: phoneStyling ??
                    TextStyle(
                      fontFamily: customTypography.body3Regular.fontFamily,
                      fontWeight: customTypography.body3Regular.fontWeight,
                      fontSize: customTypography.body3Regular.fontSize,
                      color: AppColors.luckyGrey,
                    ),
              )
          ],
        )
      ],
    );
  }
}
