import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class TextCheckbox extends StatefulWidget {
  final String? title;
  final bool initialSelected;
  final ValueChanged<bool> onChanged;

  const TextCheckbox({
    super.key,
    this.title,
    this.initialSelected = false,
    required this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TextCheckboxState createState() => _TextCheckboxState();
}

class _TextCheckboxState extends State<TextCheckbox> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.initialSelected;
  }

  void _toggleCheckbox() {
    setState(() {
      isSelected = !isSelected;
    });
    widget.onChanged(isSelected);
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.platinum,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: IntrinsicWidth(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: _toggleCheckbox,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected
                            ? AppColors.brandBlue
                            : AppColors.wolFrame,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(4),
                      color:
                          isSelected ? AppColors.brandBlue : Colors.transparent,
                    ),
                    width: 20,
                    height: 20,
                    child: isSelected
                        ? const Icon(Icons.check, color: Colors.white, size: 16)
                        : null,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 10),
                child: Text(
                  softWrap: false,
                  widget.title ?? '',
                  style: TextStyle(
                    fontFamily: customTypography.body2Regular.fontFamily,
                    fontSize: customTypography.body2Medium.fontSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
