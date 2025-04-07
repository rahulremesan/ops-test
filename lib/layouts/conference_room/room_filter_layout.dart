import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_select_input.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/filter_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class RoomFilterCardProps {
  final String heading;
  final List<Map<String, dynamic>> filterData;
  final Function(List<Map<String, dynamic>>) onSelectionChanged;

  RoomFilterCardProps({
    required this.heading,
    required this.filterData,
    required this.onSelectionChanged,
  });
}

class RoomFilterLayout extends StatefulWidget {
  final List<RoomFilterCardProps> filterCardsProps;

  const RoomFilterLayout({super.key, required this.filterCardsProps});

  @override
  State<RoomFilterLayout> createState() => _RoomFilterLayoutState();
}

class _RoomFilterLayoutState extends State<RoomFilterLayout> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: Column(
                children: [
                  _buildDateDropdownField(
                    context,
                    'Date',
                    selectedDate,
                    (pickedDate) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const PrimarySelectInput(
                    initialValue: 'All',
                    items: ['All', 'Alcob'],
                    labelText: 'Location',
                  ),
                  const SizedBox(height: 16),
                  const PrimarySelectInput(
                    initialValue: 'All',
                    items: ['All', '1', '2', '3', '4', '5'],
                    labelText: 'Floor',
                  ),
                  const SizedBox(height: 16),
                  const PrimarySelectInput(
                    initialValue: 'Any',
                    items: ['Any', '2', '4', '6', '8', '10', '12'],
                    labelText: 'Capacity',
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.platinum,
                  ),
                ],
              ),
            ),
            Column(
              children: widget.filterCardsProps.expand((props) {
                return [
                  FilterCard(
                    heading: props.heading,
                    filterData: props.filterData,
                    onSelectionChanged: props.onSelectionChanged,
                    isExpanded: true,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Divider(
                      height: 1,
                      color: AppColors.platinum,
                    ),
                  ),
                ];
              }).toList()
                ..removeLast(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateDropdownField(
    BuildContext context,
    String label,
    DateTime? selectedDate,
    ValueChanged<DateTime> onDateSelected,
  ) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          // Trigger the date picker when the field is clicked
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
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            suffixIcon: const Icon(Icons.arrow_drop_down),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.platinum),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.platinum),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
              selectedDate != null
                  ? DateFormat('yyyy-MM-dd').format(selectedDate)
                  : DateFormat('yyyy-MM-dd')
                      .format(DateTime.now()), // Default to today
              style: TextStyle(
                fontFamily: customTypography.body2Regular.fontFamily,
                fontSize: customTypography.body2Regular.fontSize,
                letterSpacing: 0,
              )),
        ),
      ),
    );
  }
}
