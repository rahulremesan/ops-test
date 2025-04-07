import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/secondary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/secondary_input_field.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class CreateRoomBookingModal extends StatefulWidget {
  final Function(Map<String, dynamic>) onSubmit;
  final Function()? onCancel;

  const CreateRoomBookingModal({
    super.key,
    required this.onSubmit,
    this.onCancel,
  });

  @override
  _CreateRoomBookingModalState createState() => _CreateRoomBookingModalState();
}

class _CreateRoomBookingModalState extends State<CreateRoomBookingModal> {
  final _formKey = GlobalKey<FormState>();
  String meetingTitle = '';
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? errorMessage; // To store the error message

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Colors.white,
      actionsPadding:
          const EdgeInsets.only(bottom: 24, top: 16, right: 24, left: 24),
      contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      content: Form(
        key: _formKey,
        child: SizedBox(
          width: 688,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Book room",
                    style: TextStyle(
                      fontFamily: customTypography.h5Bold.fontFamily,
                      fontSize: customTypography.h5Bold.fontSize,
                      fontWeight: customTypography.h5Bold.fontWeight,
                      letterSpacing: 0,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
              if (errorMessage != null) // Show error message if it exists
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 16,
              ),
              SecondaryInputField(
                obscureText: false,
                placeholder: '',
                labelText: "Meeting Title",
                onChanged: (value) {
                  meetingTitle = value;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildDatePicker('Start Date', startDate,
                        (selectedDate) {
                      setState(() {
                        startDate = selectedDate;
                      });
                    }),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child:
                        _buildDatePicker('End Date', endDate, (selectedDate) {
                      setState(() {
                        endDate = selectedDate;
                      });
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildTimePicker('Start Time', startTime,
                        (selectedTime) {
                      setState(() {
                        startTime = selectedTime;
                      });
                    }),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child:
                        _buildTimePicker('End Time', endTime, (selectedTime) {
                      setState(() {
                        endTime = selectedTime;
                      });
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        SizedBox(
          height: 36,
          child: SecondaryButton(
            buttonText: "Cancel",
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        SizedBox(
          height: 36,
          child: PrimaryButton(
            buttonText: "Book",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                if (meetingTitle.isEmpty ||
                    startDate == null ||
                    endDate == null ||
                    startTime == null ||
                    endTime == null) {
                  setState(() {
                    errorMessage = "Please complete all required fields.";
                  });
                  return;
                }

                // Clear the error message on successful validation
                setState(() {
                  errorMessage = null;
                });

                widget.onSubmit({
                  'meetingTitle': meetingTitle,
                  'startDate': startDate,
                  'endDate': endDate,
                  'startTime': startTime,
                  'endTime': endTime,
                });
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDatePicker(String label, DateTime? selectedDate,
      ValueChanged<DateTime> onDateSelected) {
    return TextFormField(
      readOnly: true, // Prevents keyboard from appearing
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.calendar_today_outlined),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.platinum), // Grey border when not focused
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.platinum), // Grey border when focused
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      controller: TextEditingController(
        text: selectedDate != null
            ? DateFormat('yyyy-MM-dd').format(selectedDate)
            : '',
      ),
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
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
                    borderRadius: BorderRadius.circular(16),
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
          onDateSelected(pickedDate);
        }
      },
    );
  }

  Widget _buildTimePicker(String label, TimeOfDay? selectedTime,
      ValueChanged<TimeOfDay> onTimeSelected) {
    return TextFormField(
      readOnly: true, // Prevents keyboard from appearing
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: const Icon(Icons.access_time_outlined),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.platinum), // Grey border when not focused
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.platinum), // Grey border when focused
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      controller: TextEditingController(
        text: selectedTime != null ? selectedTime.format(context) : '',
      ),
      onTap: () async {
        final pickedTime = await showTimePicker(
          context: context,
          initialTime: selectedTime ?? TimeOfDay.now(),
        );
        if (pickedTime != null) {
          onTimeSelected(pickedTime);
        }
      },
    );
  }
}
