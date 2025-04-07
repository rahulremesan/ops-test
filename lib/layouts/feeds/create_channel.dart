import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/secondary_input_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/title_description_mixed_field.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class CreateChannel extends StatefulWidget {
  final String heading;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController typeController;
  // final void Function(String? visibility) onVisibilityChanged;
  final VoidCallback onClear;
  final VoidCallback onSubmit;
  const CreateChannel({
    super.key,
    required this.heading,
    required this.titleController,
    required this.descriptionController,
    required this.typeController,
    // required this.onVisibilityChanged,
    required this.onClear,
    required this.onSubmit,
  });

  @override
  State<CreateChannel> createState() => _CreateChannelState();
}

class _CreateChannelState extends State<CreateChannel> {
  // String? visibility;

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.heading,
                  style: TextStyle(
                    fontFamily: customTypography.body1Bold.fontFamily,
                    fontSize: customTypography.body1Bold.fontSize,
                    fontWeight: customTypography.body1Bold.fontWeight,
                  ),
                ),
                TextButton(
                  style: const ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  onPressed: widget.onClear,
                  child: const Padding(
                    padding:  EdgeInsets.only(right: 5),
                    child:  Text(
                      'Clear All',
                      style: TextStyle(
                        color: AppColors.brandBlue,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 16,
                      ),
                      child: Icon(
                        Icons.title,
                        size: 20,
                        color: AppColors.wolFrame,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 18,
                      ),
                      child: Icon(
                        Icons.notes,
                        size: 20,
                        color: AppColors.wolFrame,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SizedBox(
                    height: 138,
                    child: TitleDescriptionMixedField(
                      titleController: widget.titleController,
                      descriptionController: widget.descriptionController,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Icon(
                  Icons.tag_sharp,
                  size: 20,
                  color: AppColors.wolFrame,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: SizedBox(
                    height: 38,
                    child: SecondaryInputField(
                      placeholder: 'Type',
                      obscureText: false,
                      controller: widget.typeController,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // Row(
            //   children: [
            //     const Icon(
            //       Icons.remove_red_eye_outlined,
            //       size: 20,
            //       color: AppColors.wolFrame,
            //     ),
            //     const SizedBox(
            //       width: 16,
            //     ),
            //     Container(
            //       decoration: BoxDecoration(
            //         border: Border.all(
            //           width: 1,
            //           color: AppColors.blackWash,
            //         ),
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.only(
            //           right: 12,
            //           left: 4,
            //           top: 2,
            //           bottom: 2,
            //         ),
            //         child: Row(
            //           children: [
            //             Radio<String>(
            //               fillColor:
            //                   const WidgetStatePropertyAll(AppColors.black06),
            //               overlayColor:
            //                   const WidgetStatePropertyAll(Colors.transparent),
            //               value: 'Private',
            //               groupValue: visibility,
            //               onChanged: (value) {
            //                 setState(() {
            //                   visibility = value;
            //                 });
            //                 widget.onVisibilityChanged(value);
            //               },
            //               activeColor: AppColors.brandBlue,
            //             ),
            //             const Text('Private'),
            //           ],
            //         ),
            //       ),
            //     ),
            //     const SizedBox(width: 20),
            //     Container(
            //       decoration: BoxDecoration(
            //         border: Border.all(
            //           width: 1,
            //           color: AppColors.blackWash,
            //         ),
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       child: Padding(
            //         padding: const EdgeInsets.only(
            //           right: 12,
            //           left: 4,
            //           top: 2,
            //           bottom: 2,
            //         ),
            //         child: Row(
            //           children: [
            //             Radio<String>(
            //               fillColor:
            //                   const WidgetStatePropertyAll(AppColors.black06),
            //               overlayColor:
            //                   const WidgetStatePropertyAll(Colors.transparent),
            //               value: 'Public',
            //               groupValue: visibility,
            //               onChanged: (value) {
            //                 setState(() {
            //                   visibility = value;
            //                 });
            //                 widget.onVisibilityChanged(value);
            //               },
            //               activeColor: AppColors.brandBlue,
            //             ),
            //             const Text('Public'),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 60,
            ),
            PrimaryButton(
              buttonText: 'Publish',
              onPressed: widget.onSubmit,
            )
          ],
        ),
      ),
    );
  }
}
