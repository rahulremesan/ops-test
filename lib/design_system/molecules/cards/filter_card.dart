import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/atoms/checkbox/text_checkbox.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class FilterCard extends ConsumerStatefulWidget {
  final String heading;
  final List<Map<String, dynamic>> filterData;
  final Function(List<Map<String, dynamic>>) onSelectionChanged;
  final bool isExpanded;

  const FilterCard({
    super.key,
    required this.heading,
    required this.filterData,
    required this.onSelectionChanged,
    this.isExpanded = false,
  });

  @override
  _FilterCardState createState() => _FilterCardState();
}

class _FilterCardState extends ConsumerState<FilterCard> {
  late List<bool> _selections;
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _selections =
        widget.filterData.map((data) => data['status'] as bool).toList();
    _isExpanded = widget.isExpanded;
  }

  void _updateSelection(int index, bool isSelected) {
    setState(() {
      _selections[index] = isSelected;
    });

    final output = List.generate(widget.filterData.length, (i) {
      return {
        'title': widget.filterData[i]['title'],
        'status': _selections[i],
      };
    });

    widget.onSelectionChanged(output);
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                widget.heading,
                style: TextStyle(
                  fontFamily: customTypography.body1Medium.fontFamily,
                  fontSize: customTypography.body1Medium.fontSize,
                  fontWeight: customTypography.body1Medium.fontWeight,
                  color: Colors.black,
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.start,
              spacing: 16,
              runSpacing: 16,
              children: (_isExpanded
                      ? widget.filterData
                      : widget.filterData.take(4).toList())
                  .asMap()
                  .entries
                  .map((entry) {
                int index = entry.key;
                Map<String, dynamic> data = entry.value;
                return TextCheckbox(
                  initialSelected: _selections[index],
                  onChanged: (bool? value) {
                    if (value != null) {
                      _updateSelection(index, value);
                    }
                  },
                  title: data['title'],
                );
              }).toList(),
            ),
            if (widget.filterData.length > 4 && !_isExpanded)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Text(
                    '${widget.filterData.length - 4} More',
                    style: TextStyle(
                      color: AppColors.brandBlue,
                      fontWeight: customTypography.button1Medium.fontWeight,
                      fontSize: customTypography.button1Medium.fontSize,
                      fontFamily: customTypography.button1Medium.fontFamily,
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
