import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/secondary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/icon_card.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/conference_tag.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/conference_provider.dart';

class MyBookingsCard extends ConsumerWidget {
  final String meetingId;
  final String meetingName;
  final String roomId;
  final String roomName;
  final DateTime date;
  final String seats;
  final String startTime;
  final String endTime;

  final Map<String, bool> amenities; // Tag ID to isSelected map

  const MyBookingsCard({
    super.key,
    required this.meetingId,
    required this.meetingName,
    required this.roomId,
    required this.roomName,
    required this.date,
    required this.amenities,
    required this.seats,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    // Predefined tags
    final List<ConferenceTagData> predefinedTags = [
      ConferenceTagData(id: '1', icon: Icons.phone, item: 'Phone'),
      ConferenceTagData(id: '2', icon: Icons.tv, item: 'TV'),
      ConferenceTagData(id: '3', icon: Icons.wifi, item: 'Wifi'),
      ConferenceTagData(id: '4', icon: Icons.movie, item: 'Projector'),
    ];

    return Container(
      width: 417,
      // height: 301,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.platinum),
        color: Colors.white, // Background color of the card
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        // Adjust size to hug the contents
        children: [
          Text(
            meetingName,
            style: TextStyle(
              fontFamily: customTypography.body1Medium.fontFamily,
              fontSize: customTypography.body1Medium.fontSize,
              fontWeight: customTypography.body1Medium.fontWeight,
            ),
          ),
          const SizedBox(height: 5),
          IconCard(
              icon: Icons.place_outlined,
              iconColor: AppColors.nickel,
              text: '$roomId - $roomName'),
          const SizedBox(height: 5),
          IconCard(
            icon: Icons.chair_outlined,
            iconColor: AppColors.nickel,
            text: 'Room Capacity: $seats',
          ),
          const SizedBox(height: 5),
          IconCard(
              icon: Icons.calendar_month_outlined,
              iconColor: AppColors.nickel,
              text: DateFormat('d MMM yyyy').format(date)),
          const SizedBox(height: 5),
          IconCard(
              icon: Icons.av_timer,
              iconColor: AppColors.nickel,
              text: formatTimeWithDuration(startTime, endTime)),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 386,
            child: Wrap(
              spacing: 8.0, // Horizontal space between tags
              runSpacing: 8.0, // Vertical space between tags
              children: predefinedTags.map((tag) {
                final isSelected = amenities[tag.item] ?? false;
                return ConferenceTag(
                  icon: Icon(tag.icon),
                  item: tag.item,
                  isSelected: isSelected,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

String formatTimeWithDuration(String startTime, String endTime) {
  // Helper function to convert TimeOfDay to 12-hour format with AM/PM
  String formatTo12Hour(TimeOfDay time) {
    final hour = time.hourOfPeriod;
    final minute = time.minute;
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';
  }

  // Parse the input times
  final start = TimeOfDay(
    hour: int.parse(startTime.split(':')[0]),
    minute: int.parse(startTime.split(':')[1].split(' ')[0]),
  );
  final end = TimeOfDay(
    hour: int.parse(endTime.split(':')[0]),
    minute: int.parse(endTime.split(':')[1].split(' ')[0]),
  );

  // Calculate the duration
  final startMinutes = start.hour * 60 + start.minute;
  final endMinutes = end.hour * 60 + end.minute;
  final durationMinutes = endMinutes - startMinutes;

  // Convert duration to hours and minutes
  final hours = durationMinutes ~/ 60;
  final minutes = durationMinutes % 60;

  // Format the output
  final formattedStart = formatTo12Hour(start);
  final formattedEnd = formatTo12Hour(end);
  final formattedDuration =
      '($hours Hr${hours > 1 ? 's' : ''}${minutes > 0 ? ' $minutes Min${minutes > 1 ? 's' : ''}' : ''})';

  return '$formattedStart to $formattedEnd $formattedDuration';
}
