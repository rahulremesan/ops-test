import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';
import './../layouts/people/profile_detail_layout.dart';

class ProfileDetailsPage extends ConsumerWidget {
  const ProfileDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainLayout(child: ProfileDetailLayout());
  }
}
