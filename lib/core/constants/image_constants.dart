import 'package:dodi/core/enums/selected_option_enum.dart';

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

  String getNewClassImage(int classNumber) =>
      (classNumber + 1).toString().newClassToPng;

  String getCourseImage(int courseIndex) =>
      _courses[courseIndex];

  String getLastQuizzImage(int courseIndex) =>
      _lastQuizzes[courseIndex];

  String get analysingIcon => "analyzing".toPng;
  String get line => "line".toPng;
  String get result => "result".toPng;
  String get profile => "profile".toPng;
  String get penVector => "pen_vector".toPng;
  String get penVectorOrange => "pen_vector_orange".toPng;
  String get comparisonGraph => "comparison_graph".toPng;
  String get camera => "camera".toPng;
  String get camera_off => "camera_off".toPng;
  String get video => "video".toPng;

  String get soru1 => "soru1".mockQuestionToPng;
  String get soru2 => "soru2".mockQuestionToPng;
  String get soru3 => "soru3".mockQuestionToPng;

  String get soru1_12 => "soru1_12".mockQuestionToPng;
  String get soru3_12 => "soru3_12".mockQuestionToPng;
  String  questionOptions1({SelectedOption option}) =>
      "1${option.optionTitle.toLowerCase()}".mockQuestionToPng;
  String  questionOptions2({SelectedOption option}) =>
      "2${option.optionTitle.toLowerCase()}".mockQuestionToPng;
  String  questionOptions3({SelectedOption option}) =>
      "3${option.optionTitle.toLowerCase()}".mockQuestionToPng;

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

  String get _lastQuiz1 => "lastQuiz1".lastQuizToPng;
  String get _lastQuiz2 => "lastQuiz2".lastQuizToPng;
  String get _lastQuiz3 => "lastQuiz3".lastQuizToPng;
  String get _lastQuiz4 => "lastQuiz4".lastQuizToPng;

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
  List<String> get _lastQuizzes => [
    _lastQuiz1,
    _lastQuiz2,
    _lastQuiz3,
    _lastQuiz4,
  ];
}
