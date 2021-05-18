import 'dart:io';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPath;

class ImagePickerProvider with ChangeNotifier {
  File image;
  String imageTitle;
  final picker = ImagePicker();

  void setImageTitle(String title) {
    imageTitle = title;
  }

  Future<void> getImage() async {
    PickedFile pickedImage = await picker.getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      print(pickedImage.path);
      notifyListeners();
      return image;
    } else {
      print("unable to snap image from the phone");
    }
    //in case of failure
    return Future.value();
  }
}
