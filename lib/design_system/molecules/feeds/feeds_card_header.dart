import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class FeedsCardHeader extends StatelessWidget {
  final String? profileImage;
  final String username;
  final String date;
  final String channel;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool isEdit;

  const FeedsCardHeader({
    super.key,
    this.profileImage,
    required this.username,
    required this.date,
    required this.channel,
    this.onEdit,
    this.onDelete,
    required this.isEdit,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: profileImage != null
                  ? AssetImage(profileImage!)
                  : const AssetImage(
                      'assets/images/profileImage.jpeg'),
              radius: 25,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(username,
                    style: TextStyle(
                      fontFamily: customTypography.body2Medium.fontFamily,
                      fontSize: customTypography.body2Medium.fontSize,
                      fontWeight: customTypography.body2Medium.fontWeight,
                      color: AppColors.neutral_500,
                      letterSpacing: 0,
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  date.toString(),
                  style: screenWidth<350 ? TextStyle(
                    fontFamily: customTypography.caption1Medium.fontFamily,
                    fontSize: customTypography.caption1Medium.fontSize,
                    fontWeight: customTypography.caption1Medium.fontWeight,
                    color: AppColors.neutral_300,
                    letterSpacing: 0,
                  ):TextStyle(
                    fontFamily: customTypography.body3Medium.fontFamily,
                    fontSize: customTypography.body3Medium.fontSize,
                    fontWeight: customTypography.body3Medium.fontWeight,
                    color: AppColors.neutral_300,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                if (screenWidth > 450)
                  Text(
                    channel,
                    style: TextStyle(
                      fontFamily: customTypography.body3Regular.fontFamily,
                      fontSize: customTypography.body3Regular.fontSize,
                      fontWeight: customTypography.body3Regular.fontWeight,
                    ),
                  ),
                if (screenWidth > 350)
                  const SizedBox(
                    width: 8,
                  ),
                if (isEdit)
                  PopupMenuButton<String>(
                    shadowColor: Colors.grey[100],
                    offset: const Offset(0, 35),
                    menuPadding: const EdgeInsets.all(0),
                    popUpAnimationStyle: AnimationStyle(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                    ),
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        onTap: onEdit,
                        padding: const EdgeInsets.all(8),
                        height: 30,
                        child: const Row(
                          children: [
                            Icon(Icons.edit, size: 16),
                            SizedBox(width: 8),
                            Text('Edit'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: onDelete,
                        padding: const EdgeInsets.all(8),
                        height: 30,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 16,
                              color: Colors.red,
                            ),
                            SizedBox(width: 8),
                            Text('Delete'),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
