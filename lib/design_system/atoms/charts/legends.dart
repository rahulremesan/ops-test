import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

Widget legendItem(
    String label, Color color, CustomTypography? customTypography) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(2)),
        ),
      ),
      const SizedBox(width: 4),
      Text(label,
          style: customTypography?.caption1Regular ?? const TextStyle()),
    ],
  );
}
