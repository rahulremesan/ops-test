import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/secondary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/conference_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/my_bookings_card.dart';
import 'package:styria_flutter_web/design_system/atoms/tabs/tabs.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/layouts/conference_room/room_filter_layout.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class ConferenceLayout extends ConsumerStatefulWidget {
  final List<Map<String, dynamic>> rooms;
  final List<Map<String, dynamic>> tatkalRooms;
  final List<Map<String, dynamic>> myBookingRooms;

  final List<RoomFilterCardProps> filterData;
  bool showBreadcrumbs;

  ConferenceLayout({
    super.key,
    required this.rooms,
    required this.tatkalRooms,
    required this.myBookingRooms,
    required this.filterData,
    this.showBreadcrumbs = true,
  });

  @override
  ConsumerState<ConferenceLayout> createState() => _ConferenceLayoutState();
}

class _ConferenceLayoutState extends ConsumerState<ConferenceLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Update UI when tab changes
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final roomCount = widget.rooms.length;
    final tatkalCount = widget.tatkalRooms.length;
    final myBookingsCount = widget.myBookingRooms.length;

    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final isMobile = ref.watch(isMobileProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.showBreadcrumbs && !isMobile) ...[
                        PageBreadcrumbs(
                          items: [
                            BreadcrumbData(
                              label: 'Apps',
                              link: AppRoute.apps,
                              isActive: true,
                            ),
                            BreadcrumbData(
                              label: 'Book Conference Room',
                              link: AppRoute.bookConferenceRoom,
                              isActive: false,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],
                      Text(
                        "Book Conference Room",
                        style: TextStyle(
                          fontFamily: customTypography.h3Bold.fontFamily,
                          fontSize: customTypography.h3Bold.fontSize,
                          fontWeight: customTypography.h3Bold.fontWeight,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Tabs(
                        controller: _tabController,
                        tabTitles: [
                          'Normal ($roomCount)',
                          'Tatkal ($tatkalCount)',
                          'My Bookings ($myBookingsCount)',
                        ],
                        tabViews: [
                          buildConferenceTabView(constraints, widget.rooms),
                          buildTatkalView(constraints, widget.tatkalRooms),
                          buildMyBookingsView(
                              constraints, widget.myBookingRooms),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Row(
                            children: [
                              SecondaryButton(
                                icon: Icons.change_circle_outlined,
                                buttonText: "Refresh",
                                onPressed: () {},
                              ),
                              const SizedBox(width: 16),
                              if (_tabController.index !=
                                  2) // Hide button on My Bookings tab
                                SecondaryButton(
                                  icon: Icons.report_gmailerrorred,
                                  buttonText: "Report Vacant Room",
                                  onPressed: () {},
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Function to build tab views
  Widget buildConferenceTabView(
      BoxConstraints constraints, List<Map<String, dynamic>> rooms) {
    // Determine screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // Define flex values based on screen size
    final isDesktop = screenWidth >= 1026; // Example breakpoint for desktop
    final roomFlex = isDesktop ? (1299 / 1715 * 1000).round() : 1;
    final filterFlex = isDesktop
        ? (416 / 1715 * 1000).round()
        : 1; // Equal flex for tablet and smaller screens

    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Room list section
          Expanded(
            flex: roomFlex,
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 24.0,
                runSpacing: 24.0,
                alignment: WrapAlignment.start,
                children: rooms.map((room) {
                  return ConferenceCard(
                    roomId: room['roomId'],
                    roomName: room['roomName'],
                    amenities: room['amenities'],
                    seats: room['seats'] ?? 'Data not available',
                    slots: room['slots'],
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          // Filter layout section
          Expanded(
            flex: filterFlex,
            child: SizedBox(
              // width: 416,
              child: RoomFilterLayout(filterCardsProps: widget.filterData),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTatkalView(
      BoxConstraints constraints, List<Map<String, dynamic>> rooms) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define flex values based on screen size
    final isDesktop = screenWidth >= 1026; // Example breakpoint for desktop
    final roomFlex = isDesktop ? 4 : 2;
    final filterFlex =
        isDesktop ? 1 : 1; // Equal flex for tablet and smaller screens

    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: roomFlex,
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 24.0,
                runSpacing: 24.0,
                alignment: WrapAlignment.start,
                children: rooms.map((room) {
                  return ConferenceCard(
                    roomId: room['roomId'],
                    roomName: room['roomName'],
                    amenities: room['amenities'],
                    seats: room['seats'] ?? 'Data not available',
                    variant2: false,
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: filterFlex,
            child: SizedBox(
              // width: 416,
              child: RoomFilterLayout(filterCardsProps: widget.filterData),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMyBookingsView(
      BoxConstraints constraints, List<Map<String, dynamic>> rooms) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Define flex values based on screen size
    final isDesktop = screenWidth >= 1026; // Example breakpoint for desktop
    final roomFlex = isDesktop ? 4 : 2;
    final filterFlex =
        isDesktop ? 1 : 1; // Equal flex for tablet and smaller screens

    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: roomFlex,
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 24.0,
                runSpacing: 24.0,
                alignment: WrapAlignment.start,
                children: rooms.map((room) {
                  return MyBookingsCard(
                    meetingId: room['meetingId'],
                    meetingName: room['meetingName'],
                    date: room['date'],
                    startTime: room['startTime'],
                    endTime: room['endTime'],
                    roomId: room['roomId'],
                    roomName: room['roomName'],
                    amenities: room['amenities'],
                    seats: room['seats'] ?? 'Data not available',
                  );
                }).toList(),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: filterFlex,
            child: SizedBox(
              // width: 416,
              child: RoomFilterLayout(filterCardsProps: widget.filterData),
            ),
          ),
        ],
      ),
    );
  }
}
