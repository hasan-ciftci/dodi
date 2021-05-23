import 'package:dodi/view/choose_profile_extra.dart';
import 'package:dodi/view/course_select_view.dart';
import 'package:dodi/view/create_profile_view.dart';
import 'package:dodi/view/new_class_select.dart';
import 'package:dodi/view/quiz/quiz_grade_twelve_view.dart';
import 'package:dodi/view/subject_select_view.dart';
import 'package:flutter/material.dart';

import 'view/analyzing_view.dart';
import 'view/choose_profile_view.dart';
import 'view/class_select_view.dart';
import 'view/evaluation_overview_view.dart';
import 'view/login_view.dart';
import 'view/phone_register_view.dart';
import 'view/quiz/quiz_grade_one_view.dart';
import 'view/result_view.dart';
import 'view/sign_up_view.dart';
import 'view/test_introduction_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
          toggleableActiveColor: Color(0xFFF38424),
          primaryColor: Color(0xFF1C742C),
          backgroundColor: Color(0xFFF38424),
          accentColor: Color(0xFF1C742C),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              onPrimary: Color(0xFFF38424),
              primary: Color(0xFFF38424),
            ),
          ),
          bottomAppBarColor: Color(0xFFE9F0D0)),
      routes: {
        // '/': (context) => IntroductionPage(),
        '/login': (context) => LoginView(),
        '/register': (context) => SignUpView(),
        '/classSelect': (context) => ClassSelectView(),
        '/startTest': (context) => TestIntroductionView(),
        '/questionView': (context) => QuizGradeOneView(),
        '/analyzingPage': (context) => AnalyzingView(),
        '/resultPage': (context) => ResultView(),
        '/evaluationOverview': (context) => EvaluationOverviewView(),
        '/phoneRegister': (context) => PhoneRegisterView(),
        '/chooseProfile': (context) => ChooseProfileView(),
        '/createProfile': (context) => CreateProfileView(),
        //Same with Choose Profile but included one more profile for scenerio.
        '/chooseProfileExtra': (context) => ChooseProfileExtra(),
        '/courseSelectView': (context) => CourseSelectView(),
        '/subjectSelectView': (context) => SubjectSelectView(),
        '/newClassSelectView': (context) => NewClassSelect(),

        ///silinecek
        '/': (context) => QuizGradeTwelveView(),
      },
    );
  }
}
