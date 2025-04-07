import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class FeedActivityCard extends StatelessWidget {
  final String? profileImage;

  final String username;
  final String activityType;
  final String? channel;
  final String? preview;

  const FeedActivityCard({
    super.key,
    this.profileImage,
    required this.username,
    this.channel,
    required this.activityType,
    this.preview,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4, left: 0, right: 0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: profileImage != null
                  ? AssetImage(profileImage!)
                  : const AssetImage(
                      'assets/images/profileImage.jpeg'),
            ),
            const SizedBox(width: 10),
            if (activityType == 'POST')
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: username,
                        style: TextStyle(
                          fontFamily: customTypography.body2Medium.fontFamily,
                          fontSize: customTypography.body2Medium.fontSize,
                          fontWeight: customTypography.body2Medium.fontWeight,
                        ),
                      ),
                      TextSpan(
                        text: ' added a new post in ',
                        style: TextStyle(
                          fontFamily: customTypography.body2Medium.fontFamily,
                          fontSize: customTypography.body2Medium.fontSize,
                        ),
                      ),
                      TextSpan(
                        text: channel,
                        style: TextStyle(
                          fontFamily: customTypography.body2Medium.fontFamily,
                          fontSize: customTypography.body2Medium.fontSize,
                          fontWeight: customTypography.body2Medium.fontWeight,
                        ),
                      ),
                    ],
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              )
            else if (activityType == 'LIKE')
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: username,
                        style: TextStyle(
                          fontFamily: customTypography.body2Medium.fontFamily,
                          fontSize: customTypography.body2Medium.fontSize,
                          fontWeight: customTypography.body2Medium.fontWeight,
                        ),
                      ),
                      TextSpan(
                        text: ' liked your post ',
                        style: TextStyle(
                          fontFamily: customTypography.body2Medium.fontFamily,
                          fontSize: customTypography.body2Medium.fontSize,
                        ),
                      ),
                      TextSpan(
                        text: '"$preview"',
                        style: TextStyle(
                          fontFamily: customTypography.body2Medium.fontFamily,
                          fontSize: customTypography.body2Medium.fontSize,
                          fontWeight: customTypography.body2Medium.fontWeight,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else if (activityType == 'COMMENT')
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: username,
                        style: TextStyle(
                          fontFamily: customTypography.body2Medium.fontFamily,
                          fontSize: customTypography.body2Medium.fontSize,
                          fontWeight: customTypography.body2Medium.fontWeight,
                        ),
                      ),
                      TextSpan(
                        text: ' commented on your post ',
                        style: TextStyle(
                          fontFamily: customTypography.body2Medium.fontFamily,
                          fontSize: customTypography.body2Medium.fontSize,
                        ),
                      ),
                      TextSpan(
                        text: '"$preview"',
                        style: TextStyle(
                          fontFamily: customTypography.body2Medium.fontFamily,
                          fontSize: customTypography.body2Medium.fontSize,
                          fontWeight: customTypography.body2Medium.fontWeight,
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
