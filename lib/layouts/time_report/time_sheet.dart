import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/activity_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/add_time_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/time_report_details_card.dart';
import 'package:styria_flutter_web/design_system/atoms/modal/time_report_modal.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';

class TimeSheet extends StatefulWidget {
  final DateTime startOfWeek;
  final DateTime currentDate;
  final ValueChanged<Duration> onTotalTimeChanged;

  const TimeSheet({
    super.key,
    required this.startOfWeek,
    required this.currentDate,
    required this.onTotalTimeChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TimeSheetState createState() => _TimeSheetState();
}

class _TimeSheetState extends State<TimeSheet> {
  final Map<DateTime, List<List<ActivityCard>>> weeklyColumns = {};
  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  int currentDayIndex = 0;

  @override
  void initState() {
    super.initState();
    final DateTime today = widget.currentDate;
    final int difference = today.difference(widget.startOfWeek).inDays;

    if (difference >= 0 && difference < 7) {
      currentDayIndex = difference;
    }
  }

  List<List<ActivityCard>> _getWeeklyColumns(DateTime startOfWeek) {
    if (!weeklyColumns.containsKey(startOfWeek)) {
      weeklyColumns[startOfWeek] = List.generate(7, (_) => []);
    }

    return weeklyColumns[startOfWeek]!;
  }

  @override
  void didUpdateWidget(TimeSheet oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.currentDate != oldWidget.currentDate) {
      setState(() {
        final int difference =
            widget.currentDate.difference(widget.startOfWeek).inDays;
        currentDayIndex = difference >= 0 && difference < 7 ? difference : 0;
      });
    }
  }

  void _addCard(int columnIndex, DateTime startOfWeek) {
    final dateForColumn = startOfWeek.add(Duration(days: columnIndex));

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TimeReportModal(
          columnIndex: columnIndex,
          initialCard: null,
          reportDate: dateForColumn,
          onSubmit: (newCard) {
            setState(() {
              _getWeeklyColumns(startOfWeek)[columnIndex].add(newCard);
              _updateTotalTime(startOfWeek);
            });
          },
        );
      },
    );
  }

  void _showPopupForCard(
      ActivityCard card, int columnIndex, DateTime startOfWeek,
      {bool isMove = false}) {
    int? originalColumnIndex;
    if (isMove) {
      originalColumnIndex = _getWeeklyColumns(startOfWeek)
          .indexWhere((col) => col.contains(card));
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return TimeReportModal(
          columnIndex: columnIndex,
          initialCard: card,
          reportDate: widget.currentDate,
          onSubmit: (updatedCard) {
            setState(() {
              if (isMove && originalColumnIndex != null) {
                _getWeeklyColumns(startOfWeek)[originalColumnIndex]
                    .remove(card);
              } else {
                int index =
                    _getWeeklyColumns(startOfWeek)[columnIndex].indexOf(card);
                if (index != -1) {
                  _getWeeklyColumns(startOfWeek)[columnIndex][index] =
                      updatedCard;
                  return;
                }
              }
              _getWeeklyColumns(startOfWeek)[columnIndex].add(updatedCard);
              _updateTotalTime(startOfWeek);
            });
          },
          onDelete: () {
            setState(() {
              _getWeeklyColumns(startOfWeek)[columnIndex].remove(card);
              _updateTotalTime(startOfWeek);
            });
          },
        );
      },
    );
  }

  Map<String, int> calculateTotalHours(List<ActivityCard> cards) {
    int totalMinutes =
        cards.fold(0, (total, card) => total + card.hours * 60 + card.minutes);
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    return {'hours': hours, 'minutes': minutes};
  }

  void _updateTotalTime(DateTime startOfWeek) {
    int totalMinutes = 0;
    for (var column in _getWeeklyColumns(startOfWeek)) {
      totalMinutes += column.fold(
          0, (total, card) => total + card.hours * 60 + card.minutes);
    }
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;
    widget.onTotalTimeChanged(Duration(hours: hours, minutes: minutes));
  }

  @override
  Widget build(BuildContext context) {
    final columns = _getWeeklyColumns(widget.startOfWeek);
    final screenWidth = MediaQuery.of(context).size.width;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateTotalTime(widget.startOfWeek);
    });

    return Scaffold(
      backgroundColor: AppColors.brandBlueSecondary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (screenWidth < 769) {
            final totalHoursAndMinutes =
                calculateTotalHours(columns[currentDayIndex]);
            final hours = totalHoursAndMinutes['hours']!;
            final minutes = totalHoursAndMinutes['minutes']!;

            return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.wolFrame, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      AddTimeCard(
                        hours: hours,
                        minutes: minutes,
                        onPressed: (columnIndex) =>
                            _addCard(currentDayIndex, widget.startOfWeek),
                        columnIndex: currentDayIndex,
                      ),
                      const SizedBox(height: 8),
                      const Divider(thickness: 1, color: AppColors.wolFrame),
                      const SizedBox(height: 8),
                      ...columns[currentDayIndex].map((card) {
                        return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: GestureDetector(
                              onTap: () => _showPopupForCard(
                                  card, currentDayIndex, widget.startOfWeek),
                              child: TimeReportDetailsCard(
                                projectTitle: card.project,
                                color: Colors.green,
                                duration: Duration(
                                    hours: card.hours, minutes: card.minutes),
                                taskTitle: card.task,
                              ),
                            ));
                      }),
                    ],
                  ),
                ));
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(columns.length, (index) {
                    final columnDate =
                        widget.startOfWeek.add(Duration(days: index));
                    final totalHoursAndMinutes =
                        calculateTotalHours(columns[index]);
                    final hours = totalHoursAndMinutes['hours']!;
                    final minutes = totalHoursAndMinutes['minutes']!;
                    return DragTarget<ActivityCard>(
                      onAcceptWithDetails: (details) {
                        final receivedCard = details.data;
                        final copiedCard = ActivityCard(
                          title: receivedCard.title,
                          project: receivedCard.project,
                          task: receivedCard.task,
                          hours: receivedCard.hours,
                          minutes: receivedCard.minutes,
                          workLocation: receivedCard.workLocation,
                        );
                        _showPopupForCard(
                            copiedCard, index, widget.startOfWeek);
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          width: 212,
                          margin: const EdgeInsets.all(8.0),
                          padding: EdgeInsets.only(
                              left: 20.0,
                              right: index == columns.length - 1 ? 20.0 : 4.0),
                          decoration: BoxDecoration(
                            border: Border(
                              left: const BorderSide(color: AppColors.wolFrame),
                              right: index != columns.length - 1
                                  ? BorderSide.none
                                  : const BorderSide(color: AppColors.wolFrame),
                            ),
                          ),
                          child: Column(
                            children: [
                              AddTimeCard(
                                hours: hours,
                                minutes: minutes,
                                date: columnDate,
                                onPressed: (columnIndex) =>
                                    _addCard(columnIndex, widget.startOfWeek),
                                columnIndex: index,
                              ),
                              const SizedBox(height: 20),
                              const Divider(
                                  thickness: 1, color: AppColors.wolFrame),
                              const SizedBox(height: 24),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: columns[index].length,
                                  itemBuilder: (context, cardIndex) {
                                    final card = columns[index][cardIndex];
                                    return Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: Draggable<ActivityCard>(
                                          data: card,
                                          feedback: Material(
                                              child: TimeReportDetailsCard(
                                                  projectTitle: card.project,
                                                  color: Colors.green,
                                                  duration: Duration(
                                                      hours: card.hours,
                                                      minutes: card.minutes),
                                                  taskTitle: card.task)),
                                          childWhenDragging: Opacity(
                                              opacity: 0.3,
                                              child: TimeReportDetailsCard(
                                                  projectTitle: card.project,
                                                  color: Colors.green,
                                                  duration: Duration(
                                                      hours: card.hours,
                                                      minutes: card.minutes),
                                                  taskTitle: card.task)),
                                          child: GestureDetector(
                                              onTap: () => _showPopupForCard(
                                                  card,
                                                  index,
                                                  widget.startOfWeek),
                                              child: TimeReportDetailsCard(
                                                  projectTitle: card.project,
                                                  color: Colors.green,
                                                  duration: Duration(
                                                      hours: card.hours,
                                                      minutes: card.minutes),
                                                  taskTitle: card.task)),
                                        ));
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  })),
            );
          }
        },
      ),
    );
  }
}
