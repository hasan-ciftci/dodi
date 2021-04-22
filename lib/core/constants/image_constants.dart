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
  String get line => "line".toPng;
  String get result => "result".toPng;

  String get soru1 => "soru1".mockQuestionToPng;
  String get soru2 => "soru2".mockQuestionToPng;
  String get soru3 => "soru3".mockQuestionToPng;
  String get cevap1 => "cevap1".mockQuestionToPng;
  String get cevap2 => "cevap2".mockQuestionToPng;
  String get cevap3 => "cevap3".mockQuestionToPng;

  String get introduction1 => "1".introductionToPng;
  String get introduction2 => "2".introductionToPng;
  String get introduction3 => "3".introductionToPng;

  String get facebook => "facebook".socialMediaToPng;
  String get google => "google".socialMediaToPng;
}
