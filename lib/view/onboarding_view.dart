import 'package:dodi/core/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        fit: StackFit.loose,
        children: [
          buildBody(size, context),
          buildPageFooter(size),
        ],
      ),
    );
  }

  Align buildBody(Size size, BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
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
            Spacer(flex: 15),
            Expanded(
              flex: 40,
              child: buildIntroductionImage(),
            ),
            Expanded(
              flex: 30,
              child: buildIntroductionText(size, context),
            ),
            Spacer(flex: 15),
          ],
        ),
      ),
    );
  }

  Image buildIntroductionImage() =>
      Image.asset(ImageConstants.instance.introduction1);

  Center buildIntroductionText(Size size, BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .2),
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }

  Align buildPageFooter(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.height * .250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildPageIndicators(size),
            buildNextButton(size),
          ],
        ),
      ),
    );
  }

  Center buildPageIndicators(Size size) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(color: Colors.white),
          ),
          height: size.width * .02,
          width: size.width * .02,
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(color: Colors.white),
          ),
          height: size.width * .02,
          width: size.width * .02,
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(color: Colors.white),
          ),
          height: size.width * .02,
          width: size.width * .02,
        ),
      ],
    ));
  }

  Container buildNextButton(Size size) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(right: size.width * .1),
        child: Text(
          "Geç",
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
