import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/molecules/feeds/feed_activity_card.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/feed_provider.dart';

class RecentActivities extends ConsumerWidget {
  const RecentActivities({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(feedsProvider);
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Activities',
                    style: TextStyle(
                      fontFamily: customTypography.body2Bold.fontFamily,
                      fontSize: customTypography.body2Bold.fontSize,
                      fontWeight: customTypography.body2Bold.fontWeight,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (provider.recentActivity.isEmpty)
                    const Text("No recent activities found."),
                  ...provider.recentActivity.map(
                    (feed) => Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: FeedActivityCard(
                          // profileImage: feed['profile_image'],
                          username: feed['user_id'].toString(),
                          channel: feed['channel_name'],
                          activityType: feed['activity_type'],
                          preview:
                              feed['activity_preview'] ?? feed['post_preview'],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
