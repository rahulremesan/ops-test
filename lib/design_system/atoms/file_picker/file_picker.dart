import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class FilePickerWidget extends ConsumerStatefulWidget {
  final List<String> allowedExtensions;
  final String dialogTitle;
  final int maxFileSize;

  const FilePickerWidget({
    super.key,
    required this.allowedExtensions,
    this.dialogTitle = "Select cover image",
    this.maxFileSize = 10 * 1024 * 1024, // 10 MB
  });

  @override
  ConsumerState<FilePickerWidget> createState() => _FilePickerWidgetState();
}

class _FilePickerWidgetState extends ConsumerState<FilePickerWidget> {
  Uint8List? uploadedFile;
  String? uploadedFileExtension;
  DropzoneViewController? controller;
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

  void _setError(String message) {
    setState(() {
      errorMessage = message;
      uploadedFile = null;
      uploadedFileExtension = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ref.watch(isMobileProvider);
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isMobile)
          _buildMobileUpload(customTypography)
        else
          _buildWebUpload(customTypography),
        if (errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              errorMessage,
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }

  Widget _buildMobileUpload(CustomTypography customTypography) {
    return GestureDetector(
      onTap: _pickFile,
      child: Container(
        height: 157,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.wolFrame),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: uploadedFile == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.upload_file,
                      size: 40,
                      color: AppColors.wolFrame,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Click to upload file",
                      style: TextStyle(
                        fontFamily: customTypography.body2Regular.fontFamily,
                        fontSize: customTypography.body2Regular.fontSize,
                        fontWeight: customTypography.body2Regular.fontWeight,
                        color: Colors.black,
                        letterSpacing: 0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${widget.allowedExtensions.join(', ')} files, no larger than ${widget.maxFileSize / (1024 * 1024)} MB",
                      style: TextStyle(
                        fontFamily: customTypography.caption2Regular.fontFamily,
                        fontSize: customTypography.caption2Regular.fontSize,
                        fontWeight: customTypography.caption2Regular.fontWeight,
                        letterSpacing: 0,
                        color: AppColors.wolFrame,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : _buildFilePreview(),
        ),
      ),
    );
  }

  Widget _buildWebUpload(CustomTypography customTypography) {
    return Stack(
      children: [
        SizedBox(
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
            child: Container(
              height: 157,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isHighlighted ? Colors.blue : AppColors.wolFrame,
                  width: isHighlighted ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(4),
                color: isHighlighted ? Colors.blue.withOpacity(0.1) : null,
              ),
              child: Center(
                child: uploadedFile == null
                    ? _buildUploadPrompt(customTypography)
                    : _buildFilePreview(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onDrop(dynamic event) async {
    setState(() => isHighlighted = false);

    final name = event.name;
    final size = await controller!.getFileSize(event);
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

    final bytes = await controller!.getFileData(event);
    setState(() {
      uploadedFile = bytes;
      uploadedFileExtension = extension;
      errorMessage = '';
    });
  }

  Widget _buildUploadPrompt(CustomTypography customTypography) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Drag and drop or click to add cover image",
          style: TextStyle(
            fontFamily: customTypography.body2Regular.fontFamily,
            fontSize: customTypography.body2Regular.fontSize,
            fontWeight: customTypography.body2Regular.fontWeight,
            color: Colors.black,
            letterSpacing: 0,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          "${widget.allowedExtensions.join(', ')} files, no larger than ${widget.maxFileSize / (1024 * 1024)} MB",
          style: TextStyle(
            fontFamily: customTypography.caption2Regular.fontFamily,
            fontSize: customTypography.caption2Regular.fontSize,
            fontWeight: customTypography.caption2Regular.fontWeight,
            letterSpacing: 0,
            color: AppColors.wolFrame,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildFilePreview() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300, maxHeight: 300),
      child: uploadedFileExtension == 'svg'
          ? SvgPicture.memory(uploadedFile!, fit: BoxFit.contain)
          : Image.memory(
              uploadedFile!,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Text('Error loading image'));
              },
            ),
    );
  }
}
