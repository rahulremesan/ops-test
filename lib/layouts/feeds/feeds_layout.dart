// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:styria_flutter_web/layouts/feeds/channel_list.dart';
// import 'package:styria_flutter_web/layouts/feeds/channel_list_dialog.dart';
// import 'package:styria_flutter_web/layouts/feeds/create_feed.dart';
// import 'package:styria_flutter_web/layouts/feeds/post_section.dart';
// import 'package:styria_flutter_web/layouts/feeds/recent_activities.dart';
// import 'package:styria_flutter_web/layouts/popup_modal.dart';
// import '../../shared/providers/feed_provider.dart';
// import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
// import 'package:styria_flutter_web/constants/route_constants.dart';

// class FeedsLayout extends ConsumerWidget {
//   const FeedsLayout({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final provider = ref.watch(feedsProvider);

//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     //   if (provider.isChannelListOpen) {
//     //     _showModal(context, const ChannelListDialog(), true);
//     //   }
//     // });

//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     //   if (provider.isCreateFeedOpen) {
//     //     _showModal(context, const CreateFeed(isEditing: false, postId: 0,), true);
//     //   }
//     // });

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         PageBreadcrumbs(
//           items: [
//             BreadcrumbData(label: 'Feeds', link: AppRoute.feeds, isActive: true),
//           ],
//         ),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 13.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Flexible(
//                         fit: FlexFit.loose,
//                         child: ChannelList(
//                           title: "Organisation Channels",
//                           channelList: provider.channels,
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 16,
//                       ),
//                       Flexible(
//                         fit: FlexFit.loose,
//                         child: ChannelList(
//                           title: "Following",
//                           channelList: provider.followingChannels,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   flex: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: Column(
//                       children: [
//                         buildOnYourMind(ref),
//                         const SizedBox(height: 16),
//                         const Expanded(
//                           child: SingleChildScrollView(
//                             child: PostSection(),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                     flex: 1,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Flexible(
//                           fit: FlexFit.loose,
//                           child: ChannelList(
//                             title: "Channels",
//                             channelList: provider.channels,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 16,
//                         ),
//                         const Flexible(
//                           fit: FlexFit.loose,
//                           child: RecentActivities(),
//                         )
//                       ],
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _showModal(BuildContext context, Widget child, bool dismissable) {
//     showDialog(
//       context: context,
//       barrierDismissible: dismissable,
//       builder: (BuildContext content) => CustomModal(
//         dismissible: dismissable,
//         child: child,
//       ),
//     );
//   }

//   Widget buildOnYourMind(WidgetRef ref) {
//     final provider = ref.watch(feedsProvider);
//     return GestureDetector(
//       onTap: provider.toggleCreateFeed,
//       child: Container(
//         padding: const EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8.0),
//           color: Colors.white,
//         ),
//         child: const Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 24,
//                   backgroundImage:
//                       AssetImage('./../../../assets/images/profileImage.jpeg'),
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   "What's on your mind?",
//                   style: TextStyle(fontSize: 14),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Icon(Icons.videocam_outlined),
//                 SizedBox(width: 10),
//                 Icon(Icons.image_outlined),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
