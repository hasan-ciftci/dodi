import 'package:dodi/core/constants/image_constants.dart';
import 'package:flutter/material.dart';

class TestIntroductionView extends StatefulWidget {
  @override
  _TestIntroductionViewState createState() => _TestIntroductionViewState();
}

class _TestIntroductionViewState extends State<TestIntroductionView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          buildBackground(size, context),
          buildPageHeader(size),
          buildBody(size, context),
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
              Icon(Icons.arrow_back_ios_outlined),
              Text("1. Sınıf"),
            ],
          ),
        ),
      ),
    );
  }

  Align buildBody(Size size, BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: size.height * .75,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            buildTestIntroductionImage(size),
            buildTestIntroductionText(size, context),
            buildStartTestButton(size, context)
          ],
        ),
      ),
    );
  }

  Image buildTestIntroductionImage(Size size) {
    return Image.asset(
      ImageConstants.instance.getClassImage(0),
      height: size.height * .4,
      width: size.width * .4,
      fit: BoxFit.contain,
    );
  }

  SizedBox buildTestIntroductionText(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * .2,
      child: Text(
        "Sınıflar için Görsel Algı ve Dikkat Testi",
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  SizedBox buildStartTestButton(Size size, BuildContext context) {
    return SizedBox(
      height: size.height * .15,
      child: Center(
        child: SizedBox(
          height: size.height * .08,
          width: size.width * .9,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/quizPage');
            },
            child: Text(
              "Teste Başla",
              style: Theme.of(context).textTheme.headline5,
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
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
}
