part of '../constants/image_constants.dart';

extension _ImageExtension on String {
  String get classToPng => 'assets/image/classes/$this.png';
  String get newClassToPng => 'assets/image/newclasses/$this.png';
  String get courseToPng => 'assets/image/courses/$this.png';
  String get lastQuizToPng => 'assets/image/lastquizzes/$this.png';
  String get toPng => 'assets/image/$this.png';
  String get mockQuestionToPng => 'assets/image/mockquestions/$this.png';
  String get introductionToPng => 'assets/image/introduction/$this.png';
  String get socialMediaToPng => 'assets/image/socialmedia/$this.png';
}
