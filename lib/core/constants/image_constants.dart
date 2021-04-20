part '../extension/image_extension.dart';

class ImageConstants {
  static ImageConstants _instance;

  static ImageConstants get instance {
    if (_instance != null) return _instance;
    _instance = ImageConstants._init();
    return _instance;
  }

  ImageConstants._init();

  String getClassImage(int classNumber) =>
      (classNumber + 1).toString().classToPng;

  String get analysingIcon => "analyzing".toPng;
}
