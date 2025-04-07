import 'package:flutter/material.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/layouts/time_report/time_calendar.dart';
import 'package:styria_flutter_web/layouts/time_report/time_sheet.dart';

class TimeReportLayout extends StatefulWidget {
  final bool showBreadcrumbs;

  const TimeReportLayout({
    super.key,
    this.showBreadcrumbs = true,
  });

  @override
  _TimeReportLayoutState createState() => _TimeReportLayoutState();
}

class _TimeReportLayoutState extends State<TimeReportLayout> {
  DateTime startOfWeek =
      DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
  DateTime endDate = DateTime.now()
      .subtract(Duration(days: DateTime.now().weekday - 1))
      .add(const Duration(days: 6));
  Duration totalTimeForTheWeek = const Duration();
  DateTime currentDate = DateTime.now();

  void _nextWeek() {
    setState(() {
      startOfWeek = startOfWeek.add(const Duration(days: 7));
    });
  }

  void _previousWeek() {
    setState(() {
      startOfWeek = startOfWeek.subtract(const Duration(days: 7));
    });
  }

  void _viewToday() {
    setState(() {
      startOfWeek =
          DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
    });
  }

  void _onDateChanged(DateTime newStartDate) {
    setState(() {
      startOfWeek =
          newStartDate.subtract(Duration(days: newStartDate.weekday - 1));
      endDate = startOfWeek.add(const Duration(days: 6));
      currentDate = newStartDate;
    });
  }

  Duration totalTime = const Duration(hours: 10, minutes: 15);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          isMobile ? 16 : 40, isMobile ? 0 : 20, isMobile ? 16 : 40, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.showBreadcrumbs && !isMobile) ...[
            Align(
              alignment: Alignment.topLeft,
              child: PageBreadcrumbs(
                items: [
                  BreadcrumbData(
                    label: 'Apps',
                    link: AppRoute.apps,
                    isActive: true,
                  ),
                  BreadcrumbData(
                    label: 'Time Report',
                    link: AppRoute.timeReport,
                    isActive: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
          TimeAndCalendarWidget(
            totalTime: totalTimeForTheWeek,
            onPreviousWeek: _previousWeek,
            onNextWeek: _nextWeek,
            onViewToday: _viewToday,
            onDateChanged: _onDateChanged,
            startOfWeek: startOfWeek,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TimeSheet(
              startOfWeek: startOfWeek,
              currentDate: currentDate,
              onTotalTimeChanged: (Duration totalTime) {
                setState(() {
                  totalTimeForTheWeek = totalTime;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
