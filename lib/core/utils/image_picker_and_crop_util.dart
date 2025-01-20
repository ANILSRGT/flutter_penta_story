import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/configs/constants/app_icons.dart';

final class ImagePickerUtil {
  const ImagePickerUtil._();

  static final ImagePicker _picker = ImagePicker();

  static Future<XFile?> pickImage(BuildContext context) async {
    final source = await showModalBottomSheet<ImageSource?>(
      context: context,
      builder: (_) => SafeArea(
        child: Padding(
          padding: context.ext.padding.all.md,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(AppIcons.camera),
                title: const Text('Camera'),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(AppIcons.gallery),
                title: const Text('Gallery'),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
            ],
          ),
        ),
      ),
    );

    if (source == null) return null;

    final pickedImage = await _picker.pickImage(source: source);
    return pickedImage;
  }

  static Future<CroppedFile?> cropImage({
    required String path,
    required double ratioX,
    required double ratioY,
  }) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatio: CropAspectRatio(
        ratioX: ratioX,
        ratioY: ratioY,
      ),
    );

    return croppedFile;
  }

  static Future<CroppedFile?> pickAndCropImage({
    required BuildContext context,
    required double ratioX,
    required double ratioY,
  }) async {
    return pickImage(context).then((pickedImage) {
      if (pickedImage == null) return null;

      return cropImage(
        path: pickedImage.path,
        ratioX: ratioX,
        ratioY: ratioY,
      );
    });
  }
}
