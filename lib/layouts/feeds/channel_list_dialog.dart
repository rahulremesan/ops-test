// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:styria_flutter_web/design_system/atoms/cards/channel_card.dart';
// import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
// import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
// import 'package:styria_flutter_web/shared/providers/channels_provider.dart';
// import 'package:styria_flutter_web/shared/providers/feed_provider.dart';

// class ChannelListDialog extends ConsumerWidget {
//   const ChannelListDialog({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final provider = ref.watch(feedsProvider);
//     final channelProvider = ref.watch(channelsProvider);
//     final customTypography = Theme.of(context).extension<CustomTypography>() ??
//         CustomTypography.light;
//     return ConstrainedBox(
//       constraints: const BoxConstraints(maxWidth: 634, maxHeight: 690),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             AppBar(
//               title: Text(
//                 "Channels",
//                 style: TextStyle(
//                     fontSize: customTypography.h5Medium.fontSize,
//                     fontWeight: customTypography.h5Medium.fontWeight,
//                     color: AppColors.cursedBlack),
//               ),
//               titleSpacing: 0,
//               backgroundColor: Colors.white,
//               automaticallyImplyLeading: false,
//               actions: [
//                 IconButton(
//                   icon: const Icon(Icons.close),
//                   onPressed: (
//                       // provider.toggleChannelList,
//                       ) {},
//                 )
//               ],
//             ),
//             Column(
//               children: channelProvider.channels
//                   .map(
//                     (channel) => ChannelCard(
//                       text: channel['channel'],
//                       isSubscribed: channel['isSubscribed'],
//                       title: '',
//                     ),
//                   )
//                   .toList(),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
