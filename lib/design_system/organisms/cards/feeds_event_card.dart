import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/feeds_event_details_card.dart';
import 'package:styria_flutter_web/design_system/molecules/headers/feeds_event_card_header.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';

class FeedsEventCard extends StatelessWidget {
  final String profileImage;
  final String name;
  final int lastSeen;
  final bool isPrimary;
  final String? channel;
  final String heading;
  final String? description;
  final String? coordinator;
  final DateTime startTime;
  final DateTime endTime;
  final DateTime date;
  final String buttonText;
  final String postImage;
  const FeedsEventCard({
    super.key,
    required this.profileImage,
    required this.name,
    required this.lastSeen,
    required this.isPrimary,
    this.channel,
    required this.heading,
    required this.date,
    this.coordinator,
    this.description,
    required this.buttonText,
    required this.startTime,
    required this.endTime,
    required this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: AppColors.dreamyCloud,
          )),
      child: Column(
        children: [
          FeedsEventCardHeader(
            profileImage: profileImage,
            name: name,
            lastSeen: lastSeen,
            isPrimary: isPrimary,
            channel: channel,
          ),
          SizedBox(
            height: isPrimary ? 389 : 240,
            child: Image.network(
              postImage,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          FeedsEventDetailsCard(
            heading: heading,
            description: description,
            date: date,
            startTime: startTime,
            endTime: endTime,
            isPrimary: isPrimary,
            buttonText: buttonText,
            coordinator: coordinator,
          )
        ],
      ),
    );
  }
}
