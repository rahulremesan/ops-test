import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';

class UploadFilePicker extends StatefulWidget {
  final List<String> allowedExtensions;
  final String dialogTitle;
  final int maxFileSize;
  final double height;

  const UploadFilePicker({
    super.key,
    this.allowedExtensions = const ['pdf', 'jpg', 'jpeg', 'png'],
    this.dialogTitle = "Select attachment",
    this.maxFileSize = 10 * 1024 * 1024, // 10 MB
    this.height = 54,
  });

  @override
  _UploadFilePickerState createState() => _UploadFilePickerState();
}

class _UploadFilePickerState extends State<UploadFilePicker> {
  Uint8List? uploadedFile;
  String? uploadedFileName;
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
    }
  }

  void _processFile(PlatformFile file) {
    final extension = file.extension?.toLowerCase();
    
    if (extension == null || !widget.allowedExtensions.contains(extension)) {
      return _setError('Invalid file format. Accepted formats: ${widget.allowedExtensions.join(", ")}');
    }

    if (file.size > widget.maxFileSize) {
      return _setError('File too large. Maximum size: ${(widget.maxFileSize / (1024 * 1024)).toStringAsFixed(2)} MB');
    }

    setState(() {
      uploadedFile = file.bytes;
      uploadedFileName = file.name;
      uploadedFileExtension = extension;
      errorMessage = '';
    });
  }

  Future<void> _onDrop(dynamic event) async {
    setState(() => isHighlighted = false);

    final name = event.name;
    final bytes = await controller.getFileData(event);
    final size = await controller.getFileSize(event);
    final extension = name.split('.').last.toLowerCase();

    if (!widget.allowedExtensions.contains(extension)) {
      return _setError('Invalid file format. Accepted formats: ${widget.allowedExtensions.join(", ")}');
    }

    if (size > widget.maxFileSize) {
      return _setError('File too large. Maximum size: ${(widget.maxFileSize / (1024 * 1024)).toStringAsFixed(2)} MB');
    }

    setState(() {
      uploadedFile = bytes;
      uploadedFileName = name;
      uploadedFileExtension = extension;
      errorMessage = '';
    });
  }

  void _setError(String message) {
    setState(() {
      errorMessage = message;
      uploadedFile = null;
      uploadedFileName = null;
      uploadedFileExtension = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            SizedBox(
              height: widget.height,
              width: double.infinity,
              child: DropzoneView(
                operation: DragOperation.copy,
                cursor: CursorType.grab,
                onCreated: (ctrl) => controller = ctrl,
                onHover: () => setState(() => isHighlighted = true),
                onLeave: () => setState(() => isHighlighted = false),
                onDrop: _onDrop,
                onError: (String? message) => _setError(message ?? 'Upload error'),
              ),
            ),
            GestureDetector(
              onTap: _pickFile,
              child: Container(
                height: widget.height,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isHighlighted ? Colors.blue : AppColors.platinum,
                    width: isHighlighted ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: isHighlighted ? Colors.blue.withOpacity(0.1) : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      uploadedFileName ?? 'Upload an attachment',
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      uploadedFileName != null ? Icons.check : Icons.add,
                      color: uploadedFileName != null ? Colors.green : Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        if (errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              errorMessage,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}