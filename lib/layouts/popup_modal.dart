// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
// import 'package:styria_flutter_web/shared/providers/feed_provider.dart';

// class CustomModal extends ConsumerWidget {
//   final Widget child;
//   final bool dismissible;

//   const CustomModal({
//     super.key,
//     required this.child,
//     this.dismissible = true,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final provider = ref.watch(feedsProvider);
//     return Dialog(
//       backgroundColor: Colors.transparent,
//       insetPadding: const EdgeInsets.all(16.0),
//       child: Stack(
//         children: [
//           GestureDetector(
//             onTap: () {
//               if (dismissible) {
//                 Navigator.of(context).pop();
//                 if(provider.isChannelListOpen){
//                   provider.toggleChannelList();
//                 }
//                 if(provider.isCreateFeedOpen){
//                   provider.toggleCreateFeed();
//                 }
//               }
//             },
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//               child: Container(
//                 color: AppColors.snowFlake.withOpacity(0.5),
//               ),
//             ),
//           ),
//           Center(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(8),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 10,
//                   )
//                 ],
//               ),
//               padding: const EdgeInsets.all(16.0),
//               child: child,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }