import 'package:dodi/view/analyzing_view.dart';
import 'package:dodi/view/class_select_view.dart';
import 'package:dodi/view/evaluation_overview_view.dart';
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
      theme: ThemeData().copyWith(
          primaryColor: Color(0xFF1C742C),
          backgroundColor: Color(0xFFF38424),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              onPrimary: Color(0xFFF38424),
              primary: Color(0xFFF38424),
            ),
          ),
          bottomAppBarColor: Color(0xFFE9F0D0)),
      routes: {
        '/': (context) => IntroductionPage(),
        '/login': (context) => LoginView(),
        '/register': (context) => SignUpView(),
        '/classSelect': (context) => ClassSelectView(),
        '/startTest': (context) => TestIntroductionView(),
        '/quizPage': (context) => QuestionView(),
        '/analyzingPage': (context) => AnalyzingView(),
        '/resultPage': (context) => ResultView(),
        '/evaluationOverview': (context) => EvaluationOverviewView(),
      },
    );
  }
}
