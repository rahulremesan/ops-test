import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/secondary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/modal/book_room_modal.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/conference_tag.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/time_period_tag.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/conference_provider.dart';

class ConferenceCard extends ConsumerWidget {
  final String roomId;
  final String roomName;
  final String seats;
  final Map<String, bool> amenities; // Tag ID to isSelected map
  final List<SlotsData> slots;
  final bool variant2; // New prop to control the display of booked slots

  const ConferenceCard({
    super.key,
    required this.roomId,
    required this.roomName,
    required this.amenities,
    required this.seats,
    this.slots = const [],
    this.variant2 = true,
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
      // height: variant2 ? 301 : 187,
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
            '$roomId - $roomName',
            style: TextStyle(
              fontFamily: customTypography.body1Medium.fontFamily,
              fontSize: customTypography.body1Medium.fontSize,
              fontWeight: customTypography.body1Medium.fontWeight,
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.chair_outlined,
                color: AppColors.nickel,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Room Capacity: $seats',
                style: TextStyle(
                  fontFamily: customTypography.body2Regular.fontFamily,
                  fontSize: customTypography.body2Regular.fontSize,
                  fontWeight: customTypography.body2Regular.fontWeight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
          const SizedBox(height: 16),
          if (variant2) ...[
            Text(
              'Booked Slots (${slots.length})',
              style: TextStyle(
                fontFamily: customTypography.body3Medium.fontFamily,
                fontSize: customTypography.body3Medium.fontSize,
                fontWeight: customTypography.body3Medium.fontWeight,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 386,
              child: Wrap(
                spacing: 8.0,
                runSpacing: 8.0, // Vertical space between tags
                children: slots.map((slot) {
                  return TimePeriodTag(
                    startTime: slot.startTime,
                    endTime: slot.endTime,
                    isSelected: slot.isSelected,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
          SecondaryButton(
            buttonText: 'Book Now',
            onPressed: () {
              // Handle booking action
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CreateRoomBookingModal(
                    onSubmit: (roomBookingData) {
                      // Handle the submitted data here
                      print('Room Booking Data: $roomBookingData');
                    },
                    onCancel: () {
                      // Handle cancel action here if needed
                      print('Booking cancelled');
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
