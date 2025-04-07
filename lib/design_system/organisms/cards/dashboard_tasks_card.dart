import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/pending_tasks_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class TasksCardItems {
  final String taskName;
  final DateTime date;
  final String assignee;
  bool isChecked;

  TasksCardItems({
    required this.taskName,
    required this.date,
    required this.assignee,
    this.isChecked = false,
  });
}

class DashboardTasksCard extends StatefulWidget {
  final List<TasksCardItems> tasksCardItems;
  const DashboardTasksCard({
    super.key,
    required this.tasksCardItems,
  });

  @override
  State<DashboardTasksCard> createState() => _DashboardTasksCardState();
}

class _DashboardTasksCardState extends State<DashboardTasksCard> {
  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 20,
          bottom: 26,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    'Pending Tasks',
                    style: TextStyle(
                      fontFamily: customTypography.h5Bold.fontFamily,
                      fontSize: customTypography.h5Bold.fontSize,
                      fontWeight: customTypography.h5Bold.fontWeight,
                    ),
                  ),
                ),
                TertiaryButton(
                  buttonText: 'View all',
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            ...widget.tasksCardItems.map((task) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.brandBlueSecondary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 16,
                        left: 4,
                        right: 17,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.scale(
                            scale: 1,
                            child: Checkbox(
                              shape: const CircleBorder(),
                              value: task.isChecked,
                              side: const BorderSide(
                                color: AppColors.neutral_300,
                                width: 1,
                              ),
                              hoverColor: Colors.transparent,
                              onChanged: (bool? value) {
                                setState(() {
                                  task.isChecked = value ?? false;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: PendingTasksCard(
                              taskName: task.taskName,
                              date: task.date,
                              assignee: task.assignee,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
