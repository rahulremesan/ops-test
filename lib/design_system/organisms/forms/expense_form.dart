import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/file_picker/upload_file_picker.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/dropdown_input_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/secondary_input_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/secondary_text_area_field_fixed.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class ExpenseForm extends ConsumerStatefulWidget {
  const ExpenseForm({super.key});

  @override
  ConsumerState<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends ConsumerState<ExpenseForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController attachmentController = TextEditingController();

  String? selectedCurrency;
  String? selectedProject;
  String? selectedCategory;
  String? selectedApprover;

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    descriptionController.dispose();
    attachmentController.dispose();
    super.dispose();
  }

  void clearAllFields() {
    titleController.clear();
    amountController.clear();
    descriptionController.clear();
    attachmentController.clear();
    setState(() {
      selectedCurrency = null;
      selectedProject = null;
      selectedCategory = null;
      selectedApprover = null;
    });
  }

  Widget _buildInputRow(BuildContext context, List<Widget> children) {
    final isMobile = ref.watch(isMobileProvider);

    if (isMobile) {
      return Column(
        children: children
            .expand((widget) => [
                  widget,
                  const SizedBox(height: 16),
                ])
            .toList()
          ..removeLast(),
      );
    } else {
      return Row(
        children: children
            .expand((widget) => [
                  Expanded(child: widget),
                  const SizedBox(width: 16),
                ])
            .toList()
          ..removeLast(),
      );
    }
  }

  Widget _buildActionButtons(BuildContext context) {
    final isMobile = ref.watch(isMobileProvider);

    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment:
            isMobile ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
        children: [
          if (isMobile)
            Expanded(
              child: Row(
                children: [
                  TertiaryButton(
                    onPressed: () {
                      clearAllFields();
                    },
                    buttonText: 'Clear All',
                  ),
                  const SizedBox(
                    height: 16,
                    width: 16,
                  ),
                  PrimaryButton(
                    onPressed: () {},
                    buttonText: 'Create',
                  ),
                ],
              ),
            )
          else ...[
            TertiaryButton(
              onPressed: () {
                clearAllFields();
              },
              buttonText: 'Clear All',
            ),
            const SizedBox(width: 16),
            PrimaryButton(
              onPressed: () {},
              buttonText: 'Create',
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAttachmentSection(BuildContext context) {
    final isMobile = ref.watch(isMobileProvider);

    if (isMobile) {
      return Column(
        children: [
          SecondaryInputField(
            labelText: 'Enter attachment name',
            placeholder: 'Attachment name',
            controller: attachmentController,
            obscureText: false,
          ),
          const SizedBox(height: 16),
          const UploadFilePicker(),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: SecondaryInputField(
              labelText: 'Enter attachment name',
              placeholder: 'Attachment name',
              controller: attachmentController,
              obscureText: false,
            ),
          ),
          const SizedBox(width: 16),
          const Expanded(
            child: UploadFilePicker(),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final padding = ref.watch(isMobileProvider) ? 16.0 : 24.0;

    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create expense',
            style: TextStyle(
              fontFamily: customTypography.h5Bold.fontFamily,
              fontSize: customTypography.h5Bold.fontSize,
              fontWeight: customTypography.h5Bold.fontWeight,
            ),
          ),
          SizedBox(height: padding),
          SecondaryInputField(
            labelText: 'Title',
            placeholder: 'Enter title',
            controller: titleController,
            obscureText: false,
          ),
          const SizedBox(height: 16),
          _buildInputRow(
            context,
            [
              SecondaryInputField(
                labelText: 'Total amount',
                placeholder: 'Enter amount',
                controller: amountController,
                obscureText: false,
                keyboardType: TextInputType.number,
              ),
              DropdownInputField(
                label: "Select currency",
                items: const ["USD", "EUR", "GBP"],
                value: selectedCurrency,
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInputRow(
            context,
            [
              DropdownInputField(
                label: " Select Project Name",
                items: const ["Option 1", "Option 2", "Option 3"],
                value: selectedProject,
                onChanged: (value) {
                  setState(() {
                    selectedProject = value;
                  });
                },
              ),
              DropdownInputField(
                label: " Select reimbursement category",
                items: const ["Option 1", "Option 2", "Option 3"],
                value: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          DropdownInputField(
            label: " Select Approver",
            items: const ["Option 1", "Option 2", "Option 3"],
            value: selectedApprover,
            onChanged: (value) {
              setState(() {
                selectedApprover = value;
              });
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: SecondaryTextAreaFieldFixed(
                  labelText: 'Description',
                  controller: descriptionController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildAttachmentSection(context),
          SizedBox(height: padding),
          _buildActionButtons(context),
        ],
      ),
    );
  }
}
