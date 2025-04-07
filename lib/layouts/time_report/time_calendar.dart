import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/data_picker/date_picker.dart';
import 'package:styria_flutter_web/design_system/atoms/dropdown/layer_dropdown.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class TimeAndCalendarWidget extends StatefulWidget {
  final Duration totalTime;
  final DateTime startOfWeek;
  final VoidCallback? onPreviousWeek;
  final VoidCallback? onNextWeek;
  final VoidCallback? onViewToday;
  final ValueChanged<DateTime> onDateChanged;

  const TimeAndCalendarWidget({
    super.key,
    required this.totalTime,
    required this.startOfWeek,
    this.onPreviousWeek,
    this.onNextWeek,
    this.onViewToday,
    required this.onDateChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TimeAndCalendarWidgetState createState() => _TimeAndCalendarWidgetState();
}

class _TimeAndCalendarWidgetState extends State<TimeAndCalendarWidget> {
  String selectedValue = 'Layers';
  late DateTime startDate;
  late DateTime endDate;
  int weekNumber =
      DateTime.now().difference(DateTime(DateTime.now().year, 1, 1)).inDays ~/
              7 +
          1;

  @override
  void initState() {
    super.initState();
    _initializeDates();
  }

  void _initializeDates() {
    final now = DateTime.now();
    startDate = now.subtract(Duration(days: now.weekday - 1));
    endDate = startDate.add(const Duration(days: 6));
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final hours = twoDigits(duration.inHours.remainder(60));
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    return "$hours:$minutes";
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final screenWidth = MediaQuery.of(context).size.width;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool islargeScreen = screenWidth > 1150;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.all(16.0),
          child: islargeScreen
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Layer Dropdown with fixed width
                    SizedBox(
                      width: 120,
                      child: LayerDropdown(
                        selectedValue: selectedValue,
                        onChanged: (String newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                        },
                        options: const [
                          'Layers',
                          'Option 1',
                          'Option 2',
                          'Option 3'
                        ],
                      ),
                    ),
                    // Total hours text with flexible space
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          "Total hours: ${_formatDuration(widget.totalTime)} hrs",
                          style: TextStyle(
                            fontFamily: customTypography.h4Bold.fontFamily,
                            fontSize: customTypography.h4Bold.fontSize,
                            fontWeight: customTypography.h4Bold.fontWeight,
                            height: customTypography.h4Bold.height,
                          ),
                        ),
                      ),
                    ),
                    // Right side elements
                    Flexible(
                      flex: 1,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: CustomDatePicker(
                              initialStartDate: startDate,
                              initialEndDate: endDate,
                              initialWeekNumber: weekNumber,
                              onNextWeek: widget.onNextWeek,
                              onPreviousWeek: widget.onPreviousWeek,
                              onDateChanged: widget.onDateChanged,
                              startOfWeek: widget.startOfWeek,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          SizedBox(
                            width: 100,
                            child: TertiaryButton(
                              buttonText: "View Today",
                              onPressed: widget.onViewToday!,
                              variant2: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: CustomDatePicker(
                            initialStartDate: startDate,
                            initialEndDate: endDate,
                            initialWeekNumber: weekNumber,
                            onNextWeek: widget.onNextWeek,
                            onPreviousWeek: widget.onPreviousWeek,
                            onDateChanged: widget.onDateChanged,
                            startOfWeek: widget.startOfWeek,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}
