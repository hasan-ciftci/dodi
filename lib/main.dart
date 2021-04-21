import 'package:dodi/view/analyzing_view.dart';
import 'package:dodi/view/class_select_view.dart';
import 'package:dodi/view/login_view.dart';
import 'package:dodi/view/onboarding_view.dart';
import 'package:dodi/view/question_view.dart';
import 'package:dodi/view/result_view.dart';
import 'package:dodi/view/sign_up_view.dart';
import 'package:dodi/view/test_introduction_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      routes: {
        '/': (context) => IntroductionPage(),
        '/login': (context) => LoginView(),
        '/register': (context) => SignUpView(),
        '/classSelect': (context) => ClassSelectView(),
        '/startTest': (context) => TestIntroductionView(),
        '/quizPage': (context) => QuestionView(),
        '/analyzingPage': (context) => AnalyzingView(),
        '/resultPage': (context) => ResultView(),
      },
    );
  }
}
