import 'package:flutter/material.dart';

import '../core/constants/image_constants.dart';
import 'finish_test_screen.dart';

class QuestionView extends StatefulWidget {
  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<QuestionModel> questions = [
      QuestionModel(
        questionImage: ImageConstants.instance.soru1,
        answerImage: ImageConstants.instance.cevap1,
        text: 'Yukarıda verilen şeklin kapalı hali aşağıdakilerden hangisidir?',
      ),
      QuestionModel(
        questionImage: ImageConstants.instance.soru2,
        answerImage: ImageConstants.instance.cevap2,
        text:
            'Yönerge 1: Kırmızı üçgenler sonda değildir. Yönerge 2: Sarı üçgen kırmızı üçgenlerin solundadır.\n\nYukarıda verilen yönergelere göre üçgenlerin doğru sıralanışı aşağıdakilerden hangisidir?',
      ),
      QuestionModel(
        questionImage: ImageConstants.instance.soru3,
        answerImage: ImageConstants.instance.cevap3,
        text:
            'Yukarıda verilen sıralamaya göre soru işareti yerine aşağıdakilerden hangisi gelmelidir?',
      ),
    ];
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          buildBackground(size, context),
          buildPageHeader(size, _tabController),
          TabBarView(controller: _tabController, children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height * .75,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                    child: QuestionCard(
                      size: size,
                      questionText: questions[0].text,
                      questionAnswer: questions[0].answerImage,
                      questionImage: questions[0].questionImage,
                    ),
                  ),
                ),
                Options(size: size),
              ],
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height * .75,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                    child: QuestionCard(
                      size: size,
                      questionText: questions[1].text,
                      questionAnswer: questions[1].answerImage,
                      questionImage: questions[1].questionImage,
                    ),
                  ),
                ),
                Options(size: size),
              ],
            ),
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height * .75,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      color: Colors.white,
                    ),
                    child: QuestionCard(
                      size: size,
                      questionText: questions[2].text,
                      questionAnswer: questions[2].answerImage,
                      questionImage: questions[2].questionImage,
                    ),
                  ),
                ),
                Options(size: size),
              ],
            ),
            FinishTestView(),
          ]),
        ],
      ),
    );
  }

  Align buildPageHeader(Size size, TabController tabController) {
    tabController.addListener(() {
      setState(() {});
    });
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: size.height * .125,
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Theme.of(context).backgroundColor,
                    ),
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
                          (tabController.index + 1) /
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

class Option extends StatelessWidget {
  const Option({
    Key key,
    this.size,
    this.color,
    this.option,
  }) : super(key: key);

  final Color color;
  final Size size;
  final String option;

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    print(color.toString());
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: CircleAvatar(
          backgroundColor: color,
          radius: size.height * .045,
          child: Text(
            option,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}

class QuestionCard extends StatefulWidget {
  final String questionImage;
  final String questionAnswer;
  final String questionText;
  final Size size;

  const QuestionCard(
      {Key key,
      @required this.questionImage,
      @required this.questionAnswer,
      @required this.questionText,
      @required this.size})
      : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildQuestionImage(),
        buildQuestionText(widget.size, context),
        buildAnswer(),
      ],
    );
  }

  Expanded buildQuestionImage() {
    return Expanded(
      child: Image.asset(widget.questionImage),
    );
  }

  Expanded buildQuestionText(Size size, BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * .1,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SingleChildScrollView(
              child: Text(
                widget.questionText,
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildAnswer() {
    return Expanded(
      child: Image.asset(widget.questionAnswer),
    );
  }
}

class QuestionModel {
  final String questionImage;
  final String answerImage;
  final String text;

  QuestionModel(
      {@required this.questionImage,
      @required this.answerImage,
      @required this.text});
}

enum SelectedOption { A, B, C }

class Options extends StatefulWidget {
  final Size size;

  const Options({Key key, this.size}) : super(key: key);

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  SelectedOption selectedOption;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: widget.size.height * .125,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = SelectedOption.A;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: selectedOption == SelectedOption.A
                        ? Theme.of(context).backgroundColor
                        : Theme.of(context).primaryColor,
                    radius: widget.size.height * .045,
                    child: Text(
                      "A",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = SelectedOption.B;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: selectedOption == SelectedOption.B
                        ? Theme.of(context).backgroundColor
                        : Theme.of(context).primaryColor,
                    radius: widget.size.height * .045,
                    child: Text(
                      "B",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = SelectedOption.C;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: selectedOption == SelectedOption.C
                        ? Theme.of(context).backgroundColor
                        : Theme.of(context).primaryColor,
                    radius: widget.size.height * .045,
                    child: Text(
                      "C",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
