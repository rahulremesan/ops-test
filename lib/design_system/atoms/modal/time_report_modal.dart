import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/activity_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/location_card.dart';
import 'package:styria_flutter_web/design_system/atoms/dropdown/time_report_dropdown.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/tertiary_input_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/time_input_field.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class TimeReportModal extends ConsumerStatefulWidget {
  final Function(ActivityCard) onSubmit;
  final Function()? onDelete;
  final ActivityCard? initialCard;
  final int columnIndex;
  final DateTime reportDate;

  const TimeReportModal({
    super.key,
    required this.onSubmit,
    this.onDelete,
    this.initialCard,
    required this.columnIndex,
    required this.reportDate,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TimeReportModalState createState() => _TimeReportModalState();
}

class _TimeReportModalState extends ConsumerState<TimeReportModal> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String selectedProject = '';
  String selectedTask = '';
  int hours = 0;
  int minutes = 0;
  String selectedWorkLocation = 'Tarento office';
  String? timeError;

  final List<String> availableProjects = ['Design', 'Development', 'Marketing'];
  final List<String> availableTasks = ['Task A', 'Task B', 'Task C'];

  @override
  void initState() {
    super.initState();
    if (widget.initialCard != null) {
      title = widget.initialCard!.title;
      selectedProject = widget.initialCard!.project;
      selectedTask = widget.initialCard!.task;
      hours = widget.initialCard!.hours;
      minutes = widget.initialCard!.minutes;
      selectedWorkLocation = widget.initialCard!.workLocation;
    }
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final isMobile = ref.watch(isMobileProvider);

    if (isMobile) {
      return _buildMobileLayout(customTypography);
    }

    return _buildDesktopLayout(customTypography);
  }

  Widget _buildMobileLayout(CustomTypography customTypography) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Remove default back button
        title: Text(
          DateFormat('dd MMM, EEEE').format(widget.reportDate),
          style: TextStyle(
            color: AppColors.lacqueredLiquorice,
            fontFamily: customTypography.body1Bold.fontFamily,
            fontSize: customTypography.body1Bold.fontSize,
            fontWeight: customTypography.body1Bold.fontWeight,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
            color: AppColors.lacqueredLiquorice,
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TertiaryInputField(
                  label: "Activity",
                  message: "Activity is required",
                  initialValue: title,
                  onChanged: (value) {
                    title = value;
                  },
                ),
                const SizedBox(height: 16),
                TimeReportDropdown(
                  title: "Project",
                  placeholder: "Please select a project",
                  listData: availableProjects,
                  selectedData: selectedProject,
                  onSelected: (project) {
                    setState(() {
                      selectedProject = project;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TimeReportDropdown(
                  title: "Task",
                  placeholder: "Please select a task",
                  listData: availableTasks,
                  selectedData: selectedTask,
                  onSelected: (task) {
                    setState(() {
                      selectedTask = task;
                    });
                  },
                ),
                const SizedBox(height: 16),
                _buildTimeFields(),
                const SizedBox(height: 16),
                _workLocationSelection(),
                const SizedBox(height: 24),
                _buildActionButtons(true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(CustomTypography customTypography) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: AppColors.lacqueredLiquorice,
        fontFamily: customTypography.body1Bold.fontFamily,
        fontSize: customTypography.body1Bold.fontSize,
        fontWeight: customTypography.body1Bold.fontWeight,
      ),
      title: Text(
        DateFormat('dd MMM, EEEE').format(widget.reportDate),
      ),
      content: SizedBox(
        width: 500,
        height: MediaQuery.of(context).size.height * 0.45,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TertiaryInputField(
                label: "Activity",
                message: "Activity is required",
                initialValue: title,
                onChanged: (value) {
                  title = value;
                },
              ),
              const SizedBox(height: 16),
              TimeReportDropdown(
                title: "Project",
                placeholder: "Please select a project",
                listData: availableProjects,
                selectedData: selectedProject,
                onSelected: (project) {
                  setState(() {
                    selectedProject = project;
                  });
                },
              ),
              const SizedBox(height: 16),
              TimeReportDropdown(
                title: "Task",
                placeholder: "Please select a task",
                listData: availableTasks,
                selectedData: selectedTask,
                onSelected: (task) {
                  setState(() {
                    selectedTask = task;
                  });
                },
              ),
              const SizedBox(height: 16),
              _buildTimeFields(),
              const SizedBox(height: 16),
              _workLocationSelection(),
            ],
          ),
        ),
      ),
      actions: [_buildActionButtons(false)],
    );
  }

  Widget _buildActionButtons(bool isMobile) {
    return Row(
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.center : MainAxisAlignment.end,
      children: [
        if (widget.onDelete != null)
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            onPressed: () {
              widget.onDelete!();
              Navigator.of(context).pop();
            },
            child: const Text('DELETE'),
          ),
        const SizedBox(width: 8),
        PrimaryButton(
          buttonText: widget.initialCard == null ? "SAVE" : "UPDATE",
          onPressed: () {
            setState(() {
              timeError = (hours == 0 && minutes == 0)
                  ? 'Please enter valid time'
                  : null;
            });
            if (_formKey.currentState!.validate() && timeError == null) {
              final newCard = ActivityCard(
                title: title,
                project: selectedProject,
                task: selectedTask,
                hours: hours,
                minutes: minutes,
                workLocation: selectedWorkLocation,
              );
              widget.onSubmit(newCard);
              Navigator.of(context).pop();
            }
          },
        )
      ],
    );
  }

  Widget _buildTimeFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TimeInputField(
            label: 'Hours',
            initialValue: hours,
            step: 1,
            maxValue: 23,
            errorText: timeError,
            onChanged: (newHours) {
              setState(() {
                hours = newHours;
                timeError = (hours == 0 && minutes == 0)
                    ? 'Please enter valid time'
                    : null;
              });
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TimeInputField(
            label: 'Minutes',
            initialValue: minutes,
            step: 15,
            maxValue: 45,
            errorText: timeError,
            onChanged: (newMinutes) {
              setState(() {
                minutes = newMinutes;
                timeError = (hours == 0 && minutes == 0)
                    ? 'Please enter valid time'
                    : null;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _workLocationSelection() {
    final isMobile = ref.watch(isMobileProvider);
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: isMobile ? 8 : 16,
        runSpacing: 16.0,
        children: [
          LocationCard(
            icon: Icons.business_center,
            label: 'Tarento office',
            isSelected: selectedWorkLocation == 'Tarento office',
            onTap: () => _selectWorkLocation('Tarento office'),
          ),
          LocationCard(
            icon: Icons.account_balance,
            label: 'Client Site',
            isSelected: selectedWorkLocation == 'Client Site',
            onTap: () => _selectWorkLocation('Client Site'),
          ),
          LocationCard(
            icon: Icons.home,
            label: 'WFH',
            isSelected: selectedWorkLocation == 'WFH',
            onTap: () => _selectWorkLocation('WFH'),
          ),
        ],
      ),
    );
  }

  void _selectWorkLocation(String location) {
    setState(() {
      selectedWorkLocation = location;
    });
  }
}
