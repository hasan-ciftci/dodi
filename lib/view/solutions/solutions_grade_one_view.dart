import 'package:dodi/core/constants/image_constants.dart';
import 'package:dodi/core/enums/selected_option_enum.dart';
import 'package:flutter/material.dart';

import '../finish_test_screen.dart';

class SolutionsView extends StatefulWidget {
  @override
  _SolutionsViewState createState() => _SolutionsViewState();
}

class _SolutionsViewState extends State<SolutionsView>
    with TickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;
  int instantValueOfTabController;

  List<QuestionModel> questions;
  bool solutionShowing = false;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
    _tabController.animation.addListener(() {
      instantValueOfTabController = _tabController.animation.value.round();
      if (instantValueOfTabController != _currentIndex)
        setState(() {
          _currentIndex = (_tabController.animation.value).round();
        });
    });

    questions = [
      QuestionModel(
        questionText:
            "Yukarıda verilen şeklin kapalı hali aşağıdakilerden hangisidir?",
        questionImage: ImageConstants.instance.soru1,
        optionAImage:
            ImageConstants.instance.questionOptions1(option: SelectedOption.A),
        optionBImage:
            ImageConstants.instance.questionOptions1(option: SelectedOption.B),
        optionCImage:
            ImageConstants.instance.questionOptions1(option: SelectedOption.C),
      ),
      QuestionModel(
        questionText:
            "Yönerge 1: Kırmızı üçgenler sonda değildir.\nYönerge 2: Sarı üçgen kırmızı üçgenlerin solundadır.\n\nYukarıda verilen yönergelere göre üçgenlerin doğru sıralanışı aşağıdakilerden hangisidir?",
        questionImage: ImageConstants.instance.soru2,
        optionAImage:
            ImageConstants.instance.questionOptions2(option: SelectedOption.A),
        optionBImage:
            ImageConstants.instance.questionOptions2(option: SelectedOption.B),
        optionCImage:
            ImageConstants.instance.questionOptions2(option: SelectedOption.C),
      ),
      QuestionModel(
        questionText:
            "Yukarıda verilen yönergelere göre üçgenlerin doğru sıralanışı aşağıdakilerden hangisidir?",
        questionImage: ImageConstants.instance.soru3,
        optionAImage:
            ImageConstants.instance.questionOptions3(option: SelectedOption.A),
        optionBImage:
            ImageConstants.instance.questionOptions3(option: SelectedOption.B),
        optionCImage:
            ImageConstants.instance.questionOptions3(option: SelectedOption.C),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          buildBackground(size, context),
          TabBarView(controller: _tabController, children: [
            ...List.generate(
              questions.length,
              (index) => TabItem(
                size: size,
                child: buildQuestionCard(
                  size: size,
                  index: index,
                  questionModel: questions[index],
                ),
              ),
            ),
            FinishTestView(
              grade: 1,
              isSolutionReview: true,
            ),
          ]),
          AnimatedPositioned(
            top: solutionShowing ? 0 : -(size.height * .6),
            curve: Curves.easeInOutSine,
            duration: Duration(milliseconds: 500),
            child: Container(
              margin: EdgeInsets.only(top: size.height * .14),
              padding: EdgeInsets.all(24),
              height: size.height * .5,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0, 2),
                    blurRadius: 10,
                  )
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Image.asset(ImageConstants.instance.video),
                  Spacer(),
                  Text(
                    "1. Sınıflar için Görsel Algı ve Dikkat Testi Soru Çözüm Videosu",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Color(0xFF737373)),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          buildPageHeader(size, _tabController),
          buildNextButton(size),
        ],
      ),
    );
  }

  buildQuestionCard(
      {@required Size size,
      @required int index,
      @required QuestionModel questionModel}) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 32.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Image.asset(questionModel.questionImage),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    questionModel.questionText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: buildOption(
                      selectedOption: SelectedOption.A,
                      size: size,
                      index: index,
                      image: questionModel.optionAImage,
                      text: questionModel.optionBImage),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: buildOption(
                      selectedOption: SelectedOption.B,
                      size: size,
                      index: index,
                      image: questionModel.optionBImage,
                      text: questionModel.optionBImage),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: buildOption(
                      selectedOption: SelectedOption.C,
                      size: size,
                      index: index,
                      image: questionModel.optionCImage,
                      text: questionModel.optionBImage),
                ),
              ],
            ),
          ),
        ),
        index == 0 || index == 2
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Doğru Cevap Verildi",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.green),
                  ),
                ),
              )
            : Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Yanlış Cevap Verildi",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.red),
                  ),
                ),
              ),
      ],
    );
  }

  Row buildOption(
      {@required Size size,
      @required SelectedOption selectedOption,
      @required int index,
      String image,
      String text}) {
    Color getColor() {
      if ((index == 0 && selectedOption == SelectedOption.C) ||
          (index == 1 && selectedOption == SelectedOption.B) ||
          (index == 2 && selectedOption == SelectedOption.A)) {
        return Colors.green;
      }
      if (index == 1 && selectedOption == SelectedOption.C) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    }

    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: getColor(),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: size.height * .035,
            child: Text(
              selectedOption.optionTitle,
              style: Theme.of(context).textTheme.headline4.copyWith(
                    color: getColor(),
                  ),
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Flexible(
          child: Center(
            child: Image.asset(image),
          ),
        )
      ],
    );
  }

  Align buildPageHeader(Size size, TabController tabController) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: size.height * .140,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: SafeArea(
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Theme.of(context).backgroundColor,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            solutionShowing = !solutionShowing;
                          });
                        },
                        child: AnimatedOpacity(
                          duration: Duration(milliseconds: 250),
                          opacity: _currentIndex == _tabController.length - 1
                              ? 0
                              : 1,
                          child: Column(
                            children: [
                              SizedBox(
                                height: size.height * .05,
                                width: size.height * .05,
                                child: Image.asset(solutionShowing
                                    ? ImageConstants.instance.camera_off
                                    : ImageConstants.instance.camera),
                              ),
                              Text(
                                  solutionShowing
                                      ? "Çözümü Kapat"
                                      : "Çözümü İzle",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Theme.of(context).primaryColor)),
                            ],
                          ),
                        )),
                    Text(
                      "1. sınıf",
                      style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * .01,
                      color: Theme.of(context).disabledColor,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      width: size.width *
                          (_currentIndex + 1) /
                          (tabController.length - 1),
                      height: size.height * .01,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedOpacity buildNextButton(Size size) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 250),
      opacity: _currentIndex == _tabController.length - 1 ? 0 : 1,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: size.height * .125,
          child: Center(
            child: SizedBox(
              height: size.height * .08,
              width: size.width * .9,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentIndex < _tabController.length - 1)
                    _tabController.animateTo(_currentIndex + 1,
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.easeInOut);
                },
                child: Text(
                  "İleri",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(StadiumBorder()),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildBackground(Size size, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(color: Theme.of(context).backgroundColor),
        ),
        Expanded(
          child: Container(color: Theme.of(context).primaryColor),
        )
      ],
    );
  }
}

class QuestionModel {
  final String questionText;
  final String questionImage;
  final String optionAImage;
  final String optionBImage;
  final String optionCImage;

  QuestionModel(
      {@required this.questionText,
      @required this.questionImage,
      @required this.optionAImage,
      @required this.optionBImage,
      @required this.optionCImage});
}

class TabItem extends StatelessWidget {
  final Widget child;

  const TabItem({
    Key key,
    @required this.size,
    @required this.child,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: size.height * .14),
        height: size.height * .73,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50)),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
