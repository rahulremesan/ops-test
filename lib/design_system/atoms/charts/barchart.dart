import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/atoms/charts/legends.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class StackedBarChartWidget extends StatelessWidget {
  final List<DateTime> dates;
  final List<List<double>> hoursData;
  final List<String> projects;

  final List<Color> baseColors = [
    AppColors.oilGreen,
    AppColors.capucineOrange,
    AppColors.paleCeruleanBlue,
  ];

  List<Color> _generateColors() {
    List<Color> colors = List.from(baseColors);
    if (projects.length <= baseColors.length) return colors;

    for (int i = baseColors.length; i < projects.length; i++) {
      final hue = (360 * (i / projects.length)) % 360;
      colors.add(HSVColor.fromAHSV(1.0, hue, 0.7, 0.9).toColor());
    }
    return colors;
  }

  // Helper function to get the current week's Monday from a given date
  DateTime _getMonday(DateTime date) {
    int dayOffset = date.weekday - DateTime.monday;
    return date.subtract(Duration(days: dayOffset));
  }

  // Generate dates from Monday to Sunday based on the provided date
  List<DateTime> _getWeekFromMonday(DateTime date) {
    DateTime monday = _getMonday(date);
    return List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  StackedBarChartWidget({
    super.key,
    required this.dates,
    required this.hoursData,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customTypography = theme.extension<CustomTypography>();
    final projectColors = _generateColors();

    // Ensure the displayed dates start from Monday
    final mondayDates = _getWeekFromMonday(dates.first);

    final screenWidth = MediaQuery.of(context).size.width;

    double customAspectRatio;
    if (screenWidth < 600) {
      customAspectRatio = 1.4;
    } else if (screenWidth < 768) {
      customAspectRatio = 2.5;
    } else if (screenWidth < 992) {
      customAspectRatio = 2.5;
    } else if (screenWidth < 1400) {
      customAspectRatio = 2.8;
    } else if (screenWidth < 1600) {
      customAspectRatio = 2.8;
    } else {
      customAspectRatio = 2.3;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AspectRatio(
          aspectRatio: customAspectRatio,
          child: BarChart(
            BarChartData(
              maxY: 8,
              alignment: BarChartAlignment.spaceAround,
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  tooltipRoundedRadius: 8,
                  tooltipPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  tooltipMargin: 8,
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    String dateStr = DateFormat('E, MMM d')
                        .format(mondayDates[group.x.toInt()]);
                    String projectName = projects[rodIndex];
                    double hours = rod.toY - rod.fromY;
                    return BarTooltipItem(
                      '$dateStr\n$projectName: ${hours.toStringAsFixed(1)} hrs',
                      customTypography?.body3Regular ??
                          const TextStyle(color: Colors.white),
                    );
                  },
                  getTooltipColor: (group) => Colors.grey.withOpacity(0.8),
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() >= 0 && value.toInt() < 7) {
                        return Text(
                          DateFormat('EEE')
                              .format(mondayDates[value.toInt()]),
                          style: customTypography?.caption1Regular
                                  .copyWith(color: Colors.black) ??
                              const TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        );
                      }
                      return const Text('');
                    },
                    reservedSize: 25,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: 1,
                    getTitlesWidget: (value, meta) => Text(
                      '${value.toInt()}h',
                      style: customTypography?.caption1Regular ??
                          const TextStyle(),
                    ),
                  ),
                ),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: false),
              barGroups: List.generate(7, (index) {
                double stackedHeight = 0;
                return BarChartGroupData(
                  x: index,
                  groupVertically: true,
                  barRods:
                      List.generate(hoursData[index].length, (projectIndex) {
                    const spacing = 0.05;
                    final rodData = BarChartRodData(
                      toY: stackedHeight + hoursData[index][projectIndex],
                      fromY: stackedHeight,
                      color: projectColors[projectIndex],
                      width: 15,
                      borderRadius: BorderRadius.circular(4),
                    );
                    stackedHeight += hoursData[index][projectIndex] + spacing;
                    return rodData;
                  }),
                  barsSpace: 8,
                );
              }),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.grey.withOpacity(0.2),
                    strokeWidth: 1,
                    dashArray: [5, 5],
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: List.generate(projects.length, (index) {
            return legendItem(
                projects[index], projectColors[index], customTypography);
          }),
        ),
      ],
    );
  }
}
