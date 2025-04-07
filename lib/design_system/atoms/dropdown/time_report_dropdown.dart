import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class TimeReportDropdown extends StatelessWidget {
  final String title;
  final String placeholder;
  final List<String> listData;
  final String selectedData;
  final Function(String) onSelected;

  const TimeReportDropdown({
    super.key,
    required this.title,
    required this.placeholder,
    required this.listData,
    required this.selectedData,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return TypeAheadFormField<String>(
      textFieldConfiguration: TextFieldConfiguration(
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(
            fontFamily: customTypography.body2Regular.fontFamily,
            fontSize: customTypography.body2Regular.fontSize,
            fontWeight: customTypography.body2Regular.fontWeight,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        style: TextStyle(
          fontFamily: customTypography.body2Medium.fontFamily,
          fontSize: customTypography.body2Medium.fontSize,
          fontWeight: customTypography.body2Medium.fontWeight,
          color: Colors.black87,
        ),
        controller: TextEditingController(text: selectedData),
      ),
      suggestionsCallback: (pattern) {
        return listData
            .where((project) =>
                project.toLowerCase().contains(pattern.toLowerCase()))
            .toList();
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion),
        );
      },
      onSuggestionSelected: (suggestion) {
        onSelected(suggestion);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return placeholder;
        }
        return null;
      },
    );
  }
}
