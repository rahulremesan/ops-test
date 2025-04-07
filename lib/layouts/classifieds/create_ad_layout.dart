import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/secondary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/file_picker/secondary_file_picker.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/dropdown_input_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_text_area_field_fixed.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/secondary_input_field.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/tag.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class CreateAdLayout extends StatefulWidget {
  CreateAdLayout({super.key});

  @override
  State<CreateAdLayout> createState() => _CreateAdLayoutState();
}

class _CreateAdLayoutState extends State<CreateAdLayout> {
  final category = [
    'Cars',
    'Motorcycles',
    'Mobile Phones',
    'Properties',
    'Furniture',
    'Electronics & Appliances',
    'Commercial Vehicles & Spares',
    'Fashion',
    'Books, Sports & Hobbies',
    'Electronics & Computer',
    'Laptops & Accessories',
    'Others',
  ];
  int currentStep = 0;

  buildCategory(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select your Category',
          style: TextStyle(
            fontFamily: customTypography.body2Medium.fontFamily,
            fontSize: customTypography.body2Medium.fontSize,
            fontWeight: customTypography.body2Medium.fontWeight,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: category.map((category) {
            return Tag(
              text: '#$category',
              color: AppColors.brilliantWhite,
              borderColor: AppColors.paleBlueViolet,
              textStyle: TextStyle(
                fontFamily: customTypography.caption1Regular.fontFamily,
                fontSize: customTypography.caption1Regular.fontSize,
                fontWeight: customTypography.caption1Regular.fontWeight,
              ),
            );
          }).toList(),
        )
      ],
    );
  }

  buildBasic(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Details',
          style: TextStyle(
            fontFamily: customTypography.body2Medium.fontFamily,
            fontSize: customTypography.body2Medium.fontSize,
            fontWeight: customTypography.body2Medium.fontWeight,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const SecondaryInputField(
          labelText: 'Product Name',
          placeholder: 'Enter Product Name',
          // controller: amountController,
          obscureText: false,
          keyboardType: TextInputType.text,
        ),
        const SizedBox(
          height: 16,
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SecondaryInputField(
                labelText: 'Price',
                placeholder: 'Enter Price',
                // controller: amountController,
                obscureText: false,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: DropdownInputField(items: ['items'], label: 'Location'),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        const PrimaryTextAreaFieldFixed(labelText: 'Description'),
        const SizedBox(
          height: 16,
        ),
        const SecondaryFilePicker(allowedExtensions: ['png', 'jpeg'])
      ],
    );
  }

  buildContact(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Details',
          style: TextStyle(
            fontFamily: customTypography.body2Medium.fontFamily,
            fontSize: customTypography.body2Medium.fontSize,
            fontWeight: customTypography.body2Medium.fontWeight,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: SecondaryInputField(
                placeholder: 'Enter Contact Number',
                labelText: 'Contact Number',
                obscureText: false,
                keyboardType: TextInputType.phone,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: SecondaryInputField(
                placeholder: 'Enter Email ID',
                labelText: 'Email',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
            )
          ],
        )
      ],
    );
  }

  List<Step> stepList() => [
        Step(
          title: Text(
            'Category',
            style: TextStyle(
                color: currentStep > 0 ? Colors.green : AppColors.brandBlue,
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          stepStyle: StepStyle(
            color: currentStep > 0 ? Colors.green : AppColors.brandBlue,
            connectorColor:
                currentStep > 0 ? Colors.green : AppColors.brandBlue,
          ),
          content: buildCategory(context),
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
        ),
        Step(
          title: Text(
            'Basic',
            style: TextStyle(
              color: currentStep > 1 ? Colors.green : AppColors.brandBlue,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          stepStyle: StepStyle(
            color: currentStep > 1 ? Colors.green : AppColors.brandBlue,
            connectorColor:
                currentStep > 1 ? Colors.green : AppColors.brandBlue,
          ),
          content: buildBasic(context),
          state: currentStep > 1
              ? StepState.complete
              : currentStep == 1
                  ? StepState.indexed
                  : StepState.indexed,
          isActive: currentStep >= 1,
        ),
        Step(
          title: Text('Contact',
              style: TextStyle(
                color: currentStep > 2 ? Colors.green : AppColors.brandBlue,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              )),
          stepStyle: StepStyle(
            color: currentStep > 2 ? Colors.green : AppColors.brandBlue,
          ),
          content: buildContact(context),
          state: currentStep == 2 ? StepState.indexed : StepState.indexed,
          isActive: currentStep >= 2,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 688,
        maxHeight: 680,
      ),
      child: Column(
        children: [
          Expanded(
            child: Stepper(
              stepIconHeight: 32,
              stepIconWidth: 32,
              elevation: 0,
              connectorThickness: 1,
              type: StepperType.horizontal,
              steps: stepList(),
              currentStep: currentStep,
              onStepTapped: (step) {
                setState(() {
                  currentStep = step;
                });
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                return const SizedBox();
              },
            ),
          ),
          currentStep == stepList().length - 1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentStep > 0)
                      SecondaryButton(
                        buttonText: 'Back',
                        onPressed: () {
                          setState(() {
                            currentStep -= 1;
                          });
                        },
                      ),
                    Row(
                      children: [
                        SecondaryButton(
                            buttonText: 'Cancel',
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        const SizedBox(width: 16),
                        PrimaryButton(
                          buttonText: 'Next',
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentStep > 0)
                      SecondaryButton(
                        buttonText: 'Back',
                        onPressed: () {
                          setState(() {
                            currentStep -= 1;
                          });
                        },
                      ),
                    Row(
                      children: [
                        SecondaryButton(
                            buttonText: 'Cancel',
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        const SizedBox(width: 16),
                        PrimaryButton(
                          buttonText: 'Next',
                          onPressed: () {
                            setState(() {
                              currentStep += 1;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
