import 'package:flutter/material.dart';

import '../core/constants/image_constants.dart';

class FinishTestView extends StatefulWidget {
  @override
  _FinishTestViewState createState() => _FinishTestViewState();
}

class _FinishTestViewState extends State<FinishTestView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        buildBody(size, context),
      ],
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
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50)),
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
              Navigator.of(context).pushNamed('/analyzingPage');
            },
            child: Text(
              "Testi bitir",
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
