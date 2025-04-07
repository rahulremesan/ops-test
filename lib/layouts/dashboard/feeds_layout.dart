import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/secondary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/titles/primary_title.dart';
import 'package:styria_flutter_web/layouts/feeds/post_section.dart';

class FeedEvent {
  final String profileImage;
  final String name;
  final int lastSeen;
  final bool isPrimary;
  final String heading;
  final DateTime date;
  final String buttonText;
  final DateTime startTime;
  final DateTime endTime;
  final String postImage;

  FeedEvent({
    required this.profileImage,
    required this.name,
    required this.lastSeen,
    required this.isPrimary,
    required this.heading,
    required this.date,
    required this.buttonText,
    required this.startTime,
    required this.endTime,
    required this.postImage,
  });
}

class FeedsLayout extends StatelessWidget {
  final String title;
  final String buttonLabel;
  final List<FeedEvent> events;

  const FeedsLayout({
    super.key,
    required this.title,
    required this.buttonLabel,
    required this.events,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: PrimaryTitle(title: title)),
                SecondaryButton(
                  buttonText: buttonLabel,
                  onPressed: () => context.go(AppRoute.feeds),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Expanded(
              child: SingleChildScrollView(
                child: PostSection(
                  isBordered: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
