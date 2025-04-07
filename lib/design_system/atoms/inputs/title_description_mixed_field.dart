import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class TitleDescriptionMixedField extends StatelessWidget {
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final FocusNode? titleFocusNode;
  const TitleDescriptionMixedField({
    super.key,
    this.titleController,
    this.descriptionController,
    this.titleFocusNode,
  });

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
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              focusNode: titleFocusNode,
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: TextStyle(
                  color: AppColors.black06,
                  fontFamily: customTypography.body3Regular.fontFamily,
                  fontSize: customTypography.body3Regular.fontSize,
                ),
                border: InputBorder.none,
              ),
            ),
            TextField(
              controller: descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Add Description',
                hintStyle: TextStyle(
                  color: AppColors.black06,
                  fontFamily: customTypography.body3Regular.fontFamily,
                  fontSize: customTypography.body3Regular.fontSize,
                ),
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
