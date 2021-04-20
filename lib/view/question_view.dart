import 'package:dodi/core/constants/image_constants.dart';
import 'package:flutter/material.dart';

class QuestionView extends StatefulWidget {
  @override
  _QuestionViewState createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: [
          buildBackground(size, context),
          buildPageHeader(size),
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
              child: Column(
                children: [
                  buildQuestionImage(),
                  buildQuestionText(size, context),
                  buildAnswer(),
                ],
              ),
            ),
          ),
          buildPageFooter(size),
        ],
      ),
    );
  }

  Expanded buildQuestionImage() {
    return Expanded(
      child: Image.asset(ImageConstants.instance.soru1),
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
          child: SingleChildScrollView(
            child: Text(
              "Yönerge 1: Kırmızı üçgenler sonda değildir.\nYönerge 2: Sarı üçgen kırımızı üçgenlerin solundadır\n\nYukarıda verilen yönergelere göre üçgenlerin doğru sıralanışı aşağıdakilerden hangisidir?",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildAnswer() {
    return Expanded(
      child: Image.asset(ImageConstants.instance.cevap1),
    );
  }

  Align buildPageHeader(Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: size.height * .125,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(Icons.arrow_back_ios_outlined),
                  Text("1. sınıf"),
                ],
              ),
              Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * .01,
                    color: Theme.of(context).disabledColor,
                  ),
                  Container(
                    width: size.width * .5,
                    height: size.height * .01,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildBackground(Size size, BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.5],
          colors: [
            Theme.of(context).backgroundColor,
            Theme.of(context).primaryColor,
          ],
        ),
      ),
    );
  }

  Align buildPageFooter(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * .125,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Option(
              color: Theme.of(context).primaryColor,
              size: size,
              option: "A",
            ),
            Option(
              color: Theme.of(context).primaryColor,
              size: size,
              option: "B",
            ),
            Option(
              color: Theme.of(context).primaryColor,
              size: size,
              option: "C",
            ),
          ],
        ),
      ),
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
    return GestureDetector(
      onTap: () => print(option),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: size.height * .045,
            child: Text(
              option,
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ),
    );
  }
}
