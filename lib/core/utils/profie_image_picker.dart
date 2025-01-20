import 'package:flutter/material.dart';
import 'package:penta_core/penta_core.dart';
import 'package:penta_story/core/utils/image_picker_and_crop_util.dart';

final class ProfieImagePicker {
  const ProfieImagePicker._();

  static Future<String?> pickProfileImage({
    required BuildContext context,
  }) async {
    final pickedImage = await ImagePickerUtil.pickAndCropImage(
      context: context,
      ratioX: 1,
      ratioY: 1,
    );

    final imageBytes = await pickedImage?.readAsBytes();
    final image = imageBytes?.ext.convert.toBase64;
    return image;
  }
}
