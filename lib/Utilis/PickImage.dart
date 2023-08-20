import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travelbooking/Utilis/utilis.dart';

pickImage(ImageSource source)async{
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  Utilis.showStyledSnackBar('No Image Selected ', isSuccess: false);
  return null; // Return null when no image is selected
}