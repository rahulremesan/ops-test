import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/molecules/calendars/dashboard_calendar.dart';
import 'package:styria_flutter_web/design_system/molecules/calendars/dashboard_calendar_header.dart';

class CalendarLayout extends StatelessWidget {
  final String title;
  final String buttonLabel;

  const CalendarLayout({
    super.key,
    required this.title,
    required this.buttonLabel,
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardCalendarHeader(
              title: title,
              buttonLabel: buttonLabel,
              onViewPlanner: () => context.go(AppRoute.planner),
            ),
            const DashboardCalendar(),
          ],
        ),
      ),
    );
  }
}
