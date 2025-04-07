import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/notification_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class NotificationData {
  final String imageUrl;
  final String title;
  final String time;

  NotificationData({
    required this.imageUrl,
    required this.title,
    required this.time,
  });
}

class NotificationBox extends StatelessWidget {
  final String heading;
  final String rightText;
  final List<NotificationData> notifications;
  final List<NotificationData>? yesterdayNotifications;
  final VoidCallback markAsRead;
  final bool? isYesterday;
  const NotificationBox(
      {super.key,
      required this.heading,
      required this.rightText,
      required this.notifications,
      required this.markAsRead,
      this.yesterdayNotifications,
      this.isYesterday = false});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return IntrinsicHeight(
      child: Container(
        width: 436,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.085),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 32, bottom: 8, right: 24, left: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    heading,
                    style: TextStyle(
                        fontFamily: customTypography.h5Medium.fontFamily,
                        fontSize: customTypography.h5Medium.fontSize,
                        fontWeight: customTypography.h5Medium.fontWeight,
                        fontStyle: customTypography.h5Medium.fontStyle),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        markAsRead();
                      },
                      child: Text(
                        rightText,
                        style: TextStyle(
                            fontFamily:
                                customTypography.button1Medium.fontFamily,
                            fontSize: customTypography.button1Medium.fontSize,
                            fontWeight:
                                customTypography.button1Medium.fontWeight,
                            fontStyle: customTypography.button1Medium.fontStyle,
                            color: AppColors.brandBlue),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              ...notifications.map(
                (notification) => Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: NotificationCard(
                      imageUrl: notification.imageUrl,
                      title: notification.title,
                      time: notification.time),
                ),
              ),
              isYesterday!
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Yesterday's",
                          style: TextStyle(
                            fontFamily: customTypography.body1Medium.fontFamily,
                            fontSize: customTypography.body1Medium.fontSize,
                            fontWeight: customTypography.body1Medium.fontWeight,
                            fontStyle: customTypography.body1Medium.fontStyle,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ...yesterdayNotifications!.map(
                          (notification) => Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: NotificationCard(
                                imageUrl: notification.imageUrl,
                                title: notification.title,
                                time: notification.time),
                          ),
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
