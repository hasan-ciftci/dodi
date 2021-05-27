import 'package:dodi/view/course_select_view.dart';
import 'package:dodi/view/create_profile_view.dart';
import 'package:dodi/view/new_class_select.dart';
import 'package:dodi/view/onboarding_view.dart';
import 'package:dodi/view/shop_view.dart';
import 'package:dodi/view/solutions/solutions_grade_one_view.dart';
import 'package:dodi/view/quiz/quiz_grade_twelve_view.dart';
import 'package:dodi/view/solutions/solutions_grade_twelve_view.dart';
import 'package:dodi/view/solved_tests_view.dart';

import 'package:dodi/view/subject_select_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/profile_cubit.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => BlocProvider<ProfileCubit>(
        create: (BuildContext context) {
          return ProfileCubit();
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) => MediaQuery(
            child: child,
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          ),
          title: 'Flutter Demo',
          theme: ThemeData().copyWith(
              disabledColor: Color(0xFF737373),
              toggleableActiveColor: Color(0xFF6AC7EC),
              primaryColor: Color(0xFF3494BC),
              primaryColorLight: Color(0xFF6AC7EC),
              backgroundColor: Color(0xFF7A7FF5),
              accentColor: Color(0xFF3494BC),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  onPrimary: Color(0xFF7A7FF5),
                  primary: Color(0xFF7A7FF5),
                ),
              ),
              bottomAppBarColor: Color(0xFFFFFFFF),
              textTheme: TextTheme(
                bodyText1:
                    ThemeData().textTheme.bodyText1.copyWith(fontSize: 16.sp),
                bodyText2:
                    ThemeData().textTheme.bodyText2.copyWith(fontSize: 14.sp),
                headline1:
                    ThemeData().textTheme.headline1.copyWith(fontSize: 96.sp),
                headline2:
                    ThemeData().textTheme.headline2.copyWith(fontSize: 60.sp),
                headline3:
                    ThemeData().textTheme.headline3.copyWith(fontSize: 48.sp),
                headline4:
                    ThemeData().textTheme.headline4.copyWith(fontSize: 34.sp),
                headline5:
                    ThemeData().textTheme.headline5.copyWith(fontSize: 24.sp),
                headline6:
                    ThemeData().textTheme.headline6.copyWith(fontSize: 20.sp),
                subtitle1:
                    ThemeData().textTheme.subtitle1.copyWith(fontSize: 16.sp),
                subtitle2:
                    ThemeData().textTheme.subtitle2.copyWith(fontSize: 14.sp),
                button: ThemeData().textTheme.button.copyWith(fontSize: 14.sp),
                caption:
                    ThemeData().textTheme.caption.copyWith(fontSize: 12.sp),
                overline:
                    ThemeData().textTheme.overline.copyWith(fontSize: 10.sp),
              )),
          routes: {
            '/': (context) => IntroductionPage(),
            '/loginView': (context) => LoginView(),
            '/register': (context) => SignUpView(),
            '/classSelectView': (context) => ClassSelectView(),
            '/startTest': (context) => TestIntroductionView(),
            '/questionView': (context) => QuizGradeOneView(),
            '/quizGradeTwelveView': (context) => QuizGradeTwelveView(),
            '/analyzingPage': (context) => AnalyzingView(),
            '/resultPage': (context) => ResultView(),
            '/evaluationOverview': (context) => EvaluationOverviewView(),
            '/phoneRegister': (context) => PhoneRegisterView(),
            '/chooseProfile': (context) => ChooseProfileView(),
            '/createProfile': (context) => CreateProfileView(),
            '/courseSelectView': (context) => CourseSelectView(),
            '/subjectSelectView': (context) => SubjectSelectView(),
            '/newClassSelectView': (context) => NewClassSelectView(),
            '/solvedTestsView': (context) => SolvedTestsView(),
            '/solutionsView': (context) => SolutionsView(),
            '/solutionsGradeTwelveView': (context) =>
                SolutionsGradeTwelveView(),
            '/shopView': (context) => ShopView(),
          },
        ),
      ),
    );
  }
}
