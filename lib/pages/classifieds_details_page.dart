import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/layouts/classifieds/classifieds_detail_layout.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';

class ClassifiedsDetailsPage extends ConsumerWidget {
  const ClassifiedsDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  MainLayout(
      child: const Center(
        child: ClassifiedsDetailLayout()
      ),
    );
  }
}
