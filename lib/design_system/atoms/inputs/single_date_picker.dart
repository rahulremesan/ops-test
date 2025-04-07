import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';

class SingleDatePicker extends StatefulWidget {
  final double width;
  const SingleDatePicker({
    super.key,
    required this.width, // Mark width as required
  });

  @override
  // ignore: library_private_types_in_public_api
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<SingleDatePicker> {
  // List of selected dates
  List<DateTime?> _date = [DateTime.now()];
  bool showDatePicker = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showDatePicker = !showDatePicker;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.platinum),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _date.isNotEmpty && _date[0] != null
                            ? DateFormat('EEE, d MMM yyyy').format(_date[0]!)
                            : 'Select Date',
                        style: TextStyle(
                          fontSize: 16,
                          color: _date[0] != null ? Colors.black : AppColors.platinum,
                        ),
                      ),
                      if(!showDatePicker)
                      const Icon(Icons.arrow_drop_down),
                      if(showDatePicker)
                      const Icon(Icons.arrow_drop_up),
                    ],
                  ),
                ),
              ),
            ),
            if (showDatePicker)
             Container(
              color: Colors.white,
               child: SizedBox(
                width: widget.width,
                child: CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    firstDate: DateTime(1900, 1, 1),
                    lastDate: DateTime(3000, 12, 31),
                    calendarType: CalendarDatePicker2Type.single,
                    selectedDayHighlightColor: Colors.blue,
                    weekdayLabelTextStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    dayTextStyle: const TextStyle(color: Colors.black),
                    selectedDayTextStyle: const TextStyle(color: Colors.white),
                    todayTextStyle: const TextStyle(color: Colors.red),
                  ),
                  value: _date,
                  onValueChanged: (dates) {
                    setState(() {
                      _date = dates;
                      showDatePicker = false;
                    });
                  },
                ),
               ),
             )
          ],
        ),
    );
  }
}
