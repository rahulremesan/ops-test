import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ClassifiedsItemCard extends StatefulWidget {
  final String? productImage;
  final String itemPrice;
  final String itemName;
  final String location;
  final String date;
  final bool? isSecondary;
  const ClassifiedsItemCard({
    super.key,
    this.productImage,
    required this.itemPrice,
    required this.itemName,
    required this.location,
    required this.date,
    this.isSecondary = false,
  });

  @override
  State<ClassifiedsItemCard> createState() => _ClassifiedsItemCardState();
}

class _ClassifiedsItemCardState extends State<ClassifiedsItemCard> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
            maxWidth: 395,
            ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!widget.isSecondary!)
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 224,
                    minWidth: 385,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.productImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              if (!widget.isSecondary!)
                const SizedBox(
                  height: 16,
                ),
              Text('₹${widget.itemPrice}',
                  style: TextStyle(
                    fontFamily: customTypography.h4Medium.fontFamily,
                    fontSize: customTypography.h4Medium.fontSize,
                    fontWeight: customTypography.h4Medium.fontWeight,
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                widget.itemName,
                style: TextStyle(
                  fontFamily: customTypography.body2Medium.fontFamily,
                  fontSize: customTypography.body2Medium.fontSize,
                  fontWeight: customTypography.body2Medium.fontWeight,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.location,
                    style: TextStyle(
                      fontFamily: customTypography.body2Regular.fontFamily,
                      fontSize: customTypography.body2Regular.fontSize,
                      fontWeight: customTypography.body2Regular.fontWeight,
                    ),
                  ),
                  Text(
                    widget.date,
                    style: TextStyle(
                      fontFamily: customTypography.body2Regular.fontFamily,
                      fontSize: customTypography.body2Regular.fontSize,
                      fontWeight: customTypography.body2Regular.fontWeight,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
