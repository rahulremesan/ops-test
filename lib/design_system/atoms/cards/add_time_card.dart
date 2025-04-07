import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/custom_icon_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/duration_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/week_day_card.dart';

class AddTimeCard extends StatefulWidget {
  final int hours;
  final int minutes;
  final DateTime? date;
  final int columnIndex;
  final void Function(int columnIndex) onPressed;

  const AddTimeCard({
    super.key,
    required this.hours,
    required this.minutes,
    this.date,
    required this.onPressed,
    required this.columnIndex,
  });

  @override
  // ignore: library_private_types_in_public_api
  _AddTimeCardState createState() => _AddTimeCardState();
}

class _AddTimeCardState extends State<AddTimeCard> {
  late int hours;
  late int minutes;
  late DateTime? date;

  @override
  void initState() {
    super.initState();
    hours = widget.hours;
    minutes = widget.minutes;
    date = widget.date;
  }

  @override
  void didUpdateWidget(covariant AddTimeCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.hours != widget.hours ||
        oldWidget.minutes != widget.minutes ||
        oldWidget.date != widget.date) {
      setState(() {
        hours = widget.hours;
        minutes = widget.minutes;
        date = widget.date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      height: 171,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular((screenWidth > 768 ? 8.0 : 0.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          date != null ? WeekDayCard(date: date!) : Container(),
          const SizedBox(height: 4),
          DurationCard(duration: Duration(hours: hours, minutes: minutes)),
          const SizedBox(height: 4),
          CustomIconButton(
            onPressed: () {
              widget.onPressed(widget.columnIndex);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
