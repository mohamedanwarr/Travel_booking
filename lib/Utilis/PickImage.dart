import 'package:image_picker/image_picker.dart';
import 'package:travelbooking/Utilis/utilis.dart';

pickImage(ImageSource source)async{
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
  }
  Utilis.showStyledSnackBar('No Image Selected ', isSuccess: false);
  return null; // Return null when no image is selected
}