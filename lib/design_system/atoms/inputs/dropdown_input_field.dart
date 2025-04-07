import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class DropdownInputField extends StatefulWidget {
  final List<String> items;
  final String label;
  final String? value;
  final Function(String?)? onChanged;

  const DropdownInputField({
    super.key,
    required this.items,
    required this.label,
    this.value,
    this.onChanged,
  });

  @override
  DropdownInputFieldState createState() => DropdownInputFieldState();
}

class DropdownInputFieldState extends State<DropdownInputField> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  void didUpdateWidget(DropdownInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update selectedValue when widget.value changes
    if (oldWidget.value != widget.value) {
      setState(() {
        selectedValue = widget.value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            widget.label,
            style: TextStyle(
              fontFamily: customTypography.body2Regular.fontFamily,
              fontSize: customTypography.body2Regular.fontSize,
              letterSpacing: 0,
            ),
          ),
          items: widget.items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontFamily: customTypography.body2Regular.fontFamily,
                        fontSize: customTypography.body2Regular.fontSize,
                        fontWeight: customTypography.body2Regular.fontWeight,
                        letterSpacing: 0,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          buttonStyleData: ButtonStyleData(
            padding: const EdgeInsets.all(7.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.platinum, width: 1),
              color: Colors.transparent,
            ),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(color: AppColors.platinum, width: 1),
            ),
            offset: const Offset(0, 4),
            scrollbarTheme: const ScrollbarThemeData(
              radius: Radius.circular(40),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          ),
        ),
      ),
    );
  }
}
