import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/icon_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class SellerDetailsCard extends StatelessWidget {
  final String? profileImage;
  final String sellerName;
  final String sellerDesignation;
  final String phoneNumber;
  final String emailId;
  final String location;
  const SellerDetailsCard({
    super.key,
    this.profileImage,
    required this.sellerName,
    required this.sellerDesignation,
    required this.phoneNumber,
    required this.emailId,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seller Details',
              style: TextStyle(
                fontFamily: customTypography.body1Bold.fontFamily,
                fontSize: customTypography.body1Bold.fontSize,
                fontWeight: customTypography.body1Bold.fontWeight,
                color: AppColors.neutral_500,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: profileImage != null
                      ? NetworkImage(profileImage!)
                      : const AssetImage(
                          './../../../assets/images/profileImage.jpeg'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sellerName,
                        style: TextStyle(
                          fontFamily: customTypography.body2Bold.fontFamily,
                          fontSize: customTypography.body2Bold.fontSize,
                          fontWeight: customTypography.body2Bold.fontWeight,
                          color: AppColors.neutral_500,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        sellerDesignation,
                        style: TextStyle(
                          fontFamily: customTypography.body2Bold.fontFamily,
                          fontSize: customTypography.body2Bold.fontSize,
                          fontWeight: customTypography.body2Bold.fontWeight,
                          color: AppColors.neutral_400,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Wrap(
                        runSpacing: 6,
                        children: [
                          IconCard(
                            iconColor: AppColors.brandBlue,
                            iconSize: 16,
                            space: 12,
                            isBackgrounded: true,
                            icon: Icons.phone_outlined,
                            text: phoneNumber,
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          IconCard(
                            iconColor: AppColors.brandBlue,
                            iconSize: 16,
                            space: 12,
                            isBackgrounded: true,
                            icon: Icons.mail_outlined,
                            text: emailId,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      IconCard(
                        iconColor: AppColors.brandBlue,
                        iconSize: 16,
                        space: 12,
                        isBackgrounded: true,
                        icon: Icons.location_on_outlined,
                        text: location,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
