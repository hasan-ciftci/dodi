part of '../constants/image_constants.dart';

extension _ImageExtension on String {
  String get classToPng => 'assets/image/classes/$this.png';
  String get toPng => 'assets/image/$this.png';
  String get mockQuestionToPng => 'assets/image/mockquestions/$this.png';
}
