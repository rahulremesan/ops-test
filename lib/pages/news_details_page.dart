import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';
import 'package:styria_flutter_web/layouts/news/news_details_layout.dart';

class NewsDetailsPage extends ConsumerWidget {
  const NewsDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainLayout(child: NewsDetailsLayout());
  }
}
