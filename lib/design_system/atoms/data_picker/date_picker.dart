import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/week_day_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime initialStartDate;
  final DateTime initialEndDate;
  final ValueChanged<DateTime> onDateChanged;
  final int initialWeekNumber;
  final VoidCallback? onPreviousWeek;
  final VoidCallback? onNextWeek;
  final DateTime startOfWeek;

  const CustomDatePicker({
    super.key,
    required this.initialStartDate,
    required this.initialEndDate,
    required this.onDateChanged,
    required this.initialWeekNumber,
    this.onPreviousWeek,
    this.onNextWeek,
    required this.startOfWeek,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime currentDate;
  late DateTime startDate;
  late DateTime endDate;
  late int weekNumber;

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    startDate = widget.initialStartDate;
    endDate = widget.initialEndDate;
    weekNumber = _calculateWeekNumber(startDate);
  }

  int _calculateWeekNumber(DateTime date) {
    final firstDayOfYear = DateTime(date.year);
    final daysPassed = date.difference(firstDayOfYear).inDays;
    return (daysPassed ~/ 7) + 1;
  }

  void _previousWeek() {
    setState(() {
      startDate = startDate.subtract(const Duration(days: 7));
      endDate = endDate.subtract(const Duration(days: 7));
      weekNumber = _calculateWeekNumber(startDate);
    });
  }

  void _nextWeek() {
    setState(() {
      startDate = startDate.add(const Duration(days: 7));
      endDate = endDate.add(const Duration(days: 7));
      weekNumber = _calculateWeekNumber(startDate);
    });
  }

  DateTimeRange _getStartAndEndOfWeek(DateTime date) {
    final startOfWeek = date.subtract(Duration(days: date.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 6));
    return DateTimeRange(start: startOfWeek, end: endOfWeek);
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        final double maxHeight =
            MediaQuery.of(context).size.width <= 976 ? 550 : 400;
        final double maxWidth =
            MediaQuery.of(context).size.width <= 976 ? 450 : 600;
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: maxWidth,
              maxHeight: maxHeight,
            ),
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: AppColors.black06,
                  hintColor: AppColors.brandBlue,
                  colorScheme: const ColorScheme.light(
                    primary: AppColors.brandBlue,
                    onPrimary: Colors.white,
                    onSurface: Colors.black,
                  ),
                  dialogBackgroundColor: AppColors.dreamyCloud,
                ),
                child: child!,
              ),
            ),
          ),
        );
      },
    );
    if (pickedDate != null) {
      final weekRange = _getStartAndEndOfWeek(pickedDate);
      setState(() {
        startDate = weekRange.start;
        endDate = weekRange.end;
        currentDate = pickedDate;
        weekNumber = _calculateWeekNumber(startDate);
      });
      widget.onDateChanged(pickedDate);
    }
  }

  String _formatDate(DateTime date) {
    return DateFormat('MMM dd').format(date);
  }

  Widget _buildMobileDatePicker() {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              WeekDayCard(
                date: currentDate,
              ),
              MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                      onTap: () => _selectStartDate(context),
                      child: const Row(children: [
                        Icon(
                          Icons.today_outlined,
                          color: Colors.black,
                        ),
                      ])))
            ]),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    widget.onPreviousWeek?.call();
                    _previousWeek();
                  },
                ),
                Text(
                  DateFormat('MMMM yyyy').format(startDate),
                  style: TextStyle(
                    fontFamily: customTypography.body2Regular.fontFamily,
                    fontSize: customTypography.body2Regular.fontSize,
                    fontWeight: customTypography.body2Regular.fontWeight,
                    color: AppColors.lacqueredLiquorice,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    widget.onNextWeek?.call();
                    _nextWeek();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                    .map((day) => Expanded(
                          child: Center(
                            child: Text(
                              day,
                              style: const TextStyle(color: AppColors.nickel),
                            ),
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(7, (index) {
                  final day = startDate.add(Duration(days: index));
                  final isSelected = day.day == currentDate.day &&
                      day.month == currentDate.month &&
                      day.year == currentDate.year;
                  final isToday = day.day == DateTime.now().day &&
                      day.month == DateTime.now().month &&
                      day.year == DateTime.now().year;

                  return Expanded(
                      child: Center(
                          child: GestureDetector(
                    onTap: () {
                      setState(() {
                        currentDate = day;
                        widget.onDateChanged(currentDate);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.brandBlue
                            : Colors.transparent,
                        shape: BoxShape.circle,
                        border: isToday
                            ? Border.all(
                                color: AppColors.brandBlue,
                              )
                            : null,
                      ),
                      child: Text(
                        DateFormat('dd').format(day),
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )));
                }),
              ),
            ])
          ],
        ));
  }

  Widget _buildDesktopDatePicker() {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            widget.onPreviousWeek?.call();
            _previousWeek();
          },
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _selectStartDate(context),
            child: Row(
              children: [
                const Icon(
                  Icons.today_outlined,
                  color: Colors.black,
                ),
                const SizedBox(width: 8),
                Text(
                  '${_formatDate(startDate)} - ${_formatDate(endDate)} (Week $weekNumber)',
                  style: TextStyle(
                    fontFamily: customTypography.body2Regular.fontFamily,
                    fontSize: customTypography.body2Regular.fontSize,
                    fontWeight: customTypography.body2Regular.fontWeight,
                    color: AppColors.lacqueredLiquorice,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: () {
            widget.onNextWeek?.call();
            _nextWeek();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return screenWidth < 769
        ? _buildMobileDatePicker()
        : _buildDesktopDatePicker();
  }
}
