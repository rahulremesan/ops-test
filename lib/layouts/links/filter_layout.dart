import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/filter_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';

class FilterCardProps {
  final String heading;
  final List<Map<String, dynamic>> filterData;
  final Function(List<Map<String, dynamic>>) onSelectionChanged;

  FilterCardProps({
    required this.heading,
    required this.filterData,
    required this.onSelectionChanged,
  });
}

class FilterLayout extends StatelessWidget {
  final List<FilterCardProps> filterCardsProps;

  const FilterLayout({super.key, required this.filterCardsProps});

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
          children: filterCardsProps.expand((props) {
            return [
              FilterCard(
                heading: props.heading,
                filterData: props.filterData,
                onSelectionChanged: props.onSelectionChanged,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 30.0, left: 18, right: 18),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.platinum,
                ),
              ),
            ];
          }).toList()
            ..removeLast(),
        ),
      ),
    );
  }
}
