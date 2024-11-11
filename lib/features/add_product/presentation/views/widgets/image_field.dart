import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImageSelected});

  final ValueChanged<File?> onImageSelected;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;

  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          try {
            await pickImage();
          } on Exception catch (e) {
            log(e.toString());
          }

          setState(() {
            isLoading = false;
          });
        },
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 5 / 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: fileImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.file(
                          fileImage!,
                          fit: BoxFit.contain,
                        ),
                      )
                    : Icon(
                        Icons.image_outlined,
                        size: 180,
                        color: Colors.grey[400],
                      ),
              ),
            ),
            Visibility(
              visible: fileImage != null,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      fileImage = null;
                    });
                    widget.onImageSelected(fileImage);
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  )),
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      fileImage = File(image.path);
    }

    widget.onImageSelected(fileImage);
  }
}
