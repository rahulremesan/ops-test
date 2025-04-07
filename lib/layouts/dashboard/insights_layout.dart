import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/charts/barchart.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class InsightsLayout extends StatelessWidget {
  final String title;
  final List<DateTime> dates;
  final List<List<double>> hoursData;
  final List<String> projects;

  const InsightsLayout({
    super.key,
    required this.title,
    required this.dates,
    required this.hoursData,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              title,
                              style: TextStyle(
                                fontFamily: customTypography.h5Bold.fontFamily,
                                fontSize: customTypography.h5Bold.fontSize,
                                fontWeight: customTypography.h5Bold.fontWeight,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.keyboard_arrow_down),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 0),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: SizedBox(
                  height: screenWidth * 0.5,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: StackedBarChartWidget(
                        dates: dates,
                        hoursData: hoursData,
                        projects: projects,
                      ),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
