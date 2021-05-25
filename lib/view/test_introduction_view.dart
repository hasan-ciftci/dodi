import 'package:dodi/view/quiz/quiz_grade_one_view.dart';
import 'package:dodi/view/quiz/quiz_grade_twelve_view.dart';
import 'package:flutter/material.dart';

import '../core/constants/image_constants.dart';

class TestIntroductionView extends StatefulWidget {
  final int grade;

  const TestIntroductionView({Key key, this.grade}) : super(key: key);

  @override
  _TestIntroductionViewState createState() => _TestIntroductionViewState();
}

class _TestIntroductionViewState extends State<TestIntroductionView> {
  bool isDetailShowed = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size),
          buildBody(size),
          buildPageHeader(size),
          buildFooter(size)
        ],
      ),
    );
  }

  Align buildPageHeader(Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: size.height * .125,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
              ),
              Text("1. Sınıf",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Align buildBody(Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: AnimatedContainer(
        margin: EdgeInsets.only(
          top: size.height * .125,
        ),
        height: isDetailShowed ? size.height * .6 : size.height * .75,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),
        duration: Duration(milliseconds: 250),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                buildTestIntroductionImage(size),
                buildTestIntroductionText(size, context),
                buildStartTestButton(size, context),
              ],
            ),
            Visibility(
              visible: isDetailShowed ? false : true,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isDetailShowed = true;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Text("Test Detayları"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Image buildTestIntroductionImage(Size size) {
    return Image.asset(
      widget.grade == 1
          ? ImageConstants.instance.getNewClassImage(0)
          : ImageConstants.instance.getNewClassImage(11),
      height: size.height * .35,
      width: size.width * .35,
      fit: BoxFit.contain,
    );
  }

  Text buildTestIntroductionText(Size size, BuildContext context) {
    return Text(
      "1. Sınıflar için Görsel Algı ve Dikkat Testi",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }

  Padding buildStartTestButton(Size size, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: size.height * .08,
        width: size.width * .9,
        child: ElevatedButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => widget.grade == 1
                  ? QuizGradeOneView()
                  : QuizGradeTwelveView(),
            ),
          ),
          child: Text(
            "Teste Başla",
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
    );
  }

  AnimatedOpacity buildFooter(Size size) {
    return AnimatedOpacity(
      opacity: isDetailShowed ? 1 : 0,
      duration: Duration(seconds: 1),
      child: Visibility(
        visible: isDetailShowed ? true : false,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: size.height * .275,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Text(
                    "Çocukların görsel algılarını değerlendirmeye "
                    "yardımcı olan bir algı testidir. El-Göz "
                    "Koordinasyonu, Şekil-Zemin Ayırımı, Algılama "
                    "Sabitliği (Şekil Değişmezliği ), Mekânla Konumun"
                    " Algılanması (Uzaydaki Pozisyon) ,Mekân "
                    "İlişkilerinin (Uzay ilişkilerinin) Algılanması"
                    " olmak üzere 5 algısal beceriyi ölçen bir"
                    " performans testidir.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column buildBackground(Size size) {
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
