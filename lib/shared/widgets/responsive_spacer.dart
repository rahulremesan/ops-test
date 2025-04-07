import 'package:flutter/material.dart';

class ResponsiveSpacer extends StatelessWidget {
  final double minWidth;
  final double maxWidth;
  final double percentageOfScreen;

  const ResponsiveSpacer(
      {super.key,
      this.minWidth = 150.0,
      this.maxWidth = 300.0,
      this.percentageOfScreen = 0.2});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double width = (screenWidth * percentageOfScreen).clamp(minWidth, maxWidth);

    return SizedBox(width: width);
  }
}
