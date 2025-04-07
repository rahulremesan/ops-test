import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/planner_cards.dart';
import 'package:styria_flutter_web/design_system/atoms/calendar/planner_calendar/calendar_widget.dart';
import 'package:styria_flutter_web/design_system/atoms/calendar/planner_calendar/calendar_event.dart';
import 'package:styria_flutter_web/design_system/atoms/dropdown/dropdown.dart';
import 'package:styria_flutter_web/design_system/atoms/dropdown/mutiselect_dropdown.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class PlannerLayout extends StatelessWidget {
  const PlannerLayout({super.key});

  @override
  Widget build(BuildContext context) {

     final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
        
    final Map<DateTime, List<CalendarEvent>> events = {
      DateTime(2024, 10, 16): [
        CalendarEvent(
            name: "Ascension Day", color: Colors.red, type: 'Holidays'),
        CalendarEvent(name: "Sick", color: Colors.red, type: 'Holidays'),
        CalendarEvent(
            name: "Leadership Workshop",
            color: Colors.orange,
            type: 'Training'),
      ],
      DateTime(2024, 10, 19): [
        CalendarEvent(
            name: "Family Function", color: Colors.blue, type: 'Event'),
        CalendarEvent(name: "Wedding", color: Colors.green, type: 'Tasks'),
      ],
      DateTime(2024, 10, 22): [
        CalendarEvent(
            name: "Personal Leave", color: Colors.brown, type: 'Holidays'),
        CalendarEvent(
            name: "Project Milestone Review",
            color: Colors.green,
            type: 'Tasks'),
        CalendarEvent(
            name: "Code Refactoring", color: Colors.green, type: 'Tasks'),
        CalendarEvent(
            name: "Code Refacoring", color: Colors.green, type: 'Tasks'),
      ],
      DateTime(2024, 10, 23): [
        CalendarEvent(
            name: "Company Holiday", color: Colors.red, type: 'Holidays'),
      ],
      DateTime(2024, 10, 24): [
        CalendarEvent(
            name: "Independence Day", color: Colors.red, type: 'Holidays'),
      ],
      DateTime(2024, 10, 25): [
        CalendarEvent(name: "Annual Gala", color: Colors.blue, type: 'Events'),
      ],
      DateTime(2024, 10, 26): [
        CalendarEvent(
            name: "Tech Conference", color: Colors.blue, type: 'Events'),
      ],
      DateTime(2024, 10, 27): [
        CalendarEvent(
            name: "React Training Session",
            color: Colors.orange,
            type: 'Training'),
      ],
    };

    // Generate PlannerCards based on the events
    final List<Widget> plannerCards = [];
    events.forEach((date, eventList) {
      for (var event in eventList) {
        plannerCards.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: PlannerCards(
              color: event.color,
              label: event.name,
              date: date,
            ),
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40,20,40,20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth <= 600) {
                      // Mobile layout - stack in column
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            'Planner',
                            style: TextStyle(
                              fontFamily: customTypography.h5Bold.fontFamily,
                              fontSize: customTypography.h5Bold.fontSize,
                              fontWeight: customTypography.h5Bold.fontWeight,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 120,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: MultiSelectDropdown(
                                    heading: 'Select type',
                                    items: const [
                                      'Holidays',
                                      'Leave',
                                      'Events',
                                      'Training',
                                      'Tasks'
                                    ],
                                    onSelectionChanged: (selectedItems) {
                                      // Handle selection changes here
                                    },
                                    colors: const [
                                      Colors.red,
                                      Colors.brown,
                                      Colors.blue,
                                      Colors.orange,
                                      Colors.green,
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              CustomWebDropdown(
                                items: const [
                                  'Create Event',
                                  'Create Training'
                                ],
                                onChanged: (String? selectedItem) {},
                                title: 'Create',
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      // Desktop layout - side by side
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            'Planner',
                            style: TextStyle(
                              fontFamily: customTypography.h5Bold.fontFamily,
                              fontSize: customTypography.h5Bold.fontSize,
                              fontWeight: customTypography.h5Bold.fontWeight,
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, bottom: 10),
                                child: SizedBox(
                                  width: 120,
                                  child: MultiSelectDropdown(
                                    heading: 'Select type',
                                    items: const [
                                      'Holidays',
                                      'Leave',
                                      'Events',
                                      'Training',
                                      'Tasks'
                                    ],
                                    onSelectionChanged: (selectedItems) {
                                      // Handle selection changes here
                                    },
                                    colors: const [
                                      Colors.red,
                                      Colors.brown,
                                      Colors.blue,
                                      Colors.orange,
                                      Colors.green,
                                    ],
                                  ),
                                ),
                              ),
                              CustomWebDropdown(
                                items: const [
                                  'Create Event',
                                  'Create Training'
                                ],
                                onChanged: (String? selectedItem) {},
                                title: 'Create',
                              ),
                            ],
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 1100) {
                    // Wide screen layout
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 350,
                          child: Column(
                            children: plannerCards,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: SizedBox(
                            child: CalendarWidget(events: events),
                          ),
                        ),
                      ],
                    );
                  } else {
                    // Narrow screen layout
                    return Column(
                      children: [
                        SizedBox(
                          child: CalendarWidget(events: events),
                        ),
                        const SizedBox(height: 40),
                        ...plannerCards,
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
