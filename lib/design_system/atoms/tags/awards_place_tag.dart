import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class AwardsPlaceTag extends StatelessWidget {
  final int place;
  const AwardsPlaceTag({
    super.key,
    required this.place,
  });

  String getOrdinalSuffix(int place) {
    if (place == 1) {
      return 'st';
    } else if (place == 2) {
      return 'nd';
    } else if (place == 3) {
      return 'rd';
    } else {
      return 'th';
    }
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      width: 33.94,
      height: 34,
      decoration: BoxDecoration(
        color: AppColors.brandBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$place',
            style: TextStyle(
              fontFamily: customTypography.title2Bold.fontFamily,
              fontSize: customTypography.title2Bold.fontSize,
              fontWeight: customTypography.title2Bold.fontWeight,
              color: Colors.white,
            ),
          ),
          Text(
            getOrdinalSuffix(place),
            style: TextStyle(
                fontFamily: customTypography.title3Bold.fontFamily,
                fontSize: customTypography.title3Bold.fontSize,
                fontWeight: customTypography.title3Bold.fontWeight,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
