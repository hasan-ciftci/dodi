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

  String getCourseImage(int courseIndex) =>
      _courses[courseIndex];

  String get analysingIcon => "analyzing".toPng;
  String get line => "line".toPng;
  String get result => "result".toPng;
  String get profile => "profile".toPng;
  String get penVector => "pen_vector".toPng;
  String get penVectorOrange => "pen_vector_orange".toPng;
  String get comparisonGraph => "comparison_graph".toPng;

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

  String get _science => "science".courseToPng;
  String get _general => "general".courseToPng;
  String get _lifeStudies => "life_studies".courseToPng;
  String get _english => "english".courseToPng;
  String get _maths => "maths".courseToPng;
  String get _turkish => "turkish".courseToPng;
  String get _intelligence => "intelligence".courseToPng;
  String get _homeworks => "homeworks".courseToPng;

  List<String> get _courses => [
    _maths,
    _turkish,
    _lifeStudies,
    _intelligence,
    _english,
    _science,
    _general,
    _homeworks
  ];
}
