import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/layouts/conference_room/conference_layout.dart';
import 'package:styria_flutter_web/layouts/conference_room/room_filter_layout.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';
import 'package:styria_flutter_web/shared/providers/conference_provider.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class ConferenceRoomPage extends ConsumerWidget {
  ConferenceRoomPage({super.key});

  final List<RoomFilterCardProps> filterdata = [
    RoomFilterCardProps(
      heading: 'Amenities',
      filterData: [
        {'title': 'Phone', 'status': false},
        {'title': 'TV', 'status': false},
        {'title': 'Wifi', 'status': false},
        {'title': 'Projector', 'status': false},
      ],
      onSelectionChanged: (List<Map<String, dynamic>> selections) {
        print('Categories selections: $selections');
      },
    ),
    RoomFilterCardProps(
      heading: 'Room Type',
      filterData: [
        {'title': 'Meetings ', 'status': true},
        {'title': 'Type', 'status': false},
        {'title': 'Type', 'status': false},
        {'title': 'Type', 'status': false},
      ],
      onSelectionChanged: (List<Map<String, dynamic>> selections) {
        print('Tags selections: $selections');
      },
    ),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    @override
    final isMobile = ref.watch(isMobileProvider);

    if (isMobile) {
      return MainLayout(
        isInnerPage: true,
        hideTopNav: true, // This will hide top nav only on mobile
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.go(AppRoute.apps),
              ),
              title: const Text(
                'Book Conference room',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Center(
                  child: ConferenceLayout(
                rooms: conferenceRooms,
                tatkalRooms: tatkalRooms,
                myBookingRooms: myBookingRooms,
                filterData: filterdata,
              )),
            ),
          ],
        ),
      );
    }
    return MainLayout(
      child: Center(
          child: ConferenceLayout(
        showBreadcrumbs: false,
        rooms: conferenceRooms,
        tatkalRooms: tatkalRooms,
        myBookingRooms: myBookingRooms,
        filterData: filterdata,
      )),
    );
  }
}
