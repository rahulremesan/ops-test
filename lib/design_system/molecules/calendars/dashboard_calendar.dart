import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardCalendar extends StatelessWidget {
  const DashboardCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    // Check if device is mobile based on screen width
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Expanded(
      child: TableCalendar(
        rowHeight: isMobile ? 40 : 31,
        focusedDay: DateTime.now(),
        firstDay: DateTime(1700),
        lastDay: DateTime(2200),
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            color: AppColors.lacqueredLiquorice,
            fontFamily: customTypography.body2Regular.fontFamily,
            fontSize: customTypography.body2Regular.fontSize,
            fontWeight: customTypography.body2Regular.fontWeight,
          ),
        ),
        startingDayOfWeek: StartingDayOfWeek.monday,
        availableGestures: AvailableGestures.all,
        daysOfWeekStyle: DaysOfWeekStyle(
          dowTextFormatter: (date, locale) {
            switch (date.weekday) {
              case DateTime.monday:
                return 'M';
              case DateTime.tuesday:
                return 'T';
              case DateTime.wednesday:
                return 'W';
              case DateTime.thursday:
                return 'T';
              case DateTime.friday:
                return 'F';
              case DateTime.saturday:
                return 'S';
              case DateTime.sunday:
                return 'S';
              default:
                return '';
            }
          },
          weekendStyle: TextStyle(
            color: Colors.black,
            fontFamily: customTypography.caption1Regular.fontFamily,
            fontSize: customTypography.caption1Regular.fontSize,
            fontWeight: customTypography.caption1Regular.fontWeight,
          ),
          weekdayStyle: TextStyle(
            color: Colors.black,
            fontFamily: customTypography.caption1Regular.fontFamily,
            fontSize: customTypography.caption1Regular.fontSize,
            fontWeight: customTypography.caption1Regular.fontWeight,
          ),
        ),
        calendarStyle: CalendarStyle(
          weekendTextStyle: TextStyle(
            color: AppColors.luckyGrey,
            fontFamily: customTypography.caption1Regular.fontFamily,
            fontSize: customTypography.caption1Regular.fontSize,
            fontWeight: customTypography.caption1Regular.fontWeight,
          ),
          defaultTextStyle: TextStyle(
            fontFamily: customTypography.caption1Regular.fontFamily,
            fontSize: customTypography.caption1Regular.fontSize,
            fontWeight: customTypography.caption1Regular.fontWeight,
          ),
          todayTextStyle: TextStyle(
            color: Colors.white,
            fontFamily: customTypography.caption1Regular.fontFamily,
            fontSize: customTypography.caption1Regular.fontSize,
            fontWeight: customTypography.caption1Regular.fontWeight,
          ),
          outsideTextStyle: TextStyle(
            color: Color(0xFFD2D3D6),
            fontFamily: customTypography.caption1Regular.fontFamily,
            fontSize: customTypography.caption1Regular.fontSize,
            fontWeight: customTypography.caption1Regular.fontWeight,
          ),
          todayDecoration: const BoxDecoration(
            color: AppColors.brandBlue,
            shape: BoxShape.circle,
          ),
          cellMargin: EdgeInsets.all(isMobile ? 2 : 0),
          cellPadding: EdgeInsets.all(
              isMobile ? 4 : 0), // Conditional padding based on device type
        ),
      ),
    );
  }
}
