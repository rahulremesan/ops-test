import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/secondary_button.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class SecondaryFilePicker extends StatefulWidget {
  final List<String> allowedExtensions;
  final String dialogTitle;
  final int maxFileSize;

  const SecondaryFilePicker({
    super.key,
    required this.allowedExtensions,
    this.dialogTitle = "Select cover image",
    this.maxFileSize = 10 * 1024 * 1024, // 10 MB
  });

  @override
  _SecondaryFilePickerState createState() => _SecondaryFilePickerState();
}

class _SecondaryFilePickerState extends State<SecondaryFilePicker> {
  Uint8List? uploadedFile;
  String? uploadedFileExtension;
  late DropzoneViewController controller;
  bool isHighlighted = false;
  String errorMessage = '';

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: widget.allowedExtensions,
      allowMultiple: false,
      withData: true,
    );

    if (result != null && result.files.isNotEmpty) {
      _processFile(result.files.first);
    } else {
      _setError('No file was selected. Please choose a file to upload.');
    }
  }

  void _processFile(PlatformFile file) {
    final extension = file.extension?.toLowerCase();
    final fileSizeMB = file.size / (1024 * 1024);

    if (extension == null || !widget.allowedExtensions.contains(extension)) {
      return _setError('Error: "${file.name}" is not an accepted file format. '
          'Please upload a file with one of the following extensions: ${widget.allowedExtensions.join(", ")}.');
    }

    if (file.size > widget.maxFileSize) {
      return _setError(
          'Error: The file "${file.name}" exceeds the maximum file size of ${(widget.maxFileSize / (1024 * 1024)).toStringAsFixed(2)} MB. '
          'Please select a smaller file.');
    }

    setState(() {
      uploadedFile = file.bytes;
      uploadedFileExtension = extension;
      errorMessage = '';
    });
  }

  Future<void> _onDrop(dynamic event) async {
    setState(() => isHighlighted = false);

    final name = event.name;
    final size = await controller.getFileSize(event);
    final extension = name.split('.').last.toLowerCase();

    if (!widget.allowedExtensions.contains(extension)) {
      return _setError(
          'Error: The file "$name" is not an accepted file format. '
          'Please upload a file with one of the following extensions: ${widget.allowedExtensions.join(", ")}.');
    }

    if (size > widget.maxFileSize) {
      return _setError(
          'Error: The file "$name" exceeds the maximum file size of ${(widget.maxFileSize / (1024 * 1024)).toStringAsFixed(2)} MB. '
          'Please select a smaller file.');
    }

    final bytes = await controller.getFileData(event);
    setState(() {
      uploadedFile = bytes;
      uploadedFileExtension = extension;
      errorMessage = '';
    });
  }

  void _setError(String message) {
    setState(() {
      errorMessage = message;
      uploadedFile = null;
      uploadedFileExtension = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              color: AppColors.primary_50,
              height: 157,
              width: double.infinity,
              child: DropzoneView(
                operation: DragOperation.copy,
                cursor: CursorType.grab,
                onCreated: (ctrl) => controller = ctrl,
                onHover: () => setState(() => isHighlighted = true),
                onLeave: () => setState(() => isHighlighted = false),
                onDrop: _onDrop,
                onError: (String? message) => _setError('Error: $message'),
              ),
            ),
            GestureDetector(
              onTap: _pickFile,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: DottedBorder(
                  color: AppColors.brandBlue,
                  strokeWidth: 1,
                  dashPattern: const [12, 12],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8),
                  child: Container(
                    height: 157,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:
                          isHighlighted ? Colors.blue.withOpacity(0.1) : null,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Drag and drop file or",
                            style: TextStyle(
                              fontFamily:
                                  customTypography.body2Regular.fontFamily,
                              fontSize: customTypography.body2Regular.fontSize,
                              fontWeight:
                                  customTypography.body2Regular.fontWeight,
                              color: Colors.black,
                              letterSpacing: 0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          SecondaryButton(
                            buttonText: 'Add Images',
                            onPressed: _pickFile,
                            icon: Icons.add,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Only support .${widget.allowedExtensions.join(", .")}',
                            style: TextStyle(
                              fontFamily:
                                  customTypography.caption2Regular.fontFamily,
                              fontSize:
                                  customTypography.caption2Regular.fontSize,
                              fontWeight:
                                  customTypography.caption2Regular.fontWeight,
                              color: Colors.black,
                              letterSpacing: 0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (uploadedFile != null) _buildFilePreview(),
        if (errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              errorMessage,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFilePreview() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: AppColors.blackWash,
            width: 0.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              uploadedFileExtension != null
                  ? 'file.$uploadedFileExtension'
                  : 'Uploaded File',
              style:
                  const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 8.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  uploadedFile = null;
                  uploadedFileExtension = null;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 10.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
