import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';
import 'package:styria_flutter_web/layouts/people/user_detail_layout.dart';

class UserDetailsPage extends ConsumerWidget {
  const UserDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainLayout(child: UserDetailLayout());
  }
}
