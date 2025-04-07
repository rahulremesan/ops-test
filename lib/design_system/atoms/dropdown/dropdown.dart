import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class CustomWebDropdown extends StatelessWidget {
  final String title;
  final List<String> items;
  final Function(String?) onChanged;

  const CustomWebDropdown({
    super.key,
    required this.title,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          title,
          style: TextStyle(
            fontSize: customTypography.button1Medium.fontSize,
            fontWeight: customTypography.button1Medium.fontWeight,
            color: Colors.white,
            letterSpacing: 0,
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontFamily: customTypography.body3Regular.fontFamily,
                      fontSize: customTypography.body3Regular.fontSize,
                      fontWeight: customTypography.body3Regular.fontWeight,
                      letterSpacing: 0,
                    ),
                  ),
                ))
            .toList(),
        value: null,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          width: 102,
          padding: const EdgeInsets.only(left: 16, right: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.brandBlue,
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          offset: const Offset(0, -4),
          width: 117,
          scrollbarTheme: const ScrollbarThemeData(
            radius: Radius.circular(40),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
        ),
      ),
    );
  }
}
