import 'package:flutter/material.dart';
import 'calendar_event.dart';
import 'calendar_header.dart';
import 'calendar_day_cell.dart';

class CalendarWidget extends StatefulWidget {
  final Map<DateTime, List<CalendarEvent>> events;

  const CalendarWidget({Key? key, required this.events}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  static const double _largeBreakpoint = 1100;
  static const double _mediumBreakpoint = 800;
  static const double _smallBreakpoint = 768;
  static const double _mobileBreakpoint = 325;
  static const List<String> _daysOfWeek = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  late DateTime _focusedMonth;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _focusedMonth = DateTime(now.year, now.month);
    _selectedDate = DateTime(now.year, now.month, now.day);
  }

  void _previousMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _focusedMonth = DateTime(_focusedMonth.year, _focusedMonth.month + 1);
    });
  }

  void _goToToday() {
    setState(() {
      final now = DateTime.now();
      _focusedMonth = DateTime(now.year, now.month);
      _selectedDate = DateTime(now.year, now.month, now.day);
    });
  }

  double _getCalendarWidth(double screenWidth) {
    if (screenWidth >= _largeBreakpoint) {
      return 1260;
    } else if (screenWidth >= _mediumBreakpoint) {
      return 800;
    } else if (screenWidth >= _mobileBreakpoint) {
      // Linear interpolation between 700 at _smallBreakpoint and 300 at _mobileBreakpoint
      final range = _smallBreakpoint - _mobileBreakpoint;
      final position = screenWidth - _mobileBreakpoint;
      final percentage = position / range;
      return 270 + (percentage * 400); // Scales from 300 to 700
    } else {
      return 270; // Minimum width
    }
  }

  double _getCellAspectRatio(double screenWidth) {
    if (screenWidth >= _largeBreakpoint) {
      return 1.0; // Original aspect ratio for large screens
    } else if (screenWidth >= _smallBreakpoint) {
      return 0.5; // Original mobile aspect ratio
    } else if (screenWidth >= _mobileBreakpoint) {
      // Decreased aspect ratio to increase height by 50px
      // If base height was 100px (0.5 ratio), new ratio for 150px height would be 0.33
      return 0.4;
    } else {
      return 0.4; // Maintain increased height for smallest screens
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < _largeBreakpoint;
    final calendarWidth = _getCalendarWidth(screenWidth);
    final cellAspectRatio = _getCellAspectRatio(screenWidth);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: calendarWidth,
          child: Column(
            children: [
              CalendarHeader(
                focusedMonth: _focusedMonth,
                onPreviousMonth: _previousMonth,
                onNextMonth: _nextMonth,
                onGoToToday: _goToToday,
              ),
              const SizedBox(height: 50),
              _DaysOfWeek(),
              const SizedBox(height: 20),
              _CalendarGrid(
                focusedMonth: _focusedMonth,
                selectedDate: _selectedDate,
                events: widget.events,
                isMobile: isMobile,
                cellAspectRatio: cellAspectRatio,
                onDateSelected: (date) => setState(() => _selectedDate = date),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DaysOfWeek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _CalendarWidgetState._daysOfWeek
          .map((day) => Text(
                day,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ))
          .toList(),
    );
  }
}

class _CalendarGrid extends StatelessWidget {
  final DateTime focusedMonth;
  final DateTime selectedDate;
  final Map<DateTime, List<CalendarEvent>> events;
  final bool isMobile;
  final double cellAspectRatio;
  final ValueChanged<DateTime> onDateSelected;

  const _CalendarGrid({
    required this.focusedMonth,
    required this.selectedDate,
    required this.events,
    required this.isMobile,
    required this.cellAspectRatio,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final calendarDays = _calculateCalendarDays();

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: cellAspectRatio,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: calendarDays.length,
      itemBuilder: (context, index) {
        final dayInfo = calendarDays[index];
        return CalendarDayCell(
          date: dayInfo.date,
          isPrevMonth: dayInfo.isPrevMonth,
          isNextMonth: dayInfo.isNextMonth,
          events: events[dayInfo.date] ?? [],
          selectedDate: selectedDate,
          onTap: () => onDateSelected(dayInfo.date),
        );
      },
    );
  }

  List<_DayInfo> _calculateCalendarDays() {
    final List<_DayInfo> days = [];
    final daysInMonth =
        DateTime(focusedMonth.year, focusedMonth.month + 1, 0).day;
    final firstDayOfMonth = DateTime(focusedMonth.year, focusedMonth.month, 1);
    final startIndex = firstDayOfMonth.weekday - 1;

    // Previous month days
    for (int i = 0; i < startIndex; i++) {
      final date =
          DateTime(focusedMonth.year, focusedMonth.month, -startIndex + i + 1);
      days.add(_DayInfo(date: date, isPrevMonth: true));
    }

    // Current month days
    for (int i = 1; i <= daysInMonth; i++) {
      final date = DateTime(focusedMonth.year, focusedMonth.month, i);
      days.add(_DayInfo(date: date));
    }

    // Next month days
    final remainingCells = (7 - (days.length % 7)) % 7;
    for (int i = 1; i <= remainingCells; i++) {
      final date = DateTime(focusedMonth.year, focusedMonth.month + 1, i);
      days.add(_DayInfo(date: date, isNextMonth: true));
    }

    return days;
  }
}

class _DayInfo {
  final DateTime date;
  final bool isPrevMonth;
  final bool isNextMonth;

  _DayInfo({
    required this.date,
    this.isPrevMonth = false,
    this.isNextMonth = false,
  });
}
