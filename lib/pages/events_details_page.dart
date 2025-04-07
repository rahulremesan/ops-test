import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/layouts/events/events_details_layout.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';

class EventsDetailsPage extends ConsumerWidget {
  const EventsDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  MainLayout(
      child: const EventsDetailsLayout(),
    );
  }
}
