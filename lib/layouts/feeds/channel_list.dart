import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/channel_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/feed_provider.dart';

class ChannelList extends ConsumerWidget {
  final String title;
  final List channelList;

  const ChannelList({
    super.key,
    required this.title,
    required this.channelList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(feedsProvider);
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return 
        Container(
          margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: customTypography.h5Medium.fontFamily,
                    fontWeight: customTypography.h5Medium.fontWeight,
                    fontSize: customTypography.h5Medium.fontSize,
                    color: AppColors.neutral_500,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: 5),
                ...channelList.map<Widget>((channel) => ChannelCard(
                    text: channel['name'],
                    isSubscribed: channel['isSubscribed'],
                    title: title)),
                if (title == "Channels")
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          // provider.toggleChannelList();
                        },
                        child: Text(
                          "Explore all channels",
                          style: TextStyle(
                            color: AppColors.brandBlue,
                            decoration: TextDecoration.none,
                            fontFamily: customTypography.button1Bold.fontFamily,
                            fontWeight: customTypography.button1Bold.fontWeight,
                            fontSize: customTypography.button1Bold.fontSize,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        )
      ;
  }
}
