import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/layouts/feeds/feeds_v2_layout.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';
import '../shared/providers/feed_provider.dart';

final feedsProvider = ChangeNotifierProvider((ref) => PostProvider());

class FeedsV2Page extends ConsumerWidget {
  const FeedsV2Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    return MainLayout(
      hideTopNavOnScroll: screenWidth <= 1200,
      child: Center(child: FeedsV2Layout()),
    );
  }
}
